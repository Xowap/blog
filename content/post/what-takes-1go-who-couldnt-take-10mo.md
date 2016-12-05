+++
author = "Xowap"
date = "2016-07-17T22:37:48+02:00"
description = "Modern software is becoming more and more resources-hungry. Is it out of necessity, or out of lazyness?"
tags = ["deployment", "automation", "blog"]
title = "What takes 1 Gio that couldn't take 10 Mio?"
draft = true

+++

If you've taken a CS class or simply been in the CS field for a little bit, you already heard that
nowadays RAM is free. From this, it is easy to stretch the conclusion that developers do not
actually care much about memory consumption and simply fill all the available space.

Saying that RAM is free is not completely true. Maybe RAM itself is free, but manufacturers tend to
put the bare minimum to cover their user's needs. With PC it's not a problem because you can upgrade
the same machine for years. But with all the other devices, like phones, RAM is actually soldered
into the device and cannot be replaced or extended. So, maybe your phone would have been only $10
more expensive with twice as much RAM, still once you bought it the price of more RAM is the price
of a new phone. Regardless of how ill-designed this world is, we have to deal with this reality.

- What apps consume now vs before
- What do the lightest apps consume
- What is new in apps that didn't exist before
- Apps are getting simpler, why not memory?
- Facebook mobile website vs APK
- Example of generators that can save up a lot of memory
- Gescomi 2 doesn't take too much RAM
- Are the tools to blame?
- Master System/NES games were impressive with extremely small resources. (3D games)
- Should RAM usage double every 18 month
- Performance complexity


# Hacks and general purpose

My first experience with 3D glasses was right at home, on my Sega Master System. Missile Defense 3-D
is a quite entertaining shooting game where you defend yourself against missiles from various
perspectives, including from space. While the game itself was not in 3D, you had to play it with
3D glasses and could see missiles and game elements positioned with depth. There is no technological
miracle going on the 4&nbsp;Mhz processor and its 8&nbsp;Kio of RAM. Simply a clever and effective
hack. Which brings the following hypothesis: in the beginning all things were hacks of a specific
hardware being twisted very specifically to produce a given output. However, with passing time,
the hardware becomes more general-purpose to provide abstractions and sanity, at the cost of
performance.

Games are a good example of pushing the limits of hardware. Who played Asteroids? That game is
really old and features very simple graphics. However, as it is only a few white lines on a black
background, it is completely vectorized and uses properties of cathodic displays to be the
smoothest game I've ever played. You can't even see the pixels because there is *no* pixels. Just
pure perfect white lines. Or I could also quote Megadrive's *Virtua Racing*. It was an arcade game
that was ported down to a Megadrive. It was an actual 3D game (like modern games), but the Megadrive
didn't have the guts to run it. Instead, they just bundled a GPU inside the cartridge and it was
good to go. Can't do that with a CD, right?

Indeed, it seems that games made heavy use of serious hacks in order to overcome limitations. You
don't need to know how your screen works to display things on it. You don't even need to use some
special hardware or anything to display things, because there is a zillion abstraction layers on
top of it and about as many ways to draw anything simply. On your screen and on the screen of anyone
else, regardless of any hardware spec. Like web pages.

Now, there is a lot of people claiming that their language/paradigm/compiler/whatever creates very
optimized code that outperforms what any developer could write. I personally think this is bollocks
and will keep on being false for quite still quite some time. People writing compilers invented
the patterns and if presented the case could mix and combine patterns in an innovative way that a
compiler cannot yet think of. Let's refer to
[this Google study](https://days2011.scala-lang.org/sites/days2011/files/ws3-1-Hundt.pdf) where
their engineers concluded that C++ was the fastest language by a large margin, at the cost of very
skillful optimization. Hacking the hardware is still the way of performance and the furthest away
you go the poorer the (potential) performances are. Like in Java.

So yes, abstraction does allow to develop a lot faster but also costs some performance.


# Are the tools to blame?

Let us not forget that in computer science, the way to measure performance is the big O notation.
What is the cost of abstraction in terms of big O?

In other terms, let's suppose you make a program that has 10 features twice, once in C++ and once
in Python. You benchmark it and notice that the Python version is 10x slower that the C++ version.
Yet, it didn't really matter because most things run in 0.1ms in C++ and in 1ms in Python.

Now suppose that you add 10 more features to both programs, reaching a total of 20 features. Is the
Python version still about 10x slower? Or 100x? Or what?

Although there is some common sense here, I figured I'd make a simple test to prove the concept.

TODO write the actual tests results (and make the tests)

The same question also goes for memory usage.
