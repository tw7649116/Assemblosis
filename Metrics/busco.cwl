cwlVersion: v1.0
class: CommandLineTool
id: "busco"
doc: "Estimate the completeness of a genome using predicted genes"
requirements:
  - class: InlineJavascriptRequirement
  - class: EnvVarRequirement
    envDef:
      AUGUSTUS_CONFIG_PATH: $(inputs.currentDir)/cwltool_deps/_conda/envs/__busco@3.0.2/config
inputs:
  - id: currentDir
    type: string
  - id: assembly
    type: File
    inputBinding:
      prefix: -i
      position: 1
  - id: lineage
    type: Directory
    inputBinding:
      prefix: -l
      position: 2
  - id: mode
    type: string
    default: geno
    inputBinding:
      prefix: -m
      position: 3
  - id: outputName
    type: string
    inputBinding:
      prefix: -o
      position: 4
  - id: threads
    type: int
    inputBinding:
      prefix: -c
      position: 1
outputs:
#  - id: assembled
#    type:
#      type: array
#      items: [File, Directory]
#    outputBinding:
#      glob: "*"
  - id: buscoResult
    type: File
    outputBinding:
      glob: run_*/short_summary_*.txt
baseCommand: ["run_BUSCO.py", "-f"]
arguments: []
#stdout: out
hints:
  SoftwareRequirement:
    packages:
    - package: busco
      version:
      - "3.0.2"