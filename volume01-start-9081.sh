nohup weed volume \
-ip=192.168.60.59  \
-port=9081 \
-dir=/home/lumine/seaweedfs-data/volume01 \
-max=7 -fileSizeLimitMB=10000 \
-mserver=192.168.60.59:9333 \
-dataCenter=dc1 \
-rack=rack1 \
-max=100 \
>/home/lumine/seaweedfs-data/volume01.log 2>&1&

