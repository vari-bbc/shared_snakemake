# shared_snakemake

This is a repository for Snakefiles containing commonly used snakemake rules and workflows that can be plugged into various projects.

Table of Contents
=================

   * [Assumptions](#assumptions)
   * [Rules](#rules)
      * [fastqc](#fastqc)
      * [fastq_lengths](#fastq_lengths)
      * [fastq_screen](#fastq_screen)
      * [fq2fastq_gz](#fq2fastq_gz)
      * [fastq2fastq_gz](#fastq2fastq_gz)
      * [fq_gz2fastq_gz](#fq_gz2fastq_gz)
      * [mosdepth](#mosdepth)

# Assumptions

Rules in this repo are written with the following assumptions. If your project workflow violates these assumptions, some of the rules here may not work.

1. Fastq files are in `raw_data/` and have `.fastq.gz` as the file extension. You can try `include: rules/preprocess/convert2fastq_gz`, which will compress or symlink to obtain files with 'fastq.gz' extensions.

2. Every rule here specifies 'log.stdout' and 'log.stderr', which can be used to redirect stdout and stderr for each PBS job submitted by snakemake; use `-o {log.stdout} -e {log.stderr}` when specifying the `qsub` call in the `--cluster` parameter of `snakemake`.

# Add a new rule
1. Write the rule in a new file and place it in an appropriate subdirectory in 'rules/'.

2. Add `include: path/newrule` in 'Snakefile' in the root directory of this repo.

3. Run `snakemake -l | perl -lnpe 'BEGIN{print "# Rules\n"}; s/^(\S)/## $1/; s/^\s+//' >> README.md`

4. Go into README.md and remove the old rules documentation.

5. Update the TOC, either manually or using 'gd-md-toc' (https://github.com/ekalinin/github-markdown-toc).

# Rules

## fastqc

Run fastqc on raw_data/ files.

## fastq_lengths

Use seqtk to randomly subsample reads and print the read lengths. Seed and number of reads for subsampling are determined from the output file name.

## fastq_screen

Run fastq_screen to detect any contamination from other species or excessive rRNA.

## fq2fastq_gz

Convert fq to fastq.gz.

## fastq2fastq_gz

Convert fastq to fastq.gz.

## fq_gz2fastq_gz

Convert fq.gz to fastq.gz.

## mosdepth

Run mosdepth for summary of chromosome coverage. Excludes reads with MAPQ < 20 or any of the bits in SAM flag 1796.

