#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"
bash .devcontainer/start-blobevm.sh

printf 'BlobeVM is starting. Open http://localhost:3000 once it is ready.\n'
