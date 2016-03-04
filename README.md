# tools-benchmarks
Benchmark script for various tools


# HOWTO

```
$ ./bench_exec.sh 
Invalid argument. (require software, templatePath, outputDir)
```

## log convert

convert time output to seconds only.

```
egrep "^(real|user|sys)" bench_bowtie2.log | awk -F'[\tm]' -vOFS="\t" '{print $1,$2 * 60 + $3}'
```

### result

```
real    283.425
user    0.074
sys    0.023
real    281.689
user    0.076
sys    0.023
```
