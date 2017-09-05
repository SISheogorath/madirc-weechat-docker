#!/bin/sh

tor >/dev/null &

echo "Sleep 20 seconds to let tor setup everything needed"
sleep 20

exec weechat --run-command "/proxy add tor socks5 127.0.0.1 9050;/server add madirc qj3m7wxqk4pfqwob.onion/6697;/set irc.server.madirc.ssl on;/set irc.server.madirc.ssl_fingerprint 134986c768e1d509423bbceac55c0e2ddd57aa4ddc26c2066aec2439b6f15ece;/set irc.server.madirc.proxy tor;/set irc.server.madirc.nicks Tor-User${RANDOM};/set irc.server.madirc.msg_part \"\";/set irc.server.madirc.msg_quit \"\";/connect madirc;/set irc.look.smart_filter on;/filter add irc_smart * irc_smart_filter *;/set irc.look.smart_filter_delay 1;/set irc.ctcp.clientinfo \"\";/set irc.ctcp.finger \"\";/set irc.ctcp.source \"\";/set irc.ctcp.time \"\";/set irc.ctcp.userinfo \"\";/set irc.ctcp.version \"\";/set irc.ctcp.ping \"\";/plugin unload xfer"
