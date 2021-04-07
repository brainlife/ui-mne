#!/bin/bash

set -e
set -x

#echo "trusting main.ipynb"
#jupyter trust /main.ipynb

#running before opening just updates static output. user still has to rerun cell
#so that data will be loaded into memory, and plots to become interactable
#echo "running notebook prior to opening it"
#jupyter nbconvert --to notebook --execute /main.ipynb --output /output.ipynb
#jupyter trust /output.ipynb


cat <<EOF > /config.py
c.NotebookApp.allow_root = True
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.port = 80
c.NotebookApp.token = ''
c.NotebookApp.base_url = '$BASEURL'
#c.NotebookApp.webapp_settings = {'static_url_prefix':'$BASEURL'}
EOF

#echo "debug.."
#cat /config.py

echo "starting jupyter server"
jupyter notebook --config=/config.py #./output.ipynb

