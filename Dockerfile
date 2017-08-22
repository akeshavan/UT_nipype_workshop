FROM nipype/nipype:latest
RUN conda install jupyter
EXPOSE 8888
RUN git clone https://github.com/akeshavan/nbpapaya && \
    cd nbpapaya && \
    git submodule update --init --recursive &&\
    python setup.py install
RUN pip install pybids
RUN chmod ugo+x /opt/spm12/run_spm12.sh /opt/spm12/spm12_glnxa64
RUN chmod ugo+w /opt/spm12
RUN chmod ugo+w /opt/spm12/spm12_glnxa64.ctf
ENV NB_USER anisha
RUN useradd -m -s /bin/bash -N -u 1000 $NB_USER 
USER $NB_USER
COPY start_notebook.sh /work/start_notebook.sh
ENTRYPOINT ["/work/start_notebook.sh"]



