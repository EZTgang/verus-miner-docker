FROM ubuntu:16.04 as builder

RUN apt-get update \
    && apt-get install -y \
    build-essential \
    libssl-dev \
    libgmp-dev \
    libcurl4-openssl-dev \
    libjansson-dev \
    automake \
    && rm -rf /var/lib/apt/lists/*

ADD https://github.com/hellcatz/luckpool/raw/master/miners/hellminer_cpu_linux.tar.gz /helminer/
RUN cd helminer \
    && tar xzf hellminer_cpu_linux.tar.gz \
    && ls

# App
FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install screen \
    && apt-get install -y \
    libcurl3 \
    libjansson4 \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /helminer .
ENTRYPOINT ["./hellminer"]
#RUN ./hellminer -p --cpu 4  -c stratum+tcp://eu.luckpool.net:3956#xnsub -u RCrYp7n3Nzr7yErmpdhGnLaWFXeZTrcik9.MT60s
CMD ["-h"]
