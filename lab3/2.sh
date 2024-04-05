#!/bin/bash

bash 1.sh

at now -f 1.sh

tail -fn0 report # 0 means do not print existing lines and start tracking new lines
/root/itmo-os-y26/lab3/2.sh