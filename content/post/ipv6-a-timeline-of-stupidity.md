+++
author = ""
date = "2016-06-22T00:23:36+02:00"
description = ""
tags = []
title = "IPv6 — A Timeline of Stupidity"
draft = true

+++

*Disclaimer: this article is intended for people providing content/service over IPv4 but not IPv6.
If you do not provide content nor service or if you provide it over IPv6, then this article isn't
insulting you. Otherwise you are stupid and here is why.*

Fact: [IPv4s are no more](https://ipv6.he.net/statistics/). We've run out of them in 2011 and the
only way to move forward is to switch to IPv6.

There is a lot of people thinking that IPv6 is a bad thing. They should talk to any IPv6 expert and
they'll understand that the main drawback with IPv6 is using `:` as a separator instead of `.`,
which is a little bit confusing when writing URLs because the browser thinks it's a port number.
There is a helpful syntax like `https://[::900d:f00d]/` though, so all is fine.

On the other hand, IPv6 brings back end-to-end connectivity to the Internet. Why is it a big deal
since, after all, everything works perfectly well right now with everybody behind NAT? Because the
very design of the Internet is that any computer can speak to any other computer and that's why
Internet became such the place of freedom it is today. This is not important because you might want
to talk to your friend's computer, but because anyone with an Internet connection, a computer and a
garage can start providing content just like you can breathe as long you're on the surface of Earth.
It is crucial that mega-corporations, your geeky niece and Al-Qaeda get the same right to breathe
information in and out. That is what [net neutrality](https://en.wikipedia.org/wiki/Net_neutrality)
is about.

But how does it affect you, humble provider? As a kid, with no budget, using parts from the junk and
my parent's DSL connection, I was able to host my first website, accessible from anywhere in the
world. As a provider, I pay a monthly fee to a web host that keeps my server up, running and
connected to the Internet. Simple, cheap. Now, what if there's not enough IP addresses for content
providers? What happens when the network splits and you have to deal with each network provider
individually to reach your customers? Will CDN providers start to also provide *multi-network*
presence against more money? Will your subscribers have to pay a fee just to be granted a right to
talk to you?

It seems that
[people](https://www.google.com/intl/en/ipv6/statistics.html) are getting more and more IPv6
connectivity, just like [content](https://www.vyncke.org/ipv6status/)
[providers](http://www.delong.com/ipv6_alexa500.html), which is pretty good news. Still,
[some companies](https://blog.toreanderson.no/2015/09/07/working-around-github-pages-and-fastlys-missing-ipv6-support-using-apache-mod_proxy.html)
resolutely keep on not providing IPv6 or not treating it as a first-class citizen. And
that is either downright stupid or a proof of hate against humanity.

In order to help those people out measuring how stupid they are, I pulled a little timeline that
gives things some perspective. Given the date of birth of your network/service, you can directly
evaluate the cost of thinking like you did.

<table>
    <tr>
        <th>Date</th>
        <th>Event</th>
        <th>Stupidity</th>
    </tr>

    <tr>
        <td>1993</td>
        <td>
            <strong>
                <a href="https://tools.ietf.org/html/rfc1519" target="_blank">
                    CIDR Notation/Concepts
                </a>
            </strong><br>
            IPv6 uses a fancy thing called CIDR notation that tends to confuse people because it is
            a little bit too new and they are still thinking in terms of IP classes. Let it
            be known that CIDR notation is about as old as my sister that is getting married, so
            maybe it is time to update.
        </td>
        <td>1,000,000 devices</td>
    </tr>

    <tr>
        <td>1998</td>
        <td>
            <strong>
                <a href="https://tools.ietf.org/html/rfc2460" target="_blank">
                    IPv6 is created
                </a>
            </strong><br>
            Of course, it was not entirely possible to get IPv6 at the time. At least not
            commercially. So I understand that you didn't switch at the time.
        </td>
        <td>80,000,000 devices</td>
    </tr>

    <tr>
        <td>2004</td>
        <td>
            <strong>
                <a href="https://www.renater.fr/IMG/pdf/BT-IPv6-Tutorial-110204-2.pdf" target="_blank">
                    Available worldwide in all OSes
                </a>
            </strong><br>
            Supporting IPv6 in an app became trivial and finding IPv6 connectivity was, provided
            you were big/technical enough, quite possible.
        </td>
        <td>800,000,000 devices</td>
    </tr>

    <tr>
        <td>2011</td>
        <td>
            <strong>
                <a href="https://www.nro.net/news/ipv4-free-pool-depleted" target="_blank">
                    Pool of available IPv4 addresses fully depleted
                </a>
            </strong><br>
            While getting your app to work with IPv6 was still as easy as it was 7 years before,
            IPv4 exhaustion becomes practical and all regional IPv4 tanks slowly start getting
            depleted as well.
        </td>
        <td>8,000,000,000 devices</td>
    </tr>

    <tr>
        <td>2016</td>
        <td>
            <strong>
                <a href="https://www.youtube.com/watch?v=AyKookhlYeA" target="_blank">
                    A man falls down a 50-storey building
                </a>
            </strong><br>
            While he falls, he keeps telling himself "so far, all is well". Yet, what matters is not
            falling: it's landing.
        </td>
        <td>23,000,000,000 devices</td>
    </tr>
</table>

So, here you are falling, how can you grow a pair of wings before hitting the ground?

80% of the effort is just caring. A lot of your providers or apps probably already support IPv6 at
some level, all you have to do is flick a button. For instance, if your website is behind
[CloudFlare](https://www.cloudflare.com/) you can simply enable it in the dashboard. If your host
is [Digital Ocean](https://www.digitalocean.com/) or [Vultr](https://www.vultr.com/) or
[OVH](https://www.ovh.com/fr/) you just have to enable it on your server and set your DNS
accordingly. If you're using [AWS](https://aws.amazon.com/) you simply can go fuck yourself because
Amazon just doesn't care.

The other 20% is
[a little bit of reading](https://www.digitalocean.com/community/tutorials/how-to-configure-tools-to-use-ipv6-on-a-linux-vps)
on how the tools to use IPv6 are exaclty the same as the tools to use IPv4. All right, I didn't find
much to-the-point documentation to link here, so the effort might be a little bit more than 20%.
Yet, all-in-all, what drives you away from IPv6 is mostly fear of the unknown although this very
unknown is actually mostly identical to what you know.
