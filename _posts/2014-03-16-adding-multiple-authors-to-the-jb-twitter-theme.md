---
layout: post
title: "Adding multiple authors to the JB Twitter theme"
description: "How we did it"
author: stpyang
tags: [metablog,liquid,jekyll,intro]
---
{% include JB/setup %}

One of the most delightful aspects of creating this blog is learning
how to use [Jekyll Bootstrap](http://jekyllbootstrap.com).  The
default twitter theme for JB only supports only author.  In this post
we describe how we made minimal changes to five files in order to add
support for multiple authors.

In the snippets below, we have grayed out the parts of the files which have
not been changed, in order to emphasize the parts which have been changed.

## Step 1: Change the _config.yml file##

We first reformatted the author section in the `_config.yml` to support
more than one author.

<pre><code><font color="gray"># Themes are encouraged to use these universal variables 
# so be sure to set them if your theme uses them.
#
title : Jekyll Bootstrap
tagline: Site Tagline</font>
  authors :
    author1: 
      name : Name1 Lastname1
      email : blah1@email.test 
      github : username1 
      twitter : username1
      feedburner : feedname1 
      copyright : true 
    author2: 
      name : Name2 Lastname2
      email : blah2@email.test 
      github : username2 
      twitter : username2
      feedburner : feedname2
      copyright : true 
    guest: 
      name : Name Lastname 
      email : blah@email.test 
      github : username 
      twitter : username 
      feedburner : feedname 
      copyright : false</code>
</pre>

The copyright field for each author should be set to true in order for
the author's name to appear in the copyright footer (see
[Step 4](#step4)) and false otherwise.  Guest authors have copyright
set to false.

##Step 2: Change the Rakefile##

We changed our Rakefile to add an `author:` field into the YAML Front
Matter of any newly generated post.  This is accomplished with in just
three lines plus one comment.

<pre>
<code># Usage: rake post title="A Title" [date="2012-02-09"][tags=[tag1,tag2]] [category="category] [author="author"]
<font color="gray">desc "Begin a new post in #{CONFIG['posts']}"
task :post do
  abort("rake aborted: '#{CONFIG['posts']}' directory not found.") unless FileTest.directory?(CONFIG['posts'])
  title = ENV["title"] || "new-post"
  <font color="black">author = ENV["author"] || ""
  author = "#{author.gsub(/-/,' ')}" if !author.empty?</font>
  tags = ENV["tags"] || "[]"
  category = ENV["category"] || ""
  category = "\"#{category.gsub(/-/,' ')}\"" if !category.empty?
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  begin
    date = (ENV['date'] ? Time.parse(ENV['date']) : Time.now).strftime('%Y-%m-%d')
  rescue => e
    puts "Error - date format must be YYYY-MM-DD, please check you typed it correctly!"
    exit -1
  end
  filename = File.join(CONFIG['posts'], "#{date}-#{slug}.#{CONFIG['post_ext']}")
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end
  
  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: \"#{title.gsub(/-/,' ')}\""
    <font color="black">post.puts "author: #{author}"</font>
    post.puts 'description: ""'
    post.puts "category: #{category}
    post.puts "tags: #{tags}"
    post.puts "---"
    post.puts "{% include JB/setup %}"
  end
end # task :post</font></code>
</pre>

The lines that we added are in black.  To create a new post using
rake, we now use the command ```rake post title="Hello World" author=author1```.

##Step 3: Create a signature##

Every post should be signed and dated by its author at the end of the
article.  We created a CSS signature class and append it to the end of
`assets/themes/twitter/css/style.css`.  Ours is blatantly copied from
the [mark-reid](https://github.com/jekyllbootstrap/theme-mark-reid)
theme.

    /* signature */
    .signature { 
      margin-top: 3em;
      position: relative;
    }
    .signature .author { 
      font-variant: small-caps; 
      font-style: normal; 
      color: black;
      display: block;
      margin-bottom: 1.5em;
    }
    .signature .date { 
      font-size: 87.5%;
      line-height: 1.5em;
      display: block; 
      font-variant: small-caps; 
      font-style: normal; 
      position: absolute;
      right: 0;
      top: 0;
    }
    .signature .location { 
      display: block; 
      font-size: 87.5%;
      line-height: 1.5em;
      position: absolute;
      right: 0;
      top: 1.5em;
    }
	
Next we add a corresponding signature section to
`_includes/themes/twitter/post.html` immediately after the content section.

<pre>
<code><font color="gray"><&lt;div class="row-fluid post-full"&gt;
  &lt;div class="span12"&gt;
    &lt;div class="content"&gt;
      &#123;&#123; content &#125;&#125;
    &lt;/div&gt;</font>

&#123;% assign author = site.authors[page.author] %&#125;
&lt;address class="signature"&gt;
  &lt;a class="author" href="&#123;&#123; HOME_PATH &#125;&#125;"&gt;&#123;&#123; author.name &#125;&#125;&lt;/a&gt; 
  &lt;span class="date"&gt;&#123;&#123; page.date | date_to_long_string &#125;&#125;&lt;/span&gt;
  &lt;span class="location"&gt;&#123;&#123; page.location &#125;&#125;&lt;/span&gt;
&lt;/address&gt;</font></code>
</pre>

A signature is now automatically generated for all posts and and looks like this.

> <p style="font-size:90%"><address class="signature">
 <address class="signature">
    <a class="author" href="/">Name1 Lastname1</a> 
    <span class="date">16 March 2014</span>
    <span class="location"></span></address></p>
  
##Step 4: Modify the copyright## {#step4}

We changed the copyright footer throughout the entire blog to contain
both of our names.  This step was the trickiest and involved
writing eleven lines of liquid-fu.  We replaced the footer in
`_include/themes/twitter/default.html` with:

<pre>
<code><font color="gray">&lt;footer&gt;
  &lt;p&gt;&amp;copy; &#123;&#123; site.time | date: '%Y' &#125;&#125;
  <font color="black">&#123;% assign firstcopyright = false %&#125;
  &#123;% for author in site.authors %&#125;
    &#123;% if author[1].copyright %&#125;
      &#123;% if firstcopyright == false %&#125;
        &#123;% assign firstcopyright = true %&#125;
      &#123;% else %&#125;
        and 
      &#123;% endif %&#125;
    &#123;&#123; author[1].name &#125;&#125;
    &#123;% endif %&#125;
  &#123;% endfor %&#125;</font>
  with help from &lt;a href="http://jekyllbootstrap.com" target="_blank" title="The Definitive Jekyll Blogging Framework"&gt;Jekyll Bootstrap&lt;/a&gt;
  and &lt;a href="http://twitter.github.com/bootstrap/" target="_blank"&gt;Twitter Bootstrap&lt;/a&gt;
  &lt;/p&gt;
&lt;/footer&gt;</font></code>
</pre>
 
The copyright footer now contains the name of all of the authors with
for whom `copyright = true` in the `_config.yml` file and looks
like this.

> <p style="font-size:90%">&copy; 2014 Name1 Lastname1 and Name2 Lastname2 with help from <a href="http://jekyllbootstrap.com" target="_blank" title="The Definitive Jekyll Blogging Framework">Jekyll Bootstrap</a> and <a href="http://twitter.github.com/bootstrap/" target="_blank">Twitter Bootstrap</a></p>

##Run jekyll with custom ports##

If we are writing articles on our two computers at home and both want
to run jekyll at the same time, we avoid port collisions by
specifying different port numbers.

```jekyll serve --port 4001```

##Conclusion##

The discussion above uses the twitter bootstrap theme but will carry
over easily to other themes with minimal effort.  Modifying the code
to support multiple authors has proved instructive to learning the
basics of liquid syntax and JB-based blogging.
