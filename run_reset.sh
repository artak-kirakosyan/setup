#!/bin/bash


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $SCRIPT_DIR
echo `pwd`

export PYTHONPATH=$SCRIPT_DIR:$PYTHONPATH
python3 reset.py >> reset.log 2>&1

# Add me as a cron job as follows:
# @reboot /home/artak/Documents/scripts/run_reset.sh
