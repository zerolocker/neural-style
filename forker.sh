#!/bin/sh

face_layer=relu3_2

for style_pic in horse rain sunset town
for style in 600; do
for facew in 1 30 60; do
	export style_pic style facew face_layer
	sbatch cmd.sh 
done
done
