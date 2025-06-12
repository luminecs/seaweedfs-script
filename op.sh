# 创建桶
aws s3api create-bucket --bucket my-test-bucket --endpoint-url http://192.168.60.59:9999 --profile seaweedfs

# 列出桶
aws s3api list-buckets --endpoint-url http://192.168.60.59:9999 --profile seaweedfs

# 创建大文件
dd if=/dev/urandom of=large_test_file.bin bs=1M count=100

# 上传文件
aws s3 cp large_test_file.bin s3://my-test-bucket/ \
  --endpoint-url http://192.168.60.59:9999 \
  --profile seaweedfs
  
# 列出文件
aws s3 ls s3://my-test-bucket/ \
  --endpoint-url http://192.168.60.59:9999 \
  --profile seaweedfs

# 获取元数据
aws s3api head-object --bucket my-test-bucket --key large_test_file.bin \
  --endpoint-url http://192.168.60.59:9999 \
  --profile seaweedfs

# 从 S3 下载文件，保存为 downloaded_file.bin
aws s3 cp s3://my-test-bucket/large_test_file.bin downloaded_file.bin \
  --endpoint-url http://192.168.60.59:9999 \
  --profile seaweedfs

# 计算原始文件和下载后文件的 md5 哈希值
md5sum large_test_file.bin
md5sum downloaded_file.bin

# lumine@fedora:~/seaweedfs-data/test-data$ aws s3 cp large_test_file.bin s3://my-test-bucket/   --endpoint-url http://192.168.60.59:9999   --profile seaweedfs
# upload: ./large_test_file.bin to s3://my-test-bucket/large_test_file.bin
# lumine@fedora:~/seaweedfs-data/test-data$ aws s3 ls s3://my-test-bucket/ \
#   --endpoint-url http://192.168.60.59:9999 \
#   --profile seaweedfs
# 2025-06-10 14:20:48  104857600 large_test_file.bin
# 2025-06-10 14:14:01          0 test.txt
# lumine@fedora:~/seaweedfs-data/test-data$ aws s3api head-object --bucket my-test-bucket --key large_test_file.bin \
#   --endpoint-url http://192.168.60.59:9999 \
#   --profile seaweedfs
# {
#     "AcceptRanges": "bytes",
#     "LastModified": "2025-06-10T06:20:48+00:00",
#     "ContentLength": 104857600,
#     "ETag": "\"03a53cfe6bbbb02614e3181a46235a74-25\"",
#     "ContentDisposition": "inline; filename=\"large_test_file.bin\"",
#     "ContentType": "application/octet-stream",
#     "Metadata": {}
# }
# lumine@fedora:~/seaweedfs-data/test-data$ aws s3 cp s3://my-test-bucket/large_test_file.bin downloaded_file.bin \
#   --endpoint-url http://192.168.60.59:9999 \
#   --profile seaweedfs
# download: s3://my-test-bucket/large_test_file.bin to ./downloaded_file.bin
# lumine@fedora:~/seaweedfs-data/test-data$ md5sum downloaded_file.bin 
# bcf133a5385361c17101ce61690c85f8  downloaded_file.bin
# lumine@fedora:~/seaweedfs-data/test-data$ md5sum large_test_file.bin 
# bcf133a5385361c17101ce61690c85f8  large_test_file.bin

# 删除文件
aws s3 rm s3://my-test-bucket/large_test_file.bin \
  --endpoint-url http://192.168.60.59:9999 \
  --profile seaweedfs

# 这会删除 logs/ 目录下的所有内容
aws s3 rm s3://my-test-bucket/logs/ --recursive \
  --endpoint-url http://192.168.60.59:9999 \
  --profile seaweedfs


# lumine@fedora:~/seaweedfs-data/test-data$ time aws s3 cp win10.iso s3://my-test-bucket/ \
#   --endpoint-url http://192.168.60.59:9999 \
#   --profile seaweedfs
# upload: ./win10.iso to s3://my-test-bucket/win10.iso               

# real	0m22.830s
# user	0m25.185s
# sys	0m17.767s
