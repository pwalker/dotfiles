alias yaarn="yarn && yarn start-dashboard"

alias rwgps-ui-refresh="git fetch upstream && git rebase upstream/master"

alias rwgps-port-3000="echo \"rdr pass inet proto tcp from any to any port 80 -> 127.0.0.1 port 3080\" | sudo pfctl -ef - > /dev/null 2>&1"

alias r="./ride.rb"
