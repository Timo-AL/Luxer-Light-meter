# Lux-Light-meter
A light meter designed for taking photo（用于摄影的测光表）

## 如何制作

LMG2MB_gerber文件夹里面的zip去找板厂下单，建议嘉立创哑光黑阻焊，减少反光影响

LMG2MV_BOM.xlsx 对照采购原件，尤其注意type-c封装

安装luattool v2，下载库中的LuatOS-SoC_V0007_AIR103.soc和main.lua

## 如何使用
![avatar](https://github.com/Timo-AL/Luxer-Light-meter/raw/master/picture/F.jpg)

B1 电源开关

B2 模式选择，长按在A（光圈优先），S（快门优先），L（低感光度光圈优先），I（感光度设置）模式之间切换

R1 曝光补偿旋钮

R2 参数旋钮

D1 电池电压，低于3.4时需要充电

D2 曝光误差，误差大于0.3EV时显示+，小于-0.3EV显示减号，大于±1EV显示E，小于±0.3EV显示=

D3 ISO值

D4 工作模式

D4 快门速度，速度低于1S会以“秒数"”格式显示

D6 光圈

D7 曝光补偿，设置感光度时该位置显示低感值


## 下载固件

![avatar](https://github.com/Timo-AL/Luxer-Light-meter/raw/master/picture/B.jpg)

按如图所示线序与CH340串口模块连接，TX和RX需要交叉，不连接VCC

![avatar](https://github.com/Timo-AL/Luxer-Light-meter/raw/master/picture/D.png)

按如图所示方法下载固件，开始下载后打开打开测光表电源
