FROM python:3.6

RUN pip3 install mne==0.22.1 
RUN pip3 install notebook

ADD test.ipynb /test.ipynb
ADD run.sh /run.sh

ENTRYPOINT /run.sh
