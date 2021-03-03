FROM consol/ubuntu-xfce-vnc 

USER 0
RUN apt update && apt install unzip wget ftp -y
RUN wget -c -O pdi-ce-9.1.0.0-324.zip https://sourceforge.net/projects/pentaho/files/Pentaho%209.1/client-tools/pdi-ce-9.1.0.0-324.zip/download
RUN unzip pdi-ce-9.1.0.0-324.zip
RUN mkdir ./data-integration/DATA
RUN chown -R 1000:1000 ./data-integration \
    && apt install openjdk-8-jre-headless -y && java -version \
    && rm -rf pdi-ce-9.1.0.0-324.zip
RUN apt-get update \
    && apt-get install -y software-properties-common \
    && apt-add-repository 'deb http://cz.archive.ubuntu.com/ubuntu bionic main universe' \
    && apt-get install libwebkitgtk-1.0-0 -y


USER 1000
