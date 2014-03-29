---
layout: post
title: "Dirichlet convolution"
author: christian
description: ""
tags: [projecteuler]
---

<div class="media">
<a class="pull-left">
<meta property="og:image" content="/assets/data/dirichlet.png" />
<img style="media-object; height:60%; width:60%;" src="/assets/data/dirichlet.png" alt="samantha bee is awesome"/>
</a>
</div>
 
When working on problems from
[Project Euler](https://projecteuler.net/) 
we found Dirichlet Convolutions to be a useful tool. Here we'll
discuss a particular result regarding the Euler Totient function that
has come in handy. We prove this result first using a combinatorial
argument and the we see how we can use the Dirichlet Convolution to
get a very short proof.

## The Result ##

Let $$\phi$$ denote the Euler Totient function, i.e. $$\phi(n)$$
denotes the number of integers less than $$n$$ that are relatively
prime to $$n$$. We may wish to compute the sum of Totient functions,
i.e.

$$\Phi(N) = \sum_{n = 1}^N \phi(n)$$.

For instance, this sum is used to express the number of terms in the
[Farey Sequence](http://en.wikipedia.org/wiki/Farey_sequence/) of
order N, which is $$\Phi(N)+1$$.

The result is the following relation involving $$\Phi(N)$$:

$$\sum_{k=1}^N \Phi(\lfloor N/k \rfloor) = \frac{N (N+1)}{2}$$.

This relation can be used to recursively compute $$\Phi(N)$$.

<!-- more -->

## Combinatorial Proof ##

Let $$S_N$$ denote the set of integer pairs $$(m,n)$$ with $$0 \leq m
< n \leq N$$. We wish to count the elements of $$S_N$$ in two
different ways to get both sides of the equation.

We can view $$S_N$$ as the lattice points under the diagonal in a
square with side length $$N+1$$. Thus the number of elements of
$$S_N$$ is $$N (N+1)/2$$. This gives us the right hand side of our
result.

Another way of counting is to partition $$S_N$$ in the subsets 

$$S^d_N = \{(m,n) \in S_N \ : \ \gcd(m,n)=d \}$$

for $$1 \leq d \leq N$$. We claim that the number of elements in
$$S^d_N$$ is $$\Phi(\lfloor N/d \rfloor)$$. To see this, fix an
integer $$n \leq N$$ such that $$d \mid n$$, and let $$n'=n/d$$. Then
counting the number of integers $$m < n$$ such that $$\gcd(m,n)=d$$ is
the same as counting the number of integers $$m' < n'$$ such that
$$\gcd(m',n')=1$$, and this number is $$\phi(n')$$. Thus we have that
the number of elements of $$S^d_N$$ is

$$\sum_{n'=1}^{\lfloor N/d \rfloor} \phi(n') = \Phi(\lfloor N/d \rfloor)$$.

We conclude that $$S_N$$ has $$\sum_{d=1}^N \Phi(\lfloor N/d
\rfloor)$$ elements, which proves our result.

## Dirichlet convolution ##

Here we show how to use 
[Dirichlet convolution](http://en.wikipedia.org/wiki/Dirichlet_convolution)
and generalized Dirichlet convolution to get a very short algebraic
proof of a generalized version of our result.

We start with some terminology. A **multiplicative function** is an
integer valued function $$f$$ such that $$f(mn) = f(m) f(n)$$ if
$$\gcd(m,n)=1$$. The function $$f$$ is called **completely
multiplicative** if $$f(mn) = f(n)f(m)$$ for all integers $$m,n$$.

An important family of completely multiplicative functions that we
will encounter are the power functions $$\mathrm{Id}_j$$, defined by
$$\mathrm{Id}_j(n)=n^j$$. The function $$\mathrm{Id}_0$$ is simply the
constant function 1, so we will denote it by 1.

Given two functions $$f,g$$, we define the **Dirichlet convolution**
$$f * g$$ as follows:

$$f * g(n) = \sum_{d \mid n} f(d) g(n/d)$$.

We have that the Dirichlet convolution turns the set of arithmetic
functions into a ring under pointwise addition. There is a unit
element $$\epsilon$$ defined by $$\epsilon(1) = 1$$ and $$\epsilon(n)
= 0$$ for $$n \ne 1$$.

One useful result is that completely multiplicative functions are
distributive with respect to the Dirichlet convolution in the
following sense: Let $\cdot$ denote pointwise multiplication. Then if
$$f$$ is completely multiplicative we have that

$$f \cdot (g * h) = (f \cdot g) * (f \cdot h)$$. 

## Generalized Dirichlet convolution ##

Suppose that $$\alpha$$ is an arithmetic function and $$F$$ is a
real-valued function such that $$F(x) = 0$$ for $$0 \leq x < 1$$. We define the 
**Generalized Dirichlet convolution** $$\alpha \circ F$$ as

$$F(x) = \sum_{n \leq x} \alpha(n) F(x/n)$$.

The Dirichlet convolution is associative over the generalized
convolution in the following sense: If $$\alpha, \beta$$ are
arithmetic functions, and $$F$$ is a real-valued function as in the
definition, then

$$\alpha \circ (\beta \circ F) = (\alpha * \beta) \circ F$$.

The generalized Dirichlet convolution is useful when dealing with sums
of arithmetic functions. The main result we will use is this:

Let $$f,g$$ be arithmetic functions, and let $$F(x) = \sum_{n \leq x}
f(n)$$ and $$G(x) = \sum_{n \leq x} g(n)$$. Then we have

$$\sum_{n \leq x} (f*g)(n) = \sum_{d \leq x}f(d) G(x/d) = \sum_{d \leq
x}g(d)F(x/d)$$.

To prove this, let $U$ be the function defined by $U(x) = 0$ for $0
\leq x < 1$ and $U(x)=1$ otherwise. Then $G = g \circ U$ and using the
associativity we discussed above we obtain the desired result

$$f \circ G = f \circ (g \circ U) = (f * g) \circ U$$.

## Proof of main result using Dirichlet convolution ##

We now have all the neccessary tools to prove our main result. We will
actually prove the following stronger result: Let 

$$\Phi_j(x) = \sum_{n \leq x} n^j \phi(n)$$.

Then the following holds:

$$\sum_{n \leq x} n^j \Phi_j(x/n) = s_{j+1}(x)$$,

where $$s_k(x) = \sum_{i \leq x} i^k$$.

The proof goes as follows: We have that $$\Phi_j(x) = \sum_{n \leq x}
(\mathrm{Id}_j \cdot \phi)(n)$$ so we can use our main result from the
Generalized Dirichlet convolution to obtain

$$\sum_{n \leq x} n^j \Phi_j(x/n) = (\mathrm{Id}_j \circ \Phi_j)(x)$$
$$= \sum_{n \leq x}(\mathrm{Id}_j * (\mathrm{Id}_j \cdot \phi))(n)$$.

Using that completely multiplicative functions are distributive and
the fact that $$1 * \phi = \mathrm{Id}_1$$, we get

$$\sum_{n \leq x}(\mathrm{Id}_j * (\mathrm{Id}_j \cdot \phi))(n) =
\sum_{n \leq x}\mathrm{Id}_j \cdot (1*\phi)(n)$$ 
$$=\sum_{n \leq x} \mathrm{Id}_{j+1}(n) = s_{j+1}(x)$$.

This concludes the proof. Our original result was the special case
where $$j=0$$, and in this case we have $$s_1(N) = N(N+1)/2$$, which
is the original right hand side.

{% include JB/setup %}
