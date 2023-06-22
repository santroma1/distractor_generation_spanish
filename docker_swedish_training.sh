#!/bin/bash

cd SweQUAD-MC/models/inlg2021/bert_based/
python trainer.py --do_train --train_data ../../../data/training.json --output_dir 