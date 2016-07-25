#!/usr/bin/env bash
bundle exec puma -C config.rb &
sleep 5
ab -n 3000 -c 25 https://127.0.0.1:9292/ > ab_output.txt &
sleep 10
bundle exec pumactl -F config.rb phased-restart
sleep 20
bundle exec pumactl -F config.rb stop
cat ab_output.txt