from underthesea import word_tokenize
from glob import glob
import os
import sys
import shutil
from tqdm import tqdm

input_folder = sys.argv[1]
output_folder = sys.argv[2]
if os.path.exists(output_folder):
    shutil.rmtree(output_folder)
os.makedirs(output_folder)
for file in glob(os.path.join(input_folder, "*")):
    if file.endswith("vi"):
        src_file = open(file, "r")
        dst_file = open(os.path.join(output_folder, os.path.basename(file)), "w")
        print(f"processing {file}")
        for sentence in tqdm(src_file.read().split("\n")):
            dst_file.write(word_tokenize(sentence, format="text") + '\n')
        print(f"\t->DONE\n")
    else:
        print(f"copying {file}")
        shutil.copy(file, output_folder)
        print(f"\t->DONE\n")

