---
layout: post
title: "Introducing Bitcoinista"
description: "Minimalist python wallet for iOS"
author: christianlundkvist
tags: [bitcoin, christian]
---
{% include JB/setup %}

Ever since Apple decided to [not allow bitcoin wallets][dlytech] in
the App Store, people who use iOS devices and are also bitcoin users
have done one of two things: Either [ditched][bbg] (or even
[destroyed][forbes]) their iPhones and switched to Android, or tried
to find workarounds. The workarounds have been either web-based HTML5
wallets such as [CoinPunk][cp] or native apps distributed through
[ways that may or may not violate the Apple Enterprise
Licence][coindesk].

We like to play around with Python on the go using the excellent app
[Pythonista][omz] so when we began exploring the
[pybitcointools][pybtc] library it was natural to see if we could make
it run in Pythonista on the iPad.

This did not quite work out of the box, since the python `hashlib`
library does not have a native implementation of
[RIPEMD-160][ripemd]. Instead the standard method is to use the
function `hashlib.new()` to call the underlying OpenSSL library
and request this hash.

    >>> input = "Nobody inspects the spammish repetition"
    >>> hashlib.new('ripemd160', input).hexdigest()
    'cc4a5ce1b3df48aec5d22d1f16b894a0b894eccc'

This call fails in Pythonista so we had to create a fallback where in
the case of failure we use a pure python implementation of
RIPEMD-160. After doing this minor change the library worked well in
Pythonista.

## Bitcoinista

After getting pybitcointools to run in Pythonista we decided to have a
go at creating a simple bitcoin wallet that can be run in
Pythonista. The result is [Bitcoinista][github], a very simple wallet
with a text-based UI.

    Screenshot(s)

Once the wallet has been set up using by either creating a random key,
importing your own key, or creating a key from a brainwallet
passphrase the wallet has two functions:

* Show your balance
* Send coins to another address

Sending to another address can be done manually by pasting in the
recpient's address and typing in the amount. Alternatively, we can use
Pythonista's `clipboard` module to create transactions from QR codes:
Simply scan the QR code in your favorite QR code app, copy the
resulting [bitcoin URI][btcuri], and run Bitcoinista. Bitcoinista will
then read the URI from the clipboard and automatically create the
transaction for you. All you need to do is verify by entering your
password.

Here is a video of Bitcoinista in action:

    Video

The main features are

* Runs on iOS without jailbreak (raison d'etre)
* Easily send to [bitcoin URI][btcuri] after scanning a QR code
* Private key encrypted using AES
* Showcases pybitcointools


[dlytech]: http://www.dailytech.com/article.aspx?newsid=34287
[bbg]: http://www.bloomberg.com/news/2014-02-07/apple-bitcoin-rift-has-currency-s-fans-ditching-iphones.html
[forbes]: http://www.forbes.com/sites/kashmirhill/2014/02/07/bitcoin-lovers-destroy-iphones-after-apple-pulls-blockchain-wallet-app/
[cp]: https://coinpunk.com
[coindesk]: http://www.coindesk.com/coc-ios-bitcoin-wallet-apple/
[omz]: http://omz-software.com/pythonista/index.html
[pybtc]: https://github.com/vbuterin/pybitcointools
[ripemd]: https://en.wikipedia.org/wiki/RIPEMD
[github]: https://github.com/christianlundkvist/bitcoinista
[btcuri]: https://github.com/bitcoin/bips/blob/master/bip-0021.mediawiki