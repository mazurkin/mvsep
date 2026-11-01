#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o monitor
set -o noglob

# calculate the script's directory
SCRIPT_DIR=$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")
declare -r SCRIPT_DIR

# calculate the package directory
PACKAGE_DIR=$(dirname -- "${SCRIPT_DIR}")
declare -r -x PACKAGE_DIR

# python settings
export PYTHONPATH="${PACKAGE_DIR}/zfturbo-mvsep"
export PYTHONDONTWRITEBYTECODE="1"
export PYTHONUNBUFFERED="1"
export PYTHONWARNINGS="ignore"

# input file
INPUT_FILE=$(realpath "${1}")
declare -r INPUT_FILE
shift

# run
exec conda run --no-capture-output --live-stream --name mvsep --cwd "${PACKAGE_DIR}/zfturbo-mvsep" \
    python3 inference.py \
        --input_audio "${INPUT_FILE}" \
        --output_folder  "${PACKAGE_DIR}/separated" \
        --overlap_small 0.8 \
        --overlap_large 0.8 \
        "$@"
