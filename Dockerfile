FROM nipype/nipype:latest
RUN conda install jupyter
EXPOSE 8888
RUN git clone https://github.com/akeshavan/nbpapaya && \
    cd nbpapaya && \
    git submodule update --init --recursive &&\
    python setup.py install
ENV NB_USER anisha
RUN useradd -m -s /bin/bash -N -u 1000 $NB_USER 
USER $NB_USER



