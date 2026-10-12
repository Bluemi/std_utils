#!/bin/bash

# Configuration
INTERFACE="wlan0" # Change to your interface (check with 'ip link')
LIMIT="20kbps"    # Desired limit
LATENCY="50ms"     # Max time packets wait in queue
BURST="1540"       # Bucket size (1540 is standard for MTU)

case "$1" in
  start)
    echo "Limiting $INTERFACE to $LIMIT..."
    # Add a root queuing discipline
    sudo tc qdisc add dev $INTERFACE root tbf rate $LIMIT latency $LATENCY burst $BURST
    ;;
  stop)
    echo "Removing limits from $INTERFACE..."
    sudo tc qdisc del dev $INTERFACE root
    ;;
  status)
    tc -s qdisc show dev $INTERFACE
    ;;
  *)
    echo "Usage: $0 {start|stop|status}"
    ;;
esac
