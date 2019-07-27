
```

kubectl expose deployment deployment_name 创建暴露一个serivce
```

1、创建的POD 地址可能会改变，因此要用service 来访问pod ，
因为service 只是一个iptables 的规则，所以在所有的访问pod 的请求都会到service 中
DNS 可以让service的地址使用名称来访问，并且只能在k8s 集群中才可以访问

如果需要外部访问service ,需要将service 的类型设置为NodePort 
```

kubectl edit  可以修改资源
```

```

kubectl get pod  -w 可以监控
```

2、