#!/bin/bash

nvidia-docker run --rm --name jsra2_adg -e NVIDIA_VISIBLE_DEVICES=0 jsra2_adg sh docker_swedish_training.sh