#!/bin/bash

cd models/inlg2021/bert_based/
python trainer.py --do_train --train_data ../../../data/training.json --dev_data ../../../data/dev.json --save_steps 2000 --evaluation_strategy steps --eval_steps 2000 --output_dir output/aureg/ --metric_for_best_model eval_loss --per_device_train_batch_size 4 --per_device_eval_batch_size 4 --num_train_epochs 6 --model dccuchile/bert-base-spanish-wwm-cased --formulation areg

python3 generator.py -f output/aureg/checkpoint-26000 -dg output/aureg/dg_args.bin -o output/aureg/gen/res_dev_nlo_min_first -d ../../../data/dev.json -nlo -ls min_first

python3 evaluator.py -f results/aureg/gen/res_dev_nlo_min_first-26000.txt -t ../../../data/training.json --output-dir results/aureg/gen/ --pretrained dccuchile/bert-base-spanish-wwm-cased --language es --stanza-package gsd


python trainer.py --do_train --train_data ../../../data/training.json --dev_data ../../../data/dev.json --save_steps 2000 --evaluation_strategy steps --eval_steps 2000 --output_dir output/upmlm/ --metric_for_best_model eval_loss --per_device_train_batch_size 4 --per_device_eval_batch_size 4 --num_train_epochs 6 --model dccuchile/bert-base-spanish-wwm-cased  --formulation upmlm --upmlm_samples 30

python3 generator.py -f output/upmlm/checkpoint-22000 -dg output/upmlm/dg_args.bin -o output/upmlm/gen/res_dev_nlo_min_first -d ../../../data/dev.json -nlo -ls min_first

python3 evaluator.py -f results/upmlm/gen/res_dev_nlo_min_first-22000.txt -t ../../../data/training.json --output-dir results/upmlm/gen/ --pretrained dccuchile/bert-base-spanish-wwm-cased --language es --stanza-package gsd
# python trainer.py -h


# Best Model
python3 generator.py -f best_model/best_checkpoint -dg best_model/dg_args.bin -o best_model/gen/res_dev_nlo_min_first -d ../../../data/test.json -nlo -ls min_first

python3 evaluator.py -f best_model_results/gen/res_dev_nlo_min_first-point.txt -t ../../../data/training.json --output-dir best_model_results/gen/ --pretrained dccuchile/bert-base-spanish-wwm-cased --language es --stanza-package gsd