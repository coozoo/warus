#!/bin/bash

cd "${0/*}";


targetips=$(cat targets)

echo $targetips


xargs -I{} -0 -n 1 -P 4 ./starter.sh {} < <(tr \\n \\0 <genips)
