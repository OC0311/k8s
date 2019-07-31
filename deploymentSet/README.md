#### 说明

1、 创建一个deployment 也就等于创建了一个rs，因为deployment 是在rs基础之上工作的
Replica Set 的名字总是 <Deployment 的名字>-<pod template 的 hash 值 >。
2、


#### 常用操作
**1、更新deployment**
试着将v1 版本更新到v2 版本
```bash
kubectl set image deployment/test-deployment web=test_web:v2
```
或者直接修改资源清单文件

```bash
kubectl edit deployment/test-deployment
```
将镜像版本更新为v2

可以通过查看以下命令查看更新的情况
```bash
kubectl rollout status deployment/test-deployment
```

通过`kubectl get rs 可以看到`更新操作会触发新的rs 的创建，老的rs 会被逐渐替换掉，知道全部更新完成

**更新的原理**

`RollingUpdate` 的更新策略：更新过后可以看到是会有两个rs 的
我们通过`kubectl describe deployment/test-deployment`命令可以看到，更新的过程。
整个过程会保证有四个pod 正在运行，不断的将老的一个个替换掉，知道新版的pod 副本数量达到了指定的数量
```bash

  Normal  ScalingReplicaSet  2m    deployment-controller  Scaled up replica set test-deployment-578c4cfdf6 to 3
  Normal  ScalingReplicaSet  2m    deployment-controller  Scaled up replica set test-deployment-7864476b7f to 1
  Normal  ScalingReplicaSet  2m    deployment-controller  Scaled down replica set test-deployment-578c4cfdf6 to 2
  Normal  ScalingReplicaSet  2m    deployment-controller  Scaled up replica set test-deployment-7864476b7f to 2
  Normal  ScalingReplicaSet  2m    deployment-controller  Scaled down replica set test-deployment-578c4cfdf6 to 1
  Normal  ScalingReplicaSet  2m    deployment-controller  Scaled up replica set test-deployment-7864476b7f to 3
  Normal  ScalingReplicaSet  2m    deployment-controller  Scaled down replica set test-deployment-578c4cfdf6 to 0

```

**2、Rollover（多个 rollout 并行）**

也就是说，你刚刚更新了一个,但是这个过程还没执行完，你就又更新了一次，这时不会先完成第一次的在去做第二次的，而是先将第一次的更新的杀死，然后直接更新第二次的


**3、版本回退**
先查看更新历史
```bash
kubectl rollout history deployment/test-deployment
```
使用 rollout undo 
```bash
kubectl rollout undo deployment/test-deployment
```
也可以直接加上` --to-revision=2` 版本号进行回退


**4、扩容**
```bash
kubectl scale deployment test-deployment --replicas 10
```

**5、暂停**
```bash

 kubectl rollout pause deployment/test-deployment
```
将deployment 暂停后对其进行修改不会造成 deployment 更新

恢复
```bash
kubectl rollout resume deploy deployment/test-deployment
```
恢复后之前修改过的就会开始更新,在没有恢复之前没办法回滚一个暂停的deployment

**6、更新策略**
Recreate: 先删除之前所有的老的，在新建新的
RollingUpdate: 会有两个rs 启动，新老rs 会交替新增和减少直到 新的全部替换完成
	maxSurge: 更新时保证额外最大的pod 的数量   比如pod 为3 maxSurge 那么最大就是为4
	maxUnavailable： 最大不可用，在更新的过程中最多maxUnavailable个pod 不能提供服务
	
	
**7、金丝雀发布**
就是先拿一部分当小白鼠，如果服务提供正常，在全部切换版本
先将maxSurge，maxUnavailable 设置为1，0 的意识就是先添加一个pod
这个pod 会从新版本中启动一个，这时共n+1 个

在滚动更新一个后时，先暂停更新，观察情况后在恢复









