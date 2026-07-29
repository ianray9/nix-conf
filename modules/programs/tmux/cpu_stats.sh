#!/bin/zsh
top -l 1 | awk '/CPU usage/ {print 100-$7"%"}
