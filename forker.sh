#!/bin/sh


for style in 300 600 900; do
for facew in 1 100 300 600 900; do
	export style facew
	sbatch cmd.sh 
done
done
