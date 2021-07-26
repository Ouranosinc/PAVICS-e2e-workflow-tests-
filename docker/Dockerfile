FROM continuumio/miniconda3

RUN conda update conda

# to checkout other notebooks and to run pip install
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y git mercurial gcc unzip patch fonts-humor-sans && \
    apt-get clean

COPY environment.yml /environment.yml

# needed for our specific jenkins
RUN groupadd --gid 1000 jenkins \
    && useradd --uid 1000 --gid jenkins --create-home jenkins

# Change these folders' permissions for jupyter-conda extension
RUN chmod -R a+rwx /opt/conda

# create env "birdy"
# use umask 0000 so that the files for the new environment are usable by user 'jenkins' for the jupyter-conda-extension
RUN umask 0000 && conda env create -f /environment.yml

# alternate way to 'source activate birdy'
ENV PATH="/opt/conda/envs/birdy/bin:$PATH"

# our notebooks are hardcoded to lookup for kernel named 'birdy'
# this python is from the birdy env above
RUN python -m ipykernel install --name birdy

# install using same channel preferences as birdy original env to not downgrade
# anything accidentally
# this is for debug only, all dependencies should be specified in
# environment.yml above
# RUN conda install -c conda-forge -c cdat -c bokeh -c plotly -c defaults -n birdy nbdime

# build jupyterlab extensions installed by conda, see `jupyter labextension list`
RUN jupyter lab build

# for ipywidgets to work with jupyter lab (notebooks works out of the box)
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    && jupyter serverextension enable voila --sys-prefix \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager jupyter-leaflet \
    && jupyter labextension install @jupyterlab/debugger \
    && jupyter labextension install jupyterlab-topbar-text
#    && jupyter labextension install jupyterlab-clipboard

ADD https://raw.githubusercontent.com/jupyter/docker-stacks/master/base-notebook/start.sh /usr/local/bin/
ADD https://raw.githubusercontent.com/jupyter/docker-stacks/master/base-notebook/start-singleuser.sh /usr/local/bin/
ADD https://raw.githubusercontent.com/jupyter/docker-stacks/master/base-notebook/start-notebook.sh /usr/local/bin/
ADD https://raw.githubusercontent.com/jupyter/docker-stacks/master/base-notebook/fix-permissions /usr/local/bin/
ADD https://raw.githubusercontent.com/jupyter/docker-stacks/master/base-notebook/jupyter_notebook_config.py /etc/jupyter/
RUN chmod a+rx /usr/local/bin/start.sh /usr/local/bin/start-singleuser.sh /usr/local/bin/start-notebook.sh /usr/local/bin/fix-permissions; \
    chmod a+r /etc/jupyter/jupyter_notebook_config.py

# For Pavics-landing notebooks to re-create Jupyter env layout:
# /notebook_dir/writable-workspace, /notebook_dir/pavics-homepage.
#
# Path to the /notebook_dir/pavics-homepage/tutorial_data/*.geojson files are
# hardcoded so users can copy the nb to writable-workspace/ dir and still be able
# to run them seemlessly from the Jupyter env (without having to also copy
# those *.geojson files with the notebooks).
RUN mkdir /notebook_dir && chown jenkins /notebook_dir

# problem running start-notebook.sh when being root
# the jupyter/base-notebook image also do not default to root user so we do the same here
USER jenkins

# follow jupyter/base-notebook image so config in jupyterhub is simpler
# start notebook in conda environment to have working jupyter extensions
CMD ["conda", "run", "-n", "birdy", "/usr/local/bin/start-notebook.sh"]
