#!/bin/bash
# run.sh
# parameters: input file name (.icl)

name=$(basename $1 .icl)
./iclc < $1 > $name.s"
