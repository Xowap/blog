+++
description = "We'll see that NLP is held high but is not ready for real-world"
author = "Xowap"
tags = [
    "nlp",
    "chatbot"
]
date = "2016-12-04T22:39:05+01:00"
title = "NLP can't help your chatbot"

+++

NLP is the new jam. [Facebook bought wit.ai](https://wit.ai/blog/2015/01/05/wit-ai-facebook),
[Google bought api.ai](https://api.ai/blog/2016/09/19/api-ai-joining-google/),
[Apple bought Siri](https://techcrunch.com/2010/04/28/apple-buys-virtual-personal-assistant-startup-siri/),
whose founders re-created a company named
[Viv that got bought by Samsung](https://news.samsung.com/global/samsung-to-acquire-viv-the-next-generation-artificial-intelligence-platform).
And let's not forget Amazon's Alexa nor Microsoft's Cortana.

Yet, what is NLP, why it won't help you and what can you do instead? This is what me and my partner
[Geoffroy](http://www.rencontres-numerique.fr/speaker/geoffroy-de-ribou/) were explaining at the
[Rencontres Nationales du Numérique](http://www.rencontres-numerique.fr/) in Poitiers last week and
here's a textual wrap-up of our bit on NLP.

## Introduction to NLP

What is NLP? "Natural Language Processing", in other terms "Making computers understand human
speak".

When I was an engineering student my girlfriend was a linguistics major and it turned out that at
some point we practically attended the same classes. How so? Thanks to a man named
[Noam Chomsky](https://en.wikipedia.org/wiki/Noam_Chomsky). He basically tried to create the theory
behind every grammar and while his work was successfully derived for computer languages, the results
are still not conclusive on natural languages.

Our mind is a probability machine. What you understand is what you think the person in front of you
meant. You can notice this in many situations. Did you ever...

- Read a course and understand nothing? Then look back at it when you know the topic
  and find that everything makes perfect sense?
- Walk around a foreign city and find that everything looks the same?
- Re-watch a movie and spot every clue of the reveal?

That's how we understand language. There is a situation, a context, words you know, a grammar you
expect. Most of what people say is predictable and the rest can be inferred from just a few words.
Even if you talk to a foreigner whose grammar is totally wrong you'll probably understand because of
that.

But how long did it take you to reach that stage? Would a 3-years-old be able to understand as much?
Everyone would agree you can't talk about everything with a kid. Learning how to talk is not just
about talking but rather about *life*.

## Turing Test

For a long time it was believed that the endgame for chatbots (and ancestors) was to pass the
[Turing test](https://en.wikipedia.org/wiki/Turing_test). In short, you should not be able to make
the difference if you're talking to a bot or to a human from customer care.

Did you ever try to talk to [Office's Clippy](https://en.wikipedia.org/wiki/Office_Assistant)? To
any virtual assistant on a company website? Those things are just monumental failures. Most bots
would even reply that they're smarter than humans, that they know everything and would try to turn
around questions to look like they understood. But none of that does the trick. No one loves them,
no one uses them.

> Their sin was to try to pass the Turing test.

Why couldn't they do it? Considering the introduction above, you need two things:

1. A simili-brain technology
2. A life's worth of conversations

No one has the first item and the second item is also pretty hard to gather. As your interest in
chatbots is most likely short-term oriented, you can consider than general-purpose NLP is not
something you can expect.

## Business focus

You cannot use *general-purpose* NLP but it doesn't mean you cannot use NLP at all. For some tasks,
it exists very efficient NLP parsers. The most known of all being relative dates parsers. There is
by example [this demo](https://duckling.wit.ai/) of wit.ai's parser that works really well. And this
is good news actually.

> Your business brings the context

Your bot must be honest about what it can do and what it knows. But before all, it must be there
to accomplish a limited set of tasks, understand **only** them and stay monomaniac about it.

I like to show the example of [J'ai faim](https://www.messenger.com/t/jaisuperfaim/) ("I'm hungry"
in French), our pet chatbot which gives you restaurants around. Whatever you do, it will bring
the conversation back on food. If you ask "*What is your name?*" it replies "*I don't have a name
but I'm hungry. Do you want to find a restaurant?*". Even easter eggs will display a list of
restaurants if possible.

What your chatbot really needs to do is to drive the user towards its features. Being able to talk
politics **is not** in your scope.

## Non-verbal communication

The other good news is that your user don't actually want to formulate full sentences, especially
when they knows that the possibilities are closed down to a very small set.

A key rule of UX is not to disappoint the user with unexpected actions. Here's precisely what
platforms like Facebook, Skype or WeChat offer to do.

{{< figure src="/img/fb-generic-tpl.png" title="Facebook's Generic Template" class="-quarter" >}}

They all came up with a variety of templates that include
[buttons](https://developers.facebook.com/docs/messenger-platform/send-api-reference/generic-template),
[persistent menus](https://developers.facebook.com/docs/messenger-platform/thread-settings/persistent-menu)
or [quick replies](https://developers.facebook.com/docs/messenger-platform/send-api-reference/quick-replies).

Those are the real innovations that are currently allowing chatbots to break through. They bundle
two major advantages:

1. You don't have to *parse* what the user says since it's all happening in a traditional UI
2. The user knows *exactly* what he can do at a given stage

Using those tools, you can build a really engaging user experience that will eliminate frustration
while keeping a conversational format.

> A conversation doesn't have to be verbal

There is no rule saying that you can't talk to someone by making signs, looks or doodling things.
It's the same with chatbots: their favorite mean of communication is through those *cards*. And
that's best for everyone!

## Cards against humanity

As our friend [El Lazo](http://westworld.wikia.com/wiki/Lawrence) (Westworld spoilers in link!)
would say:

> The scale is always tipped in Techworld. If you don't see how, it's against you.

Did you notice that both api.ai and wit.ai became free after being acquired by Google/Facebook? Rest
assured, it is in no way a philanthropic move to bring AI to the masses. Those platforms are as dumb
as explained before. Anyone a little bit tech-savvy with some time could build those.

But with the masses using those platforms, a lot of businesses (and thus a lot of contexts!) are
leaking the entirety of their conversations. Why does this matter? As explained, once you have a
simili-brain you still need to train them. How do you get the data to train your brains? With the
bots that thousands of companies built!

In short, chatbots are digging the gap between what *you* can do and what the *GAFA* can do. Of
course, it doesn't have to be that way. As founder of moshi moshi paris, I can tell you that we
envision a future for chatbots where everything does not revolve around a few central points but
rather continue the amazing collaborative effort we've seen on the Internet. Billions of people
defined emails, the web, blogging and so many things. If AI should be something, let it be the
product of that incredible energy!

## Conclusion

I lied. You can use NLP. But you cannot pass the *Turing test*. And your NLP must stay constrained
to very specific uses. Instead, you must rely on new platform features like cards and quick replies
in order to provide the awesome UX that your customers deserve!

But let's not be short-sighted and have a look around. The ecosystem is building around giants and
this will play against you and me. Yet, no fate is sealed! Stay tuned on
[moshi moshi](https://twitter.com/moshimoshiparis) news!
