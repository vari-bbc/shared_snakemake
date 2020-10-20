# shared_snakemake

This is a repository for Snakefiles containing commonly used snakemake rules and workflows that can be plugged into various projects.

# Assumptions

Rules in this repo are written with the following assumptions. If your project workflow violates these assumptions, some of the rules here may not work.

1. Fastq files are in `raw_data/` and have `.fastq.gz` as the file extension. You can try `include: rules/preprocess/convert2fastq_gz`, which will compress or symlink to obtain files with 'fastq.gz' extensions.

2. Every rule here specifies 'log.stdout' and 'log.stderr', which can be used to redirect stdout and stderr for each PBS job submitted by snakemake; use `-o {log.stdout} -e {log.stderr}` when specifying the `qsub` call in the `--cluster` parameter of `snakemake`.

