# For CCMiner

docker build -t verusccminer .
docker run --cpus=8 --name verusccminer verusccminer -a verus -o stratum+tcp://ap.luckpool.net:3956 -u RDrES1DKu7uTTcfWhbWuoGevTCpbmnapwd.hackintosh -p hybrid -t15

# For Hellminer

docker build -t verushellminer .
docker run --cpus=8 --name verushellminer verushellminer -c stratum+tcp://ap.luckpool.net:3956#xnsub -u RDrES1DKu7uTTcfWhbWuoGevTCpbmnapwd.hackintosh3 -p hybrid --cpu 15
