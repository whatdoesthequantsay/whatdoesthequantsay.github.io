---
layout: post
title: "Computer security and private keys"
description: ""
author: christian
tags: [christian,bitcoin]
category: 
---
{% include JB/setup %}

Recent hacks of large corporations show that the current state of
computer security is severely lacking and that new thinking is needed
in this realm. While this is a big and complex field I'm going to
focus on a few specific areas and suggest some ways that security may
be enhanced.

The popularity of cryptocurrencies like [Bitcoin][] has created
an evolutionary pressure to build very secure systems for handling
[cryptographic private keys][pubkeycrypto]. Since the stakes are high
-- loss of private keys often mean direct loss of money -- there is
great interest in developing hardware based systems for securing and
handling private keys.

We will discuss the current landscape and suggest some ideas for
improving computer security in the specific areas of Payment systems,
Authentication and Data storage. The main idea is to transform the
various security requirements of these areas into the one security
requirement of handling and securing cryptographic private keys.

<!-- more -->

## Recent hacks and breaches ##

During 2014 there have been multiple high-profile hacks of major
corporations. These companies include

* [Target][targethack]
* [Home Depot][homedepothack]
* [JP Morgan Chase Bank][jpmhack]
* [Sony Entertainment][sonyhack]
* [Apple (iCloud)][icloudhack]

The data stolen from these hacks included credit card numbers,
personal information and in the case of Sony Entertainment also emails
and social security numbers of employees. In the case of Chase Bank
[76 million][jpm76mil] households were affected, implying that
everyone who has ever had an account with Chase bank now has some of
their personal information compromised.

The Sony Entertainment hack was very spectacular since it involved a
complete takeover of the computer systems of the company and basically
all company information (personal information of employees including
SSNs, all company emails, unfinished versions of upcoming movies) was
released to the public. It is probably conservative to assume that
several other corporations have had similar total breaches which are
not known because the attacker did not publicly reveal the hacks. Even
if a breach is discovered internally after the fact it may well be
kept secret to avoid embarrassment.

The [media][media1] [discussion][media2] around these hacks have
focused more on who the hackers are (Russian organized crime? Chinese
intelligence services? North Korean military hackers?) and less on how
to prevent hacks or safeguard data if a breach occurs. If the issue of
prevention comes up the solution always seems to gravitate towards an
amorphous promise to "increase the cybersecurity budget". The (US)
government is also quick to try to pass ["Information sharing"][cispa]
laws which are more focused on letting the NSA and FBI get easier
access to company information than actually securing this information.

## Payment systems ##

The Target and Home Depot hacks shows the perils of using a 50-year
old system designed when the concept of the Internet did not
exist. The credit card system authenticates a user to make a
transaction based on their card number, a short security code printed
on the card, along with personal information about the card user. This
authentication scheme makes it necessary to give out personal data to
every merchant you do business with. Since only one of the merchants
need to be hacked it is pretty much certain that the personal
information associated with your credit card is now in the hands of
hackers.

Systems built on top of the credit card system like [Apple
Pay][applepay] remedy the situation somewhat since with this scheme
the merchant do not need to obtain the personal information of the
customer. The bank and credit card company still need to know this
data but the problem is mitigated.

Payment systems like [Bitcoin][] are digital but work in a way that's
closer to cash than credit cards. Since transactions are irreversible
and Bitcoin addresses are pseudonymous the merchant does not need to
know any personal information at all about the customer in order to
process a transaction. The customer data is therefore secure in the
sense that the data need not be shared to begin with.

With Bitcoin the responsibility for security shifts to the
customer. If the customer loses control over her private key all
bitcoins controlled by that private key are lost. This might seem like
a big problem, but it might be a good trade off: It is impossible for
the user to control data held by hundreds of third parties, but it is
possible to physically secure private keys.

## Authentication ##

The most common system of user authentication currently is the system
of usernames and passwords. This system has numerous well-known
problems:

1. Humans are very bad at choosing secure passwords, making it easy to guess or brute-force.
2. The need to keep track of hundreds of passwords for different services.
3. Entering the password on an unsecured system can compromise the password.
4. A malicious website can capture the username and password which can then be used to gain entry.
5. Often services provide password-recovery systems based on questions whose answers are easy to guess or research. 

The first two items on the list lead to most people using a password
like "password" on every single service they are signed up on. Even if
they choose a secure password they will often use the same one for
each service. Thus if one of their services is hacked it implies that
all other services where that password was used is now compromised.

One major component of the [iCloud celebrity breach][icloudbreach] was
the use of a password recovery system where the user is encouraged to
provide answers to "security questions" based on easily researched
information like "where did you grow up?" or "what's your mother's
maiden name?".

One way to remedy many of the problems above is to use a [password
manager][pwmanager] such as [1Password][] which is an encrypted
container that holds all the users passwords. The user can now select
long randomly generated, secure passwords that are unique to each
service. Also answers to security questions should be randomly
generated, secure passwords. If a service is compromised it's easy to
generate a new password for that one service while knowing that the
passwords for all other services are still secure.

One downside of the password manager approach is that if one uses the
password manager on a compromised system there is now the risk of
total breach of all the passwords. There have been recent reports of
[malware targeting password managers][pwmalware] so this is a real
risk. Using a password manager on a malware-hardened system like
[iOS][] is probably the most secure way of dealing with passwords
today.

An authentication method that remedies all of the problems above is
[public-key authentication][pkauth]. Some examples of this
authentication system include [BitId][] and [BitAuth][] who both use
the elliptic curve cryptography of the Bitcoin network. Another method
is [SQRL][].

Public-key authentication works by verifying that the user is in
possession of a certain private key. Specifically, the user submits
her public key to the service to be associated with her account. Then
when a login is requested the service sends a challenge message to the
requestor. The user signs the challenge message with her private key
and returns the signed message to the service. The service checks that
the signature matches the public key and if it does allows the login.

One of the benefits of the public-key authentication method is that
the signing of the message can occur on a device other than the device
on which the user is logging in. Thus the private key can be stored on
a malware-hardened device such as an iPhone, where the signing can be
done using a dedicated app further protected by a PIN or by
[TouchID][]. Thus in this case we automatically get a form of
[two-factor authentication][2fa].

For even more sensitive services a special-purpose private-key
management device like [Trezor][] can be used. Even if the user is
logging in on a potentially compromised system like a library computer
her private key is never exposed to the system.

Note the similarity with the Payments section above: When making a
credit card payment you authenticate yourself to the credit card
company and your bank. When making a Bitcoin payment you authenticate
yourself to the Bitcoin network when you request a transfer of
bitcoins. As with the Payments section we see that secure
authentication can be reduced to securing private keys.

## Data storage ##

The best way to ensure that sensitive data is secure in the event of a
breach is to have the data encrypted whenever it is not directly in
use. To protect emails or other messages from being exposed end-to-end
encryption should be used between users so that an attacker would have
to obtain the private keys of all employees in order to expose all
emails as was done in the Sony Entertainment hack.

A side-effect of always encrypting data at rest is that in terms of
security it doesn't matter where the data is stored, as long as the
data is validated when retrieved, and the storage provider can be
trusted to not lose or delete the data. Thus a cloud storage service
like [Dropbox][] can be used even if the user does not trust the storage
service provider to respect the privacy of the user.

Another recent development is decentralized data storage services like
[Storj][] or [MaidSafe][]. These services work by splitting the user
data into shards, encrypting the shards and storing them on the
personal computers of (financially incentivized) volunteers. Thus in
this case we have a system where the data is stored on completely
untrusted devices, but since the data is encrypted, validated and
stored in a redundant fashion this data storage system is
(theoretically) perfectly secure.

In the case of decentralized data storage systems the protection of
the stored data is completely reduced to the protection of the private
keys associated to the encryption of the data and the location of the
encrypted shards on the network. If the attacker does not have access
to the private keys they would not know where the data is stored nor
how to decrypt it, but if they obtain the private keys they will
immediately get full access to all the data.

Thus we have seen that in the case of data storage, similar to payment
systems and authentication, securing the stored data can be reduced to
securing a private key. With data storage one challenge is that with
data that need to be accessed frequently constant encryption and
decryption might be too costly.


[pubkeycrypto]: https://en.wikipedia.org/wiki/Public-key_cryptography
[bitcoin]: http://bitcoin.org
[targethack]: http://www.businessweek.com/articles/2014-03-13/target-missed-alarms-in-epic-hack-of-credit-card-data
[homedepothack]: http://techcrunch.com/2014/09/18/home-depot-hack/
[jpmhack]: http://dealbook.nytimes.com/2014/10/02/jpmorgan-discovers-further-cyber-security-issues/
[sonyhack]: https://en.wikipedia.org/wiki/Sony_Pictures_Entertainment_hack
[icloudhack]: http://www.cbsnews.com/news/apple-boosts-icloud-security-after-celebrity-photo-hacks/
[jpm76mil]: http://money.cnn.com/2014/10/02/technology/security/jpmorgan-hack/index.html
[media1]: http://www.rand.org/blog/2014/12/did-north-korea-hack-sony-pictures-entertainment.html
[media2]: http://www.usatoday.com/story/money/business/2014/10/04/jpmorgan-chase-cyberattack-russians/16717499/
[applepay]: https://www.apple.com/apple-pay/
[cispa]: https://wikipedia.org/wiki/Cispa
[icloudbreach]: http://www.newsweek.com/hundreds-intimate-celebrity-pictures-leaked-online-following-suspected-icloud-267851
[pwmanager]: https://en.m.wikipedia.org/wiki/Password_manager
[1password]: https://agilebits.com/onepassword
[pwmalware]: http://arstechnica.com/security/2014/11/citadel-attackers-aim-to-steal-victims-master-passwords/?comments=1
[ios]: http://www.apple.com/ios/
[pkauth]: https://wikipedia.org/wiki/Digital_signature#Authentication
[bitid]: https://github.com/bitid/bitid/blob/master/BIP_draft.md
[bitauth]: http://blog.bitpay.com/2014/07/01/bitauth-for-decentralized-authentication.html
[sqrl]: https://www.grc.com/sqrl/sqrl.htm
[touchid]: https://wikipedia.org/wiki/Touch_ID
[2fa]: https://wikipedia.org/wiki/Two_factor_authentication
[trezor]: http://www.bitcointrezor.com
[dropbox]: https://www.dropbox.com/
[storj]: http://storj.io
[maidsafe]: http://maidsafe.net
