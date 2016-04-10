#!/bin/sh
for file in $(ls |grep -P --color \\d_\\d00.png );do echo 'rm ' ${file}; rm $file; done

