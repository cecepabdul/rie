FROM ubuntu:latest

# Update dan install dependencies
RUN apt-get update && \
    apt-get install -y g++ make m4 git libgmp-dev libssl-dev libcurl4-openssl-dev nlohmann-json3-dev

# Clone repository dan jalankan skrip
RUN git clone https://github.com/Pttn/rieMiner.git && \
    cd rieMiner && \
    ./GetDependencies.sh && \
    cd rieMiner0.93aDeps && \
    ./Build.sh && \
    cd .. && \
    make

# Download rieMiner.conf dari example.com dan copy ke folder rieMiner
RUN curl -o rieMiner.conf https://raw.githubusercontent.com/cecepabdul/rie/main/rieMiner.conf && \
    cp rieMiner.conf rieMiner/

# Perintah default yang akan dijalankan saat kontainer dijalankan
CMD cd rieMiner && ./rieMiner rieMiner.conf
