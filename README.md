# kaboomserver-docker

[kaboomserver/server](https://github.com/kaboomserver/server/issues) for [Docker](https://docker.com/)

# :warning: This image does not restart

Why? Because it's using [server](https://github.com/kaboomserver/server) instead of [framework](https://github.com/kaboomserver/framework)

I opted to do it this way since [framework](https://github.com/kaboomserver/framework) was simply too hacky for me

- It (ab)used [dtach](https://dtach.sourceforge.net/) and [cron](https://en.wikipedia.org/wiki/Cron)
- Background jobs were used everywhere, requiring wrappers to be able to interop with Docker

There exists a [dtach package](https://pkgs.alpinelinux.org/package/edge/main/armhf/dtach) for alpine and I actually got cron and crontab to work!

```Dockerfile
RUN crontab framework/config/crontab

ENTRYPOINT [ "cron", "-f" ]
```

So there's still hope for [kaboomserver/framework](https://github.com/kaboomserver/framework) in Docker!

Are you up to the challenge?
