#### 说明
daemonSet 会工作在每个node 上，主要用在一些日志手机等服务上

#### 更新策略
OnDelete :  默认策略,先删除在创建新的
RollingUpdate: 滚动更新和之前的rs 中的类似

#### node 选择
**nodeSelector: 直接根据标签选择**
```
 nodeSelector:
        region: hangzhou
```
**nodeAffinity: 喜好选择**
必须满足的条件
````bash
requiredDuringSchedulingIgnoredDuringExecution 

````

优先选择的条件





