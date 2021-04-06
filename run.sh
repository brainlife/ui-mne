#!/bin/bash

set -e
set -x

echo "trusting main.ipynb"
jupyter trust /main.ipynb

echo "running notebook prior to opening it"
jupyter nbconvert --to notebook --execute /main.ipynb --output /output.ipynb
jupyter trust /output.ipynb

echo "starting jupyter notebook server"

cat <<EOF > /config.py
c.NotebookApp.allow_root = True
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.port = 80
#c.NotebookApp.token = '$TOKEN'
c.NotebookApp.token = ''
c.NotebookApp.base_url = '$BASEURL'
#c.NotebookApp.webapp_settings = {'static_url_prefix':'$BASEURL'}
EOF

echo "debug.."
cat /config.py

echo "starting notebook"
jupyter notebook --config=/config.py ./output.ipynb


