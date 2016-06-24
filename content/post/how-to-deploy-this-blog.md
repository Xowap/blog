+++
author = "Xowap"
date = "2016-06-24T18:48:53+02:00"
description = "The technical architecture behind a fully automated deployment of a static blog"
tags = ["deployment", "automation", "blog"]
title = "How to deploy this blog"

+++

Let's get a little bit meta by explaining how this blog works.

So far, the source code of the blog can be found
<a href="https://github.com/Xowap/blog" target="_blank">on GitHub</a>. It is created using the
<a href="http://gohugo.io/" target="_blank">Hugo</a> blog engine, which is fairly simple to use.

Once you've got your set your blog using Hugo's documentation, basically all you need to do to build
it is to run the `hugo` command at the root of the repository. Yet, how do you host this generated
blog and, more importantly, how do you deploy it automatically every time you write an article?

Let's not dwell into the details of how to configure a web server to serve static files, but rather
how to generate them.

# The simple solution

Many people would opt to use a tasks runner like `gulp`, `grunt` or simply `make` to push content
online from command line. You could have a simple `Makefile` like:

    build:
    	rm -fr dist
    	hugo -d dist

    deploy: build
    	rsync -rtv --delete -e ssh dist/ user@server:/deploy/path/

Which is of course perfectly acceptable, especially being given how simple it is.

However, this approach has disadvantages:

- To publish your code on your Git repository you are going to `git push` and to publish your code
  online you are going to `make deploy`.
- Maybe you are going to deploy an uncommitted version of your blog. Which is bad since it means
  you could provoke regressions of the online content if you're not careful.
- If you use several computers, you might work on versions that are not based onto production
  version and thus also generate regressions.
- It is not fun.

In other words, not using the GitHub repo as sole reference for everything lets you make mistakes.
To remedy this, I created a simple tool called
<a href="https://github.com/Xowap/gowebmake" target="_blank">gowebmake</a>. The idea is to trigger
`make` tasks with GitHub webhooks. Just like Jekins would but with a zillionth of its complexity and
appetite for RAM.

# The fun solution

We'll see how to use this solution. The different steps are:

1. Configure everything and create files structure
2. Run `gowebmake` and make it accessible from the outside
3. Configure GitHub
4. Profit

## Configuration

Let me explain how it works. For the purpose of hosting this blog, I have set up the server with
the following directory structure:

| Path          | Description                            |
|---------------|----------------------------------------|
| /blog/config  | `gowebmake` configuration file         |
| /blog/webmake | `gowebmake` working directory          |
| /blog/www     | build dir where all the built files go |

Next, the configuration. Usually I use `git-flow`, however it seems a bit too extreme for a mere
blog. Instead, I just push things to `master` and I'll do branches whenever I feel the need to. In
terms of configuration, the file looks like:

    workdir = "/blog/webmake"
    gitbin = "/usr/bin/git"
    makebin = "/usr/bin/make"

    [github."Xowap/blog"]
    secret = "hahahaha"

    [github."Xowap/blog".branches.master]
    target = "deploy"

    [github."Xowap/blog".branches.master.env]
    DEPLOY_DIR = "/blog/www"

There is no sorcery here. When GitHub triggers the post-push webhook, it will call the URL I gave
to him with various information about the repository being pushed. `gowebmake` clones this
repository, goes inside and runs the `Makefile` as configured.

There is a secret you have to configure. It's an arbitrary value that you'll have to pass to GitHub
later on. For security reasons, it is totally crucial that you use a securely generated secret with
sufficient entropy.

Talking about my `Makefile`, you can see it here:

    build:
    	rm -fr dist
    	hugo -d dist

    deploy: check-env build
    	mkdir -p $(DEPLOY_DIR)
    	echo "$(DEPLOY_DIR)"
    	rsync -rtv --delete dist/ "$(DEPLOY_DIR)/"

    check-env:
    ifndef DEPLOY_DIR
    	$(error DEPLOY_DIR is undefined)
    endif

As you can understand, `DEPLOY_DIR` is a configuration variable that can be found in the `gowebmake`
configuration file just over.

## Run gowebmake

Once all is configured, you need to run `gowebmake` as a dæmon. There is a lot of things said about
`systemd` but frankly it makes my life so much simpler that I can forgive everything it is being
accused of. Point in case being dæmonization. Simply place in
`/etc/systemd/system/gowebmake.service` the following content:

    [Unit]
    Description=Gowebmake server
    Requires=network.target

    [Service]
    User=www-data
    Group=www-data
    ExecStart=/usr/bin/gowebmake -c /blog/config
    Restart=always
    TimeoutStartSec=infinity

    [Install]
    WantedBy=multi-user.target

Then run

    systemctl enable gowebmake.service
    systemctl start gowebmake.service

This way, you get `gowebmake` to run all the time and `systemd` will restart it automatically if
it fails.

By default, gowebmake listens on `http://localhost:8777/`
([IPv6-only]({{< relref "ipv6-for-ipv4-guys.md" >}})). Since you probably have setup a SSL
certificate for your blog, the simplest way to go is to with a reverse proxy. In my `nginx`
configuration:

    location /_gowebmake {
        rewrite ^/_gowebmake(/.*)$ $1 break;
        proxy_pass http://localhost:8777/;
        proxy_redirect off;
    }

The webhook is then accessible from the address `https://yourblog.com/_webhook`. Please note that
even if someone finds out your webhook URL, they won't be able to send anything as all requests are
signed by GitHub (hence the secret in the configuration).

## GitHub Configuration

Simply go to the webhook section of your repo, and add yours to the list. You'll be asked a secret,
use the one you've put in your `gowebmake` configuration.

If you ever need to debug, GitHub lists all the calls made to your hook and allows you to re-send
them if needed.

## Profit

When all of this is done, then deploying is as simple as `git push origin develop`.

# Conclusion

I spent a lot of time fighting to cure a very small problem. It doesn't matter, it was much more fun
and now I am able to deploy this blog extremely simply.

On a sidenote, everything with `hugo` seems pretty much instant, just like `gowebmake` and `make`
run very fast themselves. Which makes me kind of tired of waiting for `npm` or anything being
slow in a very general rule. That's just a feeling though.
