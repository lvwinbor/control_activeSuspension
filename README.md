<!--
 * @Author: Wenbo Lv && wb.lv@qq.com
 * @Date: 2024-12-10
 * @LastEditors: Wenbo Lv && wb.lv@qq.com
 * @LastEditTime: 2024-12-10
 * 
-->
# 基于CAN总线的主动悬架最优控制策略研究

# 使用说明

## 版本问题
此分支为R2024a版本，低版本请切换分支[MATLAB R2020a](https://github.com/lvwinbor/control_activeSuspension/tree/R2020a)


## 使用方法
1. 将代码下载到文件夹中
```
git clone git@github.com:lvwinbor/control_activeSuspension.git
```
2. 运行main.m文件即可自动运行仿真、存储仿真结果并输出函数图
3. 想要训练神经网络需要单独运行narx_train.m文件
4. 想要进行粒子群算法优化需要单独运行particle_swarm_optimization.m文件

## 文件介绍
- build文件夹：此文件夹中存储着模型运行后产生的缓存文件
- data文件夹：此文件夹中存储着仿真后的数据文件
- model文件夹：此文件夹中为搭建的Simulink模型
- picture文件夹：此文件夹中为输出的矢量图
- src文件夹：此文件夹中为代码文件
