+++
author = "Xowap"
date = "2016-06-23T23:26:26+02:00"
description = "A concise guide to everything you need to know on how to use IPv6 right now."
tags = ["ipv6","guide"]
title = "IPv6 for IPv4 guys"

+++

IPv6 is not that difficult, but to-the-point documentation is hard to find. Let's remedy to this.

In this article I'll assume you have enough knowledge of IPv4 and CS to understand basic network
concepts. If you don't, you can try understand but I omitted a lot of background
explanations you're probably going to need.

## What won't be said

There is a lot I kept under silence here. Do you care about IPv4 fragmentation? How the checksums
are computed? What are the IPv4 packet fields? Most people on the Internet don't and shouldn't have
to worry about those, even a lot of tech people.

It is exactly the same with IPv6. Most documentation is loaded with pages and pages of the inner
workings of IPv6, but really if you care about this go read those documentations instead of this
one. Here you'll only get practical information that enables you to serve a website using
IPv6.

## Why IPv6?

It is possible to connect 2 billions devices with IPv4. There is about 20 billions out there right
now. It's going to keep on rising but the IPv4 limit can't move.

In **1998**, a new protocol was invented, that's **IPv6**. It was intended to do many things, does
some of them, but above all saves the Internet with its 128-bits address space, which is a *lot*
more than IPv4.

## Public addresses

All of this is going to be discussed later, but this one is a really big point so I'm going to make
it twice.

Your computer gets a public IP address. Everybody's computer gets a public IP address. In fact,
every device gets multiple public IP addresses and private addresses, at the same time.

Yes. As shocking as it is, it is true. You must make your peace of mind with it. As you'll see, it
doesn't bring any security or management issues, but rather comes with new possibilities.

There is no NAT. You don't need proxies. Really. It's fine.

You must un-learn this part of networking and remember how it worked when IP addresses were
unlimited, because that's what is coming back with IPv6.

## Addresses

IPv6 addresses are, like IPv4 addresses, just a big number. They are however too long to keep
on using the IPv4 notation (which was `1.2.3.4`). Now it's more like `2a00:1450:4007:80c::2003`.

### Structure

What really matters is that IPv6 addresses have 2 separate 64-bits parts:

- The network ID (`2a00:1450:4007:80c` in the example)
- The device ID (`2003` in the example)

The network ID is closer to what we consider today as public IPv4. They are basically assigned the
same way as IPv4 public addresses are and, in the case of home or offices, they designate the
*network* behind a given CPE. The other part is an identifier of the device inside the network (more
on that right after).

### Device ID and Privacy

The device ID is arbitrary. Any device can set its own ID as long as it's not already in use on the
network. Traditionally the devices use their own MAC address, since it is already guaranteed to be
unique worldwide.

However, remember that in IPv6 your computer *has* a public IP address. Any website you visit
thus gets your IP address, not the one of your office but the one of your very computer. If this
address is also the MAC address, it means that you could be tracked from anywhere you connect. The
fix is to give your device two addresses:

- A permanent one, with your MAC address, that you can give to other people in case you need them
  to connect your computer (like connect your work computer from home or vice-versa).
- A temporary one that changes all the time and that is completely random. The computer uses this
  address by default so you can't be tracked.

### Network ID

There is public network IDs you can get just like IPv4 public addresses.

And there is private network IDs you can set arbitrarily for internal services inside your company.
You can simply create private networks and have computers inside. Of course your computers can have
both a public and a private network address.

Those private IDs are pseudo-unique, so the chances of running into another organization that has
the same network ID as yours is pretty low. Mobile app developers that had to connect to two
different `192.168.0.0/16` networks at the same time can relate.

There is also a link-local network ID, which is in the `fe80::/10` network. All network interfaces
automatically get a link-local address. Just don't bother with them, they're a pain in the ass and
are just needed for technical reasons that do not concern you.

### Configuration

In IPv6, there is still DHCPv6 but unless you're a trained professional you don't need it. IPv6 uses
the *Network Discovery* protocol, which handles perfectly well address attribution and routers
advertising. It's plug&play, really. If you're connecting your computer to a network that has IPv6,
your computer has IPv6.

So, just to wrap up. Each network has a network ID, known and announced by the router. Once you
connect a device on the network, it receives the announcement from the router, finds a suitable
device ID for itself (through *ND* or *DHCPv6*) and that's it.

### Notation

How to write IPv6 address is not really important, yet let's just talk about it a little bit to
de-mystify the thing.

So, IPv6 addresses are a chain of 4-digits hex words. Like
`1111:2222:3333:4444:aaaa:bbbb:cccc:dddd`.

The first half is the network, the other half is the device.

As it can be pretty long and painful to write, usually if you manage servers you're usually going
to assign IPs that make sense. Like numbers from 1 to N. In that case, it would make a lot of
zeros:

```1111:2222:3333:4444:0000:0000:0000:0001```

You can, once in each IP, reduce all zeros with the `::` notation. The above-mentioned address
then becomes:

```1111:2222:3333:4444::1```

And that's pretty much it. Anyway, most of the time you're just going to copy/paste.

Some applications will require you to use a slightly different notation. Since the separator is `:`,
web browsers and URL-based applications will understand your IPv6 as many port numbers. Don't panic,
there is an appropriate notation for that:

```http://[2001:19f0:6800:100d:5400:ff:fe28:b1f5]```

## Using it

In order to use IPv6, you need a network provider that has IPv6. If you're French and your provider
is *Free*, there's a switch in the admin panel. Turn it on, it boosts Youtube. If you're hosting a
web server, all serious hosts now have IPv6 (although some antiquated shitty providers like AWS
still do not support it even though being overpriced and bathing in liquid money every morning).

### DNS

If you want to put an IPv6 in the DNS record, that's fairly simple. There is a `AAAA` record type,
just use it as you would use a `A` record. You can put both a `A` and a `AAAA` at the same time for
the same domain, your clients will choose IPv6 if they can or will stick to IPv4 otherwise.

Have a look:

    % host hyperthese.net
    hyperthese.net has address 108.61.209.13
    hyperthese.net has IPv6 address 2001:19f0:6800:100d:5400:ff:fe28:b1f5

### Tools

Most tools handle both IPv4 and IPv6 the same way (because the underlying API is basically the
same). Some people
[wrote interesting tutorials](https://www.digitalocean.com/community/tutorials/how-to-configure-tools-to-use-ipv6-on-a-linux-vps)
on the subject.

### With a v4-only provider

You can still hack around using [tunnel brokers](https://tunnelbroker.net/), although those don't
come with any warranty. And it requires you to have a public IPv4 address to work.

### Security

All your computers get a public IP address. Don't forget to deny unwanted incoming connections on
your firewall. I know, that's some work to do, but it's still simpler than setting up NAT.

### Testing

There is plenty of websites that will tell you
[if your IPv6 works all right](http://test-ipv6.com/). If you watch the
[Star Wars Asciimation](http://www.blinkenlights.nl/services.html) over `telnet`, you'll see it
with colors.

## Conclusion

This article went through the basic concepts of IPv6 and hinted at some resources to help you
getting on tracks with IPv6 right now. In essence, it has been shown that besides a few details,
day-to-day use of IPv6 is the same as IPv4's one. Thus, as IPv6 availability grows stronger every
day, it is really easy for you to get started and make sure you're ready for Internet's next big
evolution.
