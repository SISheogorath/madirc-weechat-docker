#!/bin/sh

tor >/dev/null &

cat /logo.txt


echo "Waiting for 20 seconds for tor connection…"
sleep 20

WEE_CMDS=""

if [ "$SASL_USER" != "" ] && [ "$NICKNAME" = "" ]; then
    NICKNAME=$SASL_USER
fi

# Basic setup
WEE_CMDS="$WEE_CMDS/proxy add tor socks5 127.0.0.1 9050;"
WEE_CMDS="$WEE_CMDS/server add madirc qj3m7wxqk4pfqwob.onion/6697;"
WEE_CMDS="$WEE_CMDS/set irc.server.madirc.ssl on;"
WEE_CMDS="$WEE_CMDS/set irc.server.madirc.ssl_fingerprint 4d8aa50f264fc40a67ce5154c65634da91570ea08d03fb72b5994b646165ad22;"
WEE_CMDS="$WEE_CMDS/set irc.server.madirc.proxy tor;"
WEE_CMDS="$WEE_CMDS/set irc.server.madirc.nicks ${NICKNAME:-Tor-User${RANDOM}},${NICKNAME:-Tor-User}${RANDOM},${NICKNAME:-Tor-User}${RANDOM},${NICKNAME:-Tor-User}${RANDOM};"
WEE_CMDS="$WEE_CMDS/set irc.server.madirc.realname \"\";"

# Remove quit and part message to improve privacy
WEE_CMDS="$WEE_CMDS/set irc.server.madirc.msg_part \"\";"
WEE_CMDS="$WEE_CMDS/set irc.server.madirc.msg_quit \"\";"

if [ "$SASL_USER" != "" ] && [ "$SASL_PASSWORD" != "" ]; then
    WEE_CMDS="$WEE_CMDS/set irc.server.madirc.sasl_username $SASL_USER;"
    WEE_CMDS="$WEE_CMDS/set irc.server.madirc.sasl_password $SASL_PASSWORD;"
fi

# Connect to the IRC network
WEE_CMDS="$WEE_CMDS/connect madirc;"

# Don't want to see people join and part without saying something
WEE_CMDS="$WEE_CMDS/set irc.look.smart_filter on;"
WEE_CMDS="$WEE_CMDS/filter add irc_smart * irc_smart_filter *;"
WEE_CMDS="$WEE_CMDS/set irc.look.smart_filter_delay 1;"

# Remove CTCP Answers
WEE_CMDS="$WEE_CMDS/set irc.ctcp.clientinfo \"\";"
WEE_CMDS="$WEE_CMDS/set irc.ctcp.finger \"\";"
WEE_CMDS="$WEE_CMDS/set irc.ctcp.source \"\";"
WEE_CMDS="$WEE_CMDS/set irc.ctcp.time \"\";"
WEE_CMDS="$WEE_CMDS/set irc.ctcp.userinfo \"\";"
WEE_CMDS="$WEE_CMDS/set irc.ctcp.version \"\";"
WEE_CMDS="$WEE_CMDS/set irc.ctcp.ping \"\";"

# Remove xfer to disable DCC
WEE_CMDS="$WEE_CMDS/plugin unload xfer;"



exec weechat --run-command "$WEE_CMDS"
