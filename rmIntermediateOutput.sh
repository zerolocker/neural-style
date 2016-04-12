#!/bin/sh
for file in $(ls |grep -P --color iter\\d+.png );do echo 'rm ' ${file}; rm $file; done

