#!/usr/bin/env bash

set -euo pipefail

source /venv/bin/activate

if [ -f "/src/requirements.txt" ] && [ ${INSTALL_REQUIREMENTS:-0} -ne 0 ] ; then
    pip install -r /src/requirements.txt
fi

CMD=$@
JUPYTER_ARGS="--port=$PORT --ip=0.0.0.0"
case $1 in
    "lab")
        CMD="jupyter lab ${JUPYTER_ARGS} ${@:2}"
    ;;
    "notebook")
        CMD="jupyter notebook ${JUPYTER_ARGS} ${@:2}"
    ;;
esac

echo "Running command: $CMD"
exec $CMD
