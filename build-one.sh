#!/bin/bash

NOTEBOOK="${1}"

./reset-dockerfile.sh
./create-patch.sh
make arch_patch/${NOTEBOOK}
make build/${NOTEBOOK}
make test/${NOTEBOOK}
./reset-dockerfile.sh
