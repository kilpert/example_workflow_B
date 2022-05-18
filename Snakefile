from snakemake.utils import min_version
min_version("6.0")


module example_workflow_A:
    snakefile: github("kilpert/example_workflow_A", path="Snakefile", branch="main")
    config: config
    prefix: "example_workflow_A"

use rule * from example_workflow_A as example_workflow_A_*


rule txt:
    output:
        "results/B.txt"
    shell:
        "echo 'B' "
        ">{output} "


rule all:
    input:
        rules.example_workflow_A_all.input,
        "results/B.txt"
    default_target: True

