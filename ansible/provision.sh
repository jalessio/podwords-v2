#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
readonly SCRIPT_DIR

cd "$SCRIPT_DIR"

ansible-playbook -i inventory.yml playbook.yml
