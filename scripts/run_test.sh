#!/bin/bash
#SBATCH --job-name ldb
#SBATCH --partition gpu_8
#SBATCH --output slurm/%A_%a.out
#SBATCH --cpus-per-task=4

set -e

source "${SLURM_CONFIGS-/slurm_configs}/scriptorium/all.sh"

scriptorium::slurm_setup_fixes

scriptorium::terminate_child_processes_on_exit

#eval "$(micromamba shell hook --shell bash)"

export PATH=$PATH:/home/justinchiu_cohere_com/.cargo/bin
uv sync

uv run python -c "import torch; print(torch.__version__)"
