#!/bin/bash

python3 csvs/mem_graph.py
python3 csvs/process_mem.py
python3 csvs/process_virt.py
python3 csvs/swap_graph.py