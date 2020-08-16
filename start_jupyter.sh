#!/bin/sh

# ssh -vnNT -L 8998:169.254.76.1:8998 glue@ec2.compute-1.amazonaws.com
jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root