#!/bin/sh
#SBATCH -J CS381VpROJ           # Job name
#SBATCH -o experiment.out    # Specify stdout output file (%j expands to jobId)
#SBATCH -p gpu           		 # Queue name
#SBATCH -N 1                     # Total number of nodes requested (16 cores/node)
#SBATCH -n 1                     # Total number of tasks
#SBATCH -t 11:30:00              # Run time (hh:mm:ss) - 1.5 hours

#SBATCH -A CS381V-Visual-Recogn         # Specify allocation to charge against

echo $@
# th neural_style.lua -style_image /work/04006/zhuode93/maverick/neural-style/myimg/input/guoyuan.jpg -content_image /work/04006/zhuode93/maverick/neural-style/myimg/input/dm.jpg -backend cudnn $@

for style in 10 100 1000; do

#th neural_style.lua -style_image myimg/input/guoyuan.jpg -content_image myimg/input/dm.jpg -backend cudnn -output_image initrnd_style_${style}.png -image_size 1000 -style_weight ${style}

th ori_neural_style.lua -style_image myimg/input/guoyuan.jpg -content_image myimg/input/dm.jpg -backend cudnn -output_image initrnd_style_${style}.png -image_size 1000 -style_weight ${style}

#th neural_style.lua -style_image myimg/input/guoyuan.jpg -content_image myimg/input/dm.jpg -backend cudnn -output_image initimg_style_${style}.png -image_size 1000 -style_weight ${style} -init image

th ori_neural_style.lua -style_image myimg/input/guoyuan.jpg -content_image myimg/input/dm.jpg -backend cudnn -output_image initimg_style_${style}.png -image_size 1000 -style_weight ${style} -init image


done
 
