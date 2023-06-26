#!/bin/bash

cd SweQUAD-MC/models/inlg2021/bert_based/
python trainer.py --do_train --train_data ../../../data/training.json --output_dir output/areg/ --per_device_train_batch_size 4 --per_device_eval_batch_size 4 --num_train_epochs 8 --model KB/bert-base-swedish-cased --formulation areg
# python3 generator.py -f output/areg/checkpoint-3000 -dg output/areg/dg_args.bin -o output/areg/res_dev_nlo_min_first.txt -d ../../../data/dev.json -nlo -ls min_first
# python trainer.py -h
