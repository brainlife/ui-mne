FROM python:3.6

RUN pip3 install mne==0.22.1 
RUN pip3 install notebook
RUN pip3 install matplotlib

ADD test.ipynb /test.ipynb
ADD main.ipynb /main.ipynb
ADD run.sh /run.sh

ENTRYPOINT /run.sh
