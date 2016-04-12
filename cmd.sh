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
th neural_style.lua -style_image /work/04006/zhuode93/maverick/neural-style/myimg/input/guoyuan.jpg -content_image /work/04006/zhuode93/maverick/neural-style/myimg/input/dm.jpg -backend cudnn -image_size 1000 -content_layers relu3_2 -output_image initrnd_style_100_relu32_gauss_10x.png
#th neural_style.lua -style_image /work/04006/zhuode93/maverick/neural-style/myimg/input/guoyuan.jpg -content_image /work/04006/zhuode93/maverick/neural-style/myimg/input/dm.jpg -backend cudnn -image_size 1000 -output_image initrnd_style_100_gauss_10x.png
 

for style in 10 100 1000; do
#th ori_neural_style.lua -style_image myimg/input/flame.jpg -content_image myimg/input/daenerys.jpg -backend cudnn -output_image initrnd_style_${style}_relu42.png -image_size 1000 -style_weight ${style} -content_layers relu4_2
#th ori_neural_style.lua -style_image myimg/input/flame.jpg -content_image myimg/input/daenerys.jpg -backend cudnn -output_image initrnd_style_${style}_relu32.png -image_size 1000 -style_weight ${style} -content_layers relu3_2
#th ori_neural_style.lua -style_image myimg/input/flame.jpg -content_image myimg/input/daenerys.jpg -backend cudnn -output_image initrnd_style_${style}_relu31.png -image_size 1000 -style_weight ${style} -content_layers relu3_1
done

#for content in 5e-1 5e0 5e1; do
#th ori_neural_style.lua -style_image myimg/input/guoyuan.jpg -content_image myimg/input/dm.jpg -backend cudnn -output_image initrnd_relu32_content_${content}.png -image_size 1000 -content_layers relu3_2 -content_weight ${content}
#done
