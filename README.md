此项目是七自由度电磁线控悬架的仿真模型
# 文件说明

## 版本问题
我使用的MATLAB版本为2024a，保存的模型也为此版本。考虑到版本兼容问题，我将2020a版本的模型另存为old_model文件夹中。若是版本低于2024a，可以把model文件夹删掉，并将old_model重命名为model

## 使用方法
1. 运行main.m文件即可自动运行仿真、存储仿真结果并输出函数图
2. 想要训练神经网络需要单独运行narx_train.m文件
3. 想要进行粒子群算法优化需要单独运行particle_swarm_optimization.m文件

## build文件夹
此文件夹中存储着模型运行后产生的缓存文件

## data文件夹
此文件夹中存储着仿真后的数据文件

## model文件夹
此文件夹中为搭建的Simulink模型

## old_model文件夹
此文件夹中为2020a版本的Simulink模型

## picture文件夹
此文件夹中为输出的矢量图

## src文件夹
此文件夹中为代码文件
