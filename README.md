# seaweedfs-script

* [链接1](https://gear.hermygong.com/p/seaweeds/)
* [链接2](https://github.com/seaweedfs/seaweedfs/discussions/5662)
* [Lessons learned so far](https://github.com/cycneuramus/seaweedfs-docker-swarm/issues/2)
* [Link](https://bambrow.com/20220107-seaweedfs-installation-guide/)
* [Link](http://blog.zollty.com/b/archive/summary-of-SeaweedFS-for-distributed-file-storage.html)
* [同程实践](https://mp.weixin.qq.com/s?src=11&timestamp=1749694141&ver=6047&signature=ZKsRdZox-D96YFSr3Frsk5mdgStIKdJYSIR2sN95uLxgseB1CnAx8ZlGzjjI3SHGOv5FUkgtMzuF1INJn48vNVQGFEaZOOpOSWGfhBV-tZEZlFl*Vv-BJdJoE4j6*5GG&new=1)
* [Link](https://github.com/Leif160519/seaweedfs)
* [Link](https://github.com/bingoohuang/blog/issues/57)
* [SeaweedFS Wiki](https://www.bookstack.cn/books/seaweedfs-wiki)

```
cd ~/seaweedfs-data
weed scaffold -config=security >> security.toml
```

[下载链接](https://github.com/seaweedfs/seaweedfs/releases/download/3.92/linux_amd64_full.tar.gz)

### Deployment

```shell
# 把 security.toml（由 weed scaffold -config=security -output="." 生成）复制到此目录
touch /etc/seaweedfs/security.toml

mkdir seaweedfs-data # /root/seaweedfs-data
cd seaweedfs-data
touch s3-config.json # 把 s3-config.json 内容复制到服务器上这个文件中

# 依次把 services 中的服务文件复制到 /etc/systemd/system/ 目录
# 修改相应的 IP，然后启动并设置开机启动
# 依次启动服务：master volume filer s3
```
