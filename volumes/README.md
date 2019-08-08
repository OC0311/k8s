#### empty_dir
跟随pod 的生命周期
实验：
```bash
kc create  -f empty_dir.yml

访问
curl NodeIP:NodePort 

这时会会出现403

我们使用
kubectl exec -it empty-dir -c html-genertor -- /bin/sh
进入容器内部 写入一点内容
touch index.html &&  echo "index" >> index.html

再次访问,可以获得首页的内容
curl NodeIP:NodePort

```

#### hostpath
将文件系统直接挂在主机上，但是pod 会漂移所以不建议使用Host 进行存储数据

#### PVC 和 PV
上面的方法会将存储和pod解耦，所以要他们解耦，可以先定义好PV(持久卷),然后开发人员使用PVC(持久卷申请)，根据申请来分配PV






