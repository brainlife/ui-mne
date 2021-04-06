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

cat <<EOF > /config.py
c.NotebookApp.allow_root = True
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.port = 80
c.NotebookApp.token = ''
c.NotebookApp.base_url = '$BASEURL'
EOF

jupyter notebook --config=/config.py ./output.ipynb


