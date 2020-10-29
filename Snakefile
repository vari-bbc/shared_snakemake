import pandas as pd
import numpy as np
import os
import re
from snakemake.utils import validate, min_version
##### set minimum snakemake version #####
min_version("5.20.1")


include: "rules/fastq_qc/fastqc"
include: "rules/fastq_qc/fastq_lengths"
include: "rules/fastq_qc/fastq_screen"
include: "rules/preprocess/convert2fastq_gz"
include: "rules/post_alignment/mosdepth"
