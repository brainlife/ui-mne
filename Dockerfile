FROM python:3.6

RUN pip3 install mne==0.22.1 
RUN pip3 install notebook
RUN pip3 install matplotlib
RUN pip3 install ipympl

#ADD test.ipynb /test.ipynb
ADD main.ipynb /main.ipynb
RUN jupyter trust /main.ipynb

ADD run.sh /run.sh
ENTRYPOINT /run.sh
