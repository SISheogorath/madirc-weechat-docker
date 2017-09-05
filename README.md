MadIRC weechat docker
===

[![MadIRC #Elite](https://img.shields.io/badge/MadIRC-%23Elite-green.svg)](https://webclient.madirc.net/?join=%23Elite)

This docker image provides a minimal environment that contains weechat and
tor.

It automatically starts tor on startup and connects MadIRC using the MadIRC
onion service.

We secure this connection with TLS and authenticate the connection with a 
SHA256 certifcate fingerprint to make sure you connect the right backend.

### Requirements

To run this image you need docker installed.

See the [official docker guide](https://docs.docker.com/engine/installation/) about how to install it.

### To build using the Dockerfile

```bash
$ git clone https://github.com/MadIRCnet/madirc-weechat-docker.git
$ cd madirc-weechat-docker
$ docker build -t madirc/weechat-docker .
```

### Or pull the image from the Docker repository

```bash
$ docker pull madirc/weechat-docker
```

### To run

```bash
$ docker run -it --rm madirc/weechat-docker
```

### Usage

Check out the [Weechat Quick Start Guide](https://weechat.org/files/doc/stable/weechat_quickstart.en.html#join_part_irc_channels) to learn the basics. You can also see our [own tutorial about IRC basics](https://madirc.net/2017/07/30/irc-basics.html)

Use `/list` to show channels list, `/join #channelname` to join and `/quit` to exit.

#### SASL

Once you [signed up on MadIRC](https://madirc.net/2017/08/03/how-to-register-anonymously.html) you may want to use SASL to idenfity.

To automatically idenfitify yourself to the services you only need to set `SASL_USER` and `SASL_PASSWORD`:

```bash
$ docker run -it --rm -e "SASL_USER=someuser" -e "SASL_PASSWORD=s3cret"  madirc/weechat-docker
```


### Hints

On MadIRC our main Tor-Channel is #Elite. But feel free to found your own!


### Additional notes

Security improvement by following this guide: https://gist.github.com/noromanba/b4f7168de1e2399ab917

