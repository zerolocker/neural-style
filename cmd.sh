#!/bin/sh
#SBATCH -J CS381VpROJ           # Job name
#SBATCH -o experiment.out    # Specify stdout output file (%j expands to jobId)
#SBATCH -p gpu           		 # Queue name
#SBATCH -N 1                     # Total number of nodes requested (16 cores/node)
#SBATCH -n 1                     # Total number of tasks
#SBATCH -t 12:00:00              # Run time (hh:mm:ss) - 1.5 hours
#SBATCH -A CS381V-Visual-Recogn         # Specify allocation to charge against

echo $@

# th neural_style.lua -content_image myimg/me.jpg -style_image myimg/horse.jpg -backend cudnn -seed 200 -save_iter 500 -style_weight ${style} -image_size 1000 -content_layers relu4_2 -face_layer relu3_2 -face_weight ${facew} -output_image style_${style}_relu42_face_relu32_facew${facew}.png

for i in $(seq 1 70); do

content_name=$(printf "IMG%02d" "$i")

th neural_style.lua -content_image evaldata/${content_name}.jpg -style_image evaldata/style/${style_pic}.jpg -backend cudnn -seed 200 -save_iter -1 -style_weight ${style} -image_size 800 -content_layers relu4_2 -face_layer ${face_layer} -face_weight ${facew} -output_image evaldata/out/${content_name}/${style_pic}_style${style}_facew${facew}_${face_layer}.png

done


