#!/bin/bash

set -e
set -x

echo "trusting test.ipynb"
jupyter trust /test.ipynb #this works

echo "running notebook prior to opening it"
jupyter nbconvert --to notebook --execute /test.ipynb --output /output.ipynb
jupyter trust /output.ipynb #this works

echo "starting jupyter notebook server"
#jupyter notebook --allow-root /test.ipynb
jupyter notebook --allow-root --NotebookApp.token='' --ip 0.0.0.0 --port 80 ./output.ipynb


