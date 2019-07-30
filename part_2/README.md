**资源，对象**

- workload: Pod, Replicaset ....
- 服务发现及均衡： Service...
- 配置与存储： volume...
- 集群级资源：namespace ,role ... 
- 元数据资源： hpa ,limitRange...


**yaml 中非常只要的字段：**

- spec: 资源的规格，一个期望的特性（用户定义）

- status: 显示当前的状态，当前状态会想目标状态靠近



**创建资源的方法：**
- apiserver 只接受json  的资源定义
- 用yaml提供配置清单，apiserver 会自动转换

**大部分资源的配置清单：**
- apiVersion： 版本表示所属的群组  组名/version
使用`kubectl api-versions` 查看
- kind: 资源类别
- metadata: 元数据（name: namespace（k8s 中的概念）,lables,annotations:）
- spec: 期望状态
- status: 当前状态（自动维护）

**字段查询：**
因为spec 字段特别多，所以k8s提供了查询工具

```
kubectl explain pods 查看pod 如何定义


kubectl explain pods.metadata   查看pod中的某个字段
（只要是OBJECT 就可以可以嵌套多级）
```

**常用命令:**

```

kubectl create -f ./nginx.yml 创建对象

kubectl describe pods nginx 查看详细的信息

kubectl logs pod名 容器名（获取日志）

```








