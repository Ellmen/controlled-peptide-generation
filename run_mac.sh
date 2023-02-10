#!/bin/bash
set -e

# TO DEFAULT OUTPUT DIRS, TINY (DEBUG) RUN
hypers="--tiny 1 --resume_result_json 0"
override_runname="" # runname: default  -> tb/default and output/default

git log --graph --full-history --all --oneline | head -n 15
git status

loadpath="" # empty to resume from local phase 1 VAE pretrain; set to resume another phase1.
/usr/bin/time python main.py $override_runname $loadpath $hypers --phase 1
/usr/bin/time python static_eval.py $override_runname $hypers --phase 1 $static_eval_long
