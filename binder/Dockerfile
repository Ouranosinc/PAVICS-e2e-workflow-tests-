FROM pavics/workflow-tests:220414

USER root

COPY notebooks /notebooks

COPY default_build_params /notebooks
COPY downloadrepos /notebooks
COPY binder/reorg-notebooks /notebooks

WORKDIR /notebooks

RUN ./downloadrepos; DEPLOY_PAVICS_LANDING_NB=1 ./reorg-notebooks; rm -rfv downloadrepos default_build_params reorg-notebooks; chown -R jenkins:jenkins .

RUN wget https://gist.githubusercontent.com/tlvu/f8a91585bac38af23c4f4490f94fc513/raw/0c7e0ab4af7b51aa5320b873b7f1bf641fc03e27/test-panel.ipynb -O TEST-panel.ipynb; chown jenkins:jenkins TEST-panel.ipynb

# RUN pip install https://github.com/Ouranosinc/xclim/archive/master.tar.gz

USER jenkins
