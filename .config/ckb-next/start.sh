#!/bin/bash
ckb-next & 
sleep 2
xdotool search --onlyvisible --class "ckb-next" windowclose
