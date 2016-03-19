#!/bin/bash
run_file=$HOME/bin/already_run

if [ -f "$run_file" ]; then
  echo "Already run"
  exit
fi

echo "Run"

$HOME/bin/vpn_init.sh

touch $run_file
