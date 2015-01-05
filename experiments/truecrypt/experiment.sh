#!/bin/bash

source ../funcs.sh
trap 'exp_failed' ERR

# Puts the ouput directory in $OUTPUT_DIR.
source ../experiment.sh

cp ../../flush-reload/myversion/spy $EXTRA_INPUT/
cp ../../flush-reload/myversion/RubyInterface.rb $EXTRA_INPUT/

status "Running the experiment script..."
ruby TrueCryptHiddenVolumeExperiment.rb 2>$OUTPUT_DIR/stderr 1> $OUTPUT_DIR/stdout

cp ./hidden.tc $OUTPUT_DIR/
cp ./standard.tc $OUTPUT_DIR/

exp_completed
