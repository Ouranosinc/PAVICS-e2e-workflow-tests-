FROM pavics/workflow-tests:220414

USER root

#COPY notebooks /notebooks

#COPY default_build_params /notebooks
#COPY downloadrepos /notebooks
#COPY binder/reorg-notebooks /notebooks

WORKDIR /notebooks

#RUN ./downloadrepos; DEPLOY_PAVICS_LANDING_NB=1 ./reorg-notebooks; rm -rfv downloadrepos default_build_params reorg-notebooks; chown -R jenkins:jenkins .

ENV BOKEH_ALLOW_WS_ORIGIN "*"

RUN wget https://gist.githubusercontent.com/tlvu/f8a91585bac38af23c4f4490f94fc513/raw/30894efd1c0cd6b759b2a911e6fe50f16deae14d/TEST-panel-binder.ipynb -O TEST-panel-binder.ipynb; wget https://gist.githubusercontent.com/tlvu/f8a91585bac38af23c4f4490f94fc513/raw/30894efd1c0cd6b759b2a911e6fe50f16deae14d/TEST-panel-servable.ipynb -O TEST-panel-servable.ipynb; chown jenkins:jenkins *.ipynb

# RUN pip install https://github.com/Ouranosinc/xclim/archive/master.tar.gz

USER jenkins
