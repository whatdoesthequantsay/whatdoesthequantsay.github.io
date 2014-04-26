---
layout: post
title: "Introducing Bitcoinista"
description: "A minimalist python wallet for iOS"
author: christian
tags: [bitcoin, christian]
---
{% include JB/setup %}

Ever since Apple decided to [disallow bitcoin wallets][dlytech] in the App
Store, bitcoin users who use iOS devices have done one of two things: either
[ditched][bbg] (or even [destroyed][forbes]) their iPhones, or tried to find
workarounds. One obvious workaround is to [jailbreak][] the device, but this
comes with its own complications since it's not officially supported by Apple.
The non-jailbreak workarounds have been either web-based HTML5 wallets such as
[CoinPunk][] or native apps distributed through [ways that may or may not
violate the Apple Enterprise Licence][coindesk].  Today we introduce a new
workaround using Python.

<!-- more -->

## Pythonista & pybitcointools ##

We love to play around with Python on the go using the excellent app
[Pythonista][omz] for iPhone and iPad. In the process of learning the bitcoin
protocol we began exploring the [pybitcointools][pybtc] library, written
by [Vitalik Buterin][vitalik]. It was therefore natural to see if we could make
pybitcointools run in Pythonista on the iPad.

This did not quite work out of the box, for the following reason: Bitcoin relies
on a number of [cryptographic hash functions][hashwiki], one of which is
[RIPEMD-160][ripemd]. The standard Python [hashlib][] library contains all of
the required hash functions, but does not have a native implementation of
RIPEMD-160. Instead the `hashlib` library uses a generic function `hashlib.new()`
to request a hash function that our OpenSSL library may offer.

<pre>
>>> input = "Nobody inspects the spammish repetition"
>>> hashlib.new('ripemd160', input).hexdigest()
'cc4a5ce1b3df48aec5d22d1f16b894a0b894eccc'
</pre>

This call fails in Pythonista, either because the SSL library on iOS does not
have this hash function, or because Pythonista does not have the required
permissions. Thus we had to create a fallback in pybitcointools where in the
case of failure we use a pure Python implementation of RIPEMD-160. After
implementing this fallback mechanism, pybitcointools was up and running on our
iPad.

## Bitcoinista ##

Next, we created a bitcoin wallet that can be run in Pythonista. The result is
[Bitcoinista][github], a very simple wallet with a text-based UI.

The usage is straightforward: first we set up the wallet by either creating a
random key, importing our own key, or creating a key from a brainwallet
passphrase. We then select an encryption password and the private key is
encrypted using AES and stored in a `json` file along with the corresponding
address.

<meta property="og:image" content="/assets/images/bitcoinista_send.png" />
<img style="float:left; width: 270px; padding:10px" src="/assets/images/bitcoinista_setup.png" alt=""/>
<img style="float:right; width: 270px; padding:10px" src="/assets/images/bitcoinista_send.png" alt=""/>

Once the wallet is set up, Bitcoinista can do two things:

* Show your balance and address
* Send coins to another address

Sending to another address can be done manually by pasting in the recipients
address and typing in the amount. Alternatively, we can use Pythonista's
[clipboard][] module to create transactions from QR codes: simply scan the QR code
in your favorite QR code app (ours is [Scan][scan]), copy the resulting [bitcoin
URI][btcuri], and run Bitcoinista. Bitcoinista will then read the URI from the
clipboard and automatically create the transaction for you. All you need to do
is verify by entering your password.

<iframe width="560" height="315" src="//www.youtube.com/embed/JBRK0YJYMck" style="frameborder:0" allowfullscreen></iframe>

Bitcoinista uses [pybitcointools][pybtc] for checking the wallet balance and
sending transactions. Specifically we use the API of [blockchain.info][bci] to
get balance, and as a fallback we use [blockr.io][brio]. For sending
transactions we use [blockchain.info][bci] and the fallback in this case is the
API for [eligius][].

The main features are

* Runs on iOS without jailbreak (le raison d'etre)
* Open source and runs directly from source code
* Easily send to [bitcoin URI][btcuri] after scanning a QR code
* The private key never leaves the device
* Private key encrypted using AES

## Links & Installation ##

Source on github:

<https://github.com/christianlundkvist/bitcoinista>

Follow the instructions in `README.md` to install Bitcoinista on your iOS
device.

Announce post on bitcointalk:

<https://bitcointalk.org/index.php?topic=576895>


[dlytech]: http://www.dailytech.com/article.aspx?newsid=34287
[bbg]: http://www.bloomberg.com/news/2014-02-07/apple-bitcoin-rift-has-currency-s-fans-ditching-iphones.html
[forbes]: http://www.forbes.com/sites/kashmirhill/2014/02/07/bitcoin-lovers-destroy-iphones-after-apple-pulls-blockchain-wallet-app/
[coinpunk]: https://coinpunk.com
[coindesk]: http://www.coindesk.com/coc-ios-bitcoin-wallet-apple/
[omz]: http://omz-software.com/pythonista/index.html
[pybtc]: https://github.com/vbuterin/pybitcointools
[ripemd]: https://en.wikipedia.org/wiki/RIPEMD
[github]: https://github.com/christianlundkvist/bitcoinista
[scan]: https://itunes.apple.com/us/app/scan-qr-code-barcode-reader/id411206394?mt=8
[btcuri]: https://github.com/bitcoin/bips/blob/master/bip-0021.mediawiki
[bci]: https://blockchain.info
[brio]: https://blockr.io
[eligius]: http://eligius.st/~wizkid057/newstats/pushtxn.php
[jailbreak]: https://en.wikipedia.org/wiki/IOS_jailbreaking
[hashlib]: https://docs.python.org/2/library/hashlib.html
[hashwiki]: https://en.wikipedia.org/wiki/Cryptographic_hash_function
[vitalik]: http://vitalik.ca
[clipboard]: http://omz-software.com/pythonista/docs/ios/clipboard.html

[img1]: /assets/images/bitcoinista_send.png
[img2]: /assets/images/bitcoinista_setup.png
