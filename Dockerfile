FROM python:3.6

RUN pip3 install mne==0.22.1 
RUN pip3 install notebook

COPY test.ipynb /test.ipynb
COPY run.sh /run.sh

ENTRYPOINT /run.sh
