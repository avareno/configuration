#!/bin/bash
ckb-next & 
sleep 1
xdotool search --onlyvisible --class "ckb-next" windowclose
