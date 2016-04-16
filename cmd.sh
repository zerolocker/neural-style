#!/bin/sh
#SBATCH -J CS381VpROJ           # Job name
#SBATCH -o experiment.out    # Specify stdout output file (%j expands to jobId)
#SBATCH -p gpu           		 # Queue name
#SBATCH -N 1                     # Total number of nodes requested (16 cores/node)
#SBATCH -n 1                     # Total number of tasks
#SBATCH -t 11:30:00              # Run time (hh:mm:ss) - 1.5 hours
#SBATCH -A CS381V-Visual-Recogn         # Specify allocation to charge against

echo $@


th neural_style.lua -content_image myimg/me.jpg -style_image myimg/horse.jpg -backend cudnn -seed 200 -save_iter 500 -style_weight ${style} -image_size 1000 -content_layers relu4_2 -face_layer relu4_2 -face_weight ${facew} -output_image style_${style}_relu42_face_relu42_facew${facew}.png

