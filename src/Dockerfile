FROM rocker/tidyverse

RUN apt-get update \
    && apt-get install -y \
    libxt6 \
    cargo

RUN Rscript -e "install.packages('rmdformats')"

#session 1
RUN Rscript -e "install.packages('rvest')"
RUN Rscript -e "install.packages('remotes'); remotes::install_github('rlesur/klippy')"

#session 3
RUN Rscript -e "install.packages('gganimate')"
RUN Rscript -e "install.packages('gifski')"
RUN Rscript -e "install.packages('openxlsx')"

#session4
RUN Rscript -e "install.packages(c('ghibli', 'nycflights13','viridis'))"