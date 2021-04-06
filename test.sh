#docker run -p 8888:8888 brainlife/mne-notebook:0.22.1
#docker run --rm -v `pwd`/input:/input -p 8888:8888 -d brainlife/mne-notebook:0.22.1 jupyter notebook --allow-root /test.ipynb

./build.sh

docker run --name notebook-test --network=host --rm -v `pwd`/input:/input -d brainlife/mne-notebook:0.22.1
#jupyter notebook --allow-root


docker logs -f notebook-test

