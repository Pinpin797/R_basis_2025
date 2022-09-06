FROM rocker/tidyverse

RUN apt-get update \
    && apt-get install -y \
    libxt6

RUN Rscript -e "install.packages('rmdformats')"

#session 1
RUN Rscript -e "install.packages('rvest')"
RUN Rscript -e "install.packages('remotes'); remotes::install_github('rlesur/klippy')"
