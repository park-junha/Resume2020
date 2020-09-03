#!/bin/bash
# MAC OS ONLY

BASE_DIR="$(cd "$(dirname "$0" )" && pwd )"
BROWSER="Google Chrome"

open -a "$BROWSER" $BASE_DIR/index.html
