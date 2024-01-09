FROM --platform=linux/amd64 r-base

RUN mkdir /data
RUN mkdir /code
RUN mkdir /output

RUN apt-get update
RUN apt-get -y install nano
RUN apt-get -y install libxml2
RUN apt-get -y install openssl
RUN apt-get -y install libssl-dev
RUN apt-get -y install libpng-dev
RUN apt-get -y install libjpeg-dev
RUN apt-get -y install libcurl4-openssl-dev 



COPY /code/install_packages.R /code/install_packages.R
RUN Rscript /code/install_packages.R

COPY /code/ggir_loop_test.R /code/ggir_loop_test.R

CMD Rscript /code/ggir_loop_test.R