##### 直接创建的方式，在pod 中引入

1、一定要在创建pod之前创建configmap 否则，启动pod回因为找不到引用而失败

2、 使用`valueFrom.configMapKeyRef`   来引入configmap 中的配置项
```bash
env:
      - name: USER
        valueFrom:
          configMapKeyRef:
            name: config
            key: user
```

##### 使用文件的方式创建configmap
是文件类型的应该怎么取出来？？？

```bash



```
1、

