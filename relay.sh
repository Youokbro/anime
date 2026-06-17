#!/bin/bash
case "$1" in
  start)
    pkill -f "node index.js" 2>/dev/null
    pkill -f cloudflared 2>/dev/null
    cd /tmp/anime-relay
    PORT=3456 nohup node index.js > /tmp/relay.log 2>&1 &
    sleep 2
    echo "Relay running at http://localhost:3456"
    echo "Stop with: bash $(realpath "$0") stop"
    tail -1 /tmp/relay.log
    ;;
  stop)
    pkill -f "node index.js" 2>/dev/null
    pkill -f cloudflared 2>/dev/null
    echo "Relay stopped"
    ;;
  status)
    pgrep -f "node index.js" >/dev/null && echo "Running (pid $(pgrep -f 'node index.js'))" || echo "Not running"
    ;;
  restart)
    bash "$0" stop >/dev/null 2>&1
    sleep 1
    bash "$0" start
    ;;
  *)
    echo "Usage: $0 {start|stop|restart|status}"
    ;;
esac
