-- LuaTools需要PROJECT和VERSION这两个信息
PROJECT = 'helloworld'
VERSION = '1.0.0'

-- 引入必要的库文件(lua编写), 内部库不需要require
local sys = require 'sys'
log.info('main', 'hello world')

print(_VERSION)

--定义所有IO
DISP_array = {11, 13, 14, 15, 16, 17, 18, 19, 43, 20}
--屏幕R/S,ENABLE,DB0-DB7
AEncoder1 = {23, 22, 25, 24}
--BCD编码器1,2,4,8
AEncoder2 = {29, 28, 31, 30}
--BCD编码器1,2,4,8
CG11 = gpio.setup(5, 0, gpio.PULLUP)
CG12 = gpio.setup(6, 0, gpio.PULLUP)
adc.open(3)
LSensor1 = {CG11, CG12, 3}
--传感器CG1,CG2,Analog
adc.open(1)
--电池电压
KEY = gpio.setup(26, nil, gpio.PULLUP)

--测光数据查找表
MOD_table_1 = {1, "A"}
MOD_table_2 = {2, "S"}
MOD_table_3 = {3, "L"}
MOD_table_4 = {4, "I"}
MOD_table = {MOD_table_1, MOD_table_2, MOD_table_3, MOD_table_4}
MOD_table_1 = nil
MOD_table_2 = nil
MOD_table_3 = nil
MOD_table_4 = nil
--模式表

ISO_table_1 = {1,   2.0, " ", " ", "2", "5"}
ISO_table_2 = {2,   1.0, " ", " ", "5", "0"}
ISO_table_3 = {3,   0.5, " ", " ", "7", "5"}
ISO_table_4 = {4,   0.0, " ", "1", "0", "0"}
ISO_table_5 = {5,  -0.5, " ", "1", "5", "0"}
ISO_table_6 = {6,  -1.0, " ", "2", "0", "0"}
ISO_table_7 = {7,  -1.3, " ", "2", "5", "0"}
ISO_table_8 = {8,  -1.6, " ", "3", "2", "0"}
ISO_table_9 = {9,  -2.0, " ", "4", "0", "0"}
ISO_table_10= {10, -2.3, " ", "5", "0", "0"}
ISO_table_11= {11, -2.6, " ", "6", "4", "0"}
ISO_table_12= {12, -3.0, " ", "8", "0", "0"}
ISO_table_13= {13, -3.5, "1", "2", "0", "0"}
ISO_table_14= {14, -4.0, "1", "6", "0", "0"}
ISO_table_15= {15, -5.0, "3", "2", "0", "0"}
ISO_table_16= {16, -6.0, "6", "4", "0", "0"}
ISO_table = {ISO_table_1, ISO_table_2, ISO_table_3, ISO_table_4, ISO_table_5, ISO_table_6, ISO_table_7, ISO_table_8, ISO_table_9, ISO_table_10, ISO_table_11, ISO_table_12, ISO_table_13, ISO_table_14, ISO_table_15, ISO_table_16}
ISO_table_1 = nil
ISO_table_2 = nil
ISO_table_3 = nil
ISO_table_4 = nil
ISO_table_5 = nil
ISO_table_6 = nil
ISO_table_7 = nil
ISO_table_8 = nil
ISO_table_9 = nil
ISO_table_10= nil
ISO_table_11= nil
ISO_table_12= nil
ISO_table_13= nil
ISO_table_14= nil
ISO_table_15= nil
ISO_table_16= nil
--感光度表

APE_table_1 = {1,   0.0, "1", ".", "0"}
APE_table_2 = {2,   0.5, "1", ".", "2"}
APE_table_3 = {3,   1.0, "1", ".", "4"}
APE_table_4 = {4,   1.6, "1", ".", "8"}
APE_table_5 = {5,   2.0, "2", ".", "0"}
APE_table_6 = {6,   3.0, "2", ".", "8"}
APE_table_7 = {7,   3.6, "3", ".", "6"}
APE_table_8 = {8,   4.0, "4", ".", "0"}
APE_table_9 = {9,   5.0, "5", ".", "6"}
APE_table_10= {10,  6.0, "8", " ", " "}
APE_table_11= {11,  7.0, "1", "1", " "}
APE_table_12= {12,  8.0, "1", "6", " "}
APE_table_13= {13,  9.0, "2", "2", " "}
APE_table_14= {14, 10.0, "3", "2", " "}
APE_table_15= {15, 11.0, "4", "5", " "}
APE_table_16= {16, 12.0, "6", "4", " "}
APE_table = {APE_table_1, APE_table_2, APE_table_3, APE_table_4, APE_table_5, APE_table_6, APE_table_7, APE_table_8, APE_table_9, APE_table_10, APE_table_11, APE_table_12, APE_table_13, APE_table_14, APE_table_15, APE_table_16}
APE_table_1 = nil
APE_table_2 = nil
APE_table_3 = nil
APE_table_4 = nil
APE_table_5 = nil
APE_table_6 = nil
APE_table_7 = nil
APE_table_8 = nil
APE_table_9 = nil
APE_table_10= nil
APE_table_11= nil
APE_table_12= nil
APE_table_13= nil
APE_table_14= nil
APE_table_15= nil
APE_table_16= nil
--光圈表

SHT_table_1 = {1,  -3.0, " ", " ", "8", "\""}
SHT_table_2 = {2,  -2.0, " ", " ", "4", "\""}
SHT_table_3 = {3,  -1.0, " ", " ", "2", "\""}
SHT_table_4 = {4,   0.0, " ", " ", "1", "\""}
SHT_table_5 = {5,   1.0, " ", " ", " ", "2"}
SHT_table_6 = {6,   2.0, " ", " ", " ", "4"}
SHT_table_7 = {7,   3.0, " ", " ", " ", "8"}
SHT_table_8 = {8,   4.0, " ", " ", "1", "5"}
SHT_table_9 = {9,   5.0, " ", " ", "3", "0"}
SHT_table_10= {10,  6.0, " ", " ", "6", "0"}
SHT_table_11= {11,  7.0, " ", "1", "2", "5"}
SHT_table_12= {12,  8.0, " ", "2", "5", "0"}
SHT_table_13= {13,  9.0, " ", "5", "0", "0"}
SHT_table_14= {14, 10.0, "1", "0", "0", "0"}
SHT_table_15= {15, 11.0, "2", "0", "0", "0"}
SHT_table_16= {16, 12.0, "4", "0", "0", "0"}
SHT_table = {SHT_table_1, SHT_table_2, SHT_table_3, SHT_table_4, SHT_table_5, SHT_table_6, SHT_table_7, SHT_table_8, SHT_table_9, SHT_table_10, SHT_table_11, SHT_table_12, SHT_table_13, SHT_table_14, SHT_table_15, SHT_table_16}
SHT_table_1 = nil
SHT_table_2 = nil
SHT_table_3 = nil
SHT_table_4 = nil
SHT_table_5 = nil
SHT_table_6 = nil
SHT_table_7 = nil
SHT_table_8 = nil
SHT_table_9 = nil
SHT_table_10= nil
SHT_table_11= nil
SHT_table_12= nil
SHT_table_13= nil
SHT_table_14= nil
SHT_table_15= nil
SHT_table_16= nil
--快门表

COM_table_1 = {1,  -2.3, "-", "2", ".", "3"}
COM_table_2 = {2,  -2.0, "-", "2", ".", "0"}
COM_table_3 = {3,  -1.6, "-", "1", ".", "6"}
COM_table_4 = {4,  -1.3, "-", "1", ".", "3"}
COM_table_5 = {5,  -1.0, "-", "1", ".", "0"}
COM_table_6 = {6,  -0.6, "-", "0", ".", "6"}
COM_table_7 = {7,  -0.3, "-", "0", ".", "3"}
COM_table_8 = {8,   0.0, " ", "0", ".", "0"}
COM_table_9 = {9,   0.3, "+", "0", ".", "3"}
COM_table_10= {10,  0.6, "+", "0", ".", "6"}
COM_table_11= {11,  1.0, "+", "1", ".", "0"}
COM_table_12= {12,  1.3, "+", "1", ".", "3"}
COM_table_13= {13,  1.6, "+", "1", ".", "6"}
COM_table_14= {14,  2.0, "+", "2", ".", "0"}
COM_table_15= {15,  2.3, "+", "2", ".", "3"}
COM_table_16= {16,  2.6, "+", "2", ".", "6"}
COM_table = {COM_table_1, COM_table_2, COM_table_3, COM_table_4, COM_table_5, COM_table_6, COM_table_7, COM_table_8, COM_table_9, COM_table_10, COM_table_11, COM_table_12, COM_table_13, COM_table_14, COM_table_15, COM_table_16}
COM_table_1 = nil
COM_table_2 = nil
COM_table_3 = nil
COM_table_4 = nil
COM_table_5 = nil
COM_table_6 = nil
COM_table_7 = nil
COM_table_8 = nil
COM_table_9 = nil
COM_table_10= nil
COM_table_11= nil
COM_table_12= nil
COM_table_13= nil
COM_table_14= nil
COM_table_15= nil
COM_table_16= nil
--补偿表

LOW_table_1 = {1,   2.3, " ", " ", "2", "1"}
LOW_table_2 = {2,   2.6, " ", " ", "1", "6"}
LOW_table_3 = {3,   3.0, " ", " ", "1", "2"}
LOW_table_4 = {4,   3.3, " ", " ", "1", "0"}
LOW_table_5 = {5,   3.6, " ", " ", " ", "8"}
LOW_table_6 = {6,   4.0, " ", " ", " ", "6"}
LOW_table_7 = {7,   4.3, " ", " ", " ", "5"}
LOW_table_8 = {8,   4.6, " ", " ", " ", "4"}
LOW_table_9 = {9,   5.0, " ", " ", " ", "3"}
LOW_table_10= {10,  5.3, " ", "2", ".", "5"}
LOW_table_11= {11,  5.6, " ", " ", " ", "2"}
LOW_table_12= {12,  6.0, " ", "1", ".", "5"}
LOW_table_13= {13,  6.3, "1", ".", "2", "5"}
LOW_table_14= {14,  6.6, " ", " ", " ", "1"}
LOW_table_15= {15,  7.0, "0", ".", "7", "5"}
LOW_table_16= {16,  8.0, ".", "3", "7", "5"}
LOW_table = {LOW_table_1, LOW_table_2, LOW_table_3, LOW_table_4, LOW_table_5, LOW_table_6, LOW_table_7, LOW_table_8, LOW_table_9, LOW_table_10, LOW_table_11, LOW_table_12, LOW_table_13, LOW_table_14, LOW_table_15, LOW_table_16}
LOW_table_1 = nil
LOW_table_2 = nil
LOW_table_3 = nil
LOW_table_4 = nil
LOW_table_5 = nil
LOW_table_6 = nil
LOW_table_7 = nil
LOW_table_8 = nil
LOW_table_9 = nil
LOW_table_10= nil
LOW_table_11= nil
LOW_table_12= nil
LOW_table_13= nil
LOW_table_14= nil
LOW_table_15= nil
LOW_table_16= nil
--慢门表

SOW_table_1 = {1,   6.0, " ", " ", "6", "0"}
SOW_table_2 = {2,   5.0, " ", " ", "3", "0"}
SOW_table_3 = {3,   4.0, " ", " ", "1", "5"}
SOW_table_4 = {4,   3.0, " ", " ", " ", "8"}
SOW_table_5 = {5,   2.0, " ", " ", " ", "4"}
SOW_table_6 = {6,   1.0, " ", " ", " ", "2"}
SOW_table_7 = {7,   0.0, " ", " ", "1", "\""}
SOW_table_8 = {8,  -1.0, " ", " ", "2", "\""}
SOW_table_9 = {9,  -2.0, " ", " ", "4", "\""}
SOW_table_10= {10, -3.0, " ", " ", "8", "\""}
SOW_table_11= {11, -4.0, " ", "1", "5", "\""}
SOW_table_12= {12, -5.0, " ", "3", "0", "\""}
SOW_table_13= {13, -6.0, " ", " ", "1", "'"}
SOW_table_14= {14, -7.0, " ", " ", "2", "'"}
SOW_table_15= {15, -8.0, " ", " ", "4", "'"}
SOW_table_16= {16, -9.0, " ", " ", "8", "'"}
SOW_table = {SOW_table_1, SOW_table_2, SOW_table_3, SOW_table_4, SOW_table_5, SOW_table_6, SOW_table_7, SOW_table_8, SOW_table_9, SOW_table_10, SOW_table_11, SOW_table_12, SOW_table_13, SOW_table_14, SOW_table_15, SOW_table_16}
SOW_table_1 = nil
SOW_table_2 = nil
SOW_table_3 = nil
SOW_table_4 = nil
SOW_table_5 = nil
SOW_table_6 = nil
SOW_table_7 = nil
SOW_table_8 = nil
SOW_table_9 = nil
SOW_table_10= nil
SOW_table_11= nil
SOW_table_12= nil
SOW_table_13= nil
SOW_table_14= nil
SOW_table_15= nil
SOW_table_16= nil
--慢门表

function DISP_IOinit(DISPIO) 
--初始化IO接口，传出
    DISP_IO = {}
    for i,v in ipairs(DISPIO) do
    --    print(DISPIO[i])
        DISP_IO[i] = gpio.setup(DISPIO[i], 0, gpio.PULLUP)
    end
    DISP_IO[2](0)
    timer.mdelay(1)
    return DISP_IO
end

function DISP_WriteRaw(IO, RS, DATA)
--写入原始数据，IO为IOinit返回值，RS为指令/数据切换
    if (DATA >255)
    then
        DATA = DATA % 255
        print("write err,data too bing")
    end
    --print(DATA)
--取余，限制数据大小
    DIV = 128
    DATA_bi = {}
    for i=1, 8, 1 do
        if(DATA >= DIV)
        then
            DATA_bi[i] = 1
            DATA = DATA - DIV
        else
            DATA_bi[i] = 0
        end
        DIV = DIV/2
        --print(DATA_bi[i])
    end
--转二进制
    if(RS ~= 0)
    then
        DISP_IO[1](1)
    --    print("数据")
    else
        DISP_IO[1](0)
    --    print("指令")
    end
--指令数据模式转换
    DISP_IO[3](DATA_bi[8])
    DISP_IO[4](DATA_bi[7])
    DISP_IO[5](DATA_bi[6])
    DISP_IO[6](DATA_bi[5])
    DISP_IO[7](DATA_bi[4])
    DISP_IO[8](DATA_bi[3])
    DISP_IO[9](DATA_bi[2])
    DISP_IO[10](DATA_bi[1])
    timer.mdelay(5)
    DISP_IO[2](1)
    --print("EN_UP")
    timer.mdelay(1)
    DISP_IO[2](0)
--写数据
end

function DISP_SCREENinit(IOINIT)
--传入初始化结果，初始化屏幕
DISP_WriteRaw(IOINIT, 0, 56) --数据位为8位，显示两行，5x7字符
timer.mdelay(5)
DISP_WriteRaw(IOINIT, 0, 12) --开启显示，不显示光标
timer.mdelay(5)
DISP_WriteRaw(IOINIT, 0, 6) --自动移动光标，不移动屏幕
timer.mdelay(5)
DISP_WriteRaw(IOINIT, 0, 1) --清屏
timer.mdelay(5)
DISP_WriteRaw(IOINIT, 0, 2) --光标归位
timer.mdelay(5)
end

function DISP_ShowChar(IO, RPOS, CPOS, CHAR)
--在指定位置显示指定字符，IO为初始化数组，RPOS为行，CPOS为列，均以零开始，CHAR为显示字符
    DD = 0x80
    if(RPOS == 1)
    then
        DD = DD + 0x40
    end
    DD = DD + CPOS
    DISP_WriteRaw(IO, 0, DD)
--移动光标
    CC = string.byte(CHAR)
    --print(CC)
    DISP_WriteRaw(IO, 1, CC)
--显示内容
    DISP_WriteRaw(IO, 0, 0x80 + 0x1F)
--移出光标
end

function AEncoder_scan(AEIO)
--读取BCD8421编码器数值，传出
    RAEncoder = 0
    E1 = gpio.setup(AEIO[1], nil, gpio.PULLUP)
    E2 = gpio.setup(AEIO[2], nil, gpio.PULLUP)
    E3 = gpio.setup(AEIO[3], nil, gpio.PULLUP)
    E4 = gpio.setup(AEIO[4], nil, gpio.PULLUP)
    RAEncoder1 = E1()
    RAEncoder2 = E2()
    RAEncoder3 = E3()
    RAEncoder4 = E4()
--上拉读取数据
    if (RAEncoder1 == 0 )
    then
        RAEncoder = RAEncoder + 1
    end
    if (RAEncoder2 == 0 )
    then
        RAEncoder = RAEncoder + 2
    end
    if (RAEncoder3 == 0 )
    then
        RAEncoder = RAEncoder + 4
    end
    if (RAEncoder4 == 0 )
    then
        RAEncoder = RAEncoder + 8
    end
--BCD码累加
    gpio.close(AEIO[1])
    gpio.close(AEIO[2])
    gpio.close(AEIO[3])
    gpio.close(AEIO[4])
--IO口恢复高阻态
    return RAEncoder
end

function LightSenser_read(LIO)
--传入传感器IO，返回以Lux为单位的照度
    LIO[1](0)
    LIO[2](1)
    alpha = 0.057
    timer.mdelay(1)
    LR, LV = adc.read(LIO[3])
    if (LV <100)
    then
        LIO[1](1)
        LIO[2](0)
        timer.mdelay(1)
        LR, LV = adc.read(LIO[3])
        alpha = 0.57
    end
    if (LV >2000)
    then
        LIO[1](1)
        timer.mdelay(1)
        LR, LV = adc.read(LIO[3])
        alpha = 0.0057
    end
    lux = (LV/1000)/(alpha*0.00422)
    return lux
end

--调用开始

SK = 2.5
--传感器校正参数
LK = 1.2
--线性校正参数
MOD = 1
--模式计数
ISO = 4
--ISO计数
COM = AEncoder_scan(AEncoder1)
--曝光补偿
PAR = AEncoder_scan(AEncoder2)
--参数选择

D1602 = DISP_IOinit(DISP_array)
DISP_SCREENinit(D1602)
DISP_ShowChar(D1602, 0, 0, "B")
DISP_ShowChar(D1602, 0, 1, "A")
DISP_ShowChar(D1602, 0, 2, "T")
DISP_ShowChar(D1602, 0, 4, ".")
DISP_ShowChar(D1602, 0, 9, "I")
DISP_ShowChar(D1602, 0, 10, "S")
DISP_ShowChar(D1602, 0, 11, "O")
DISP_ShowChar(D1602, 1, 7, "F")
--初始化屏幕

EV_ISO = ISO_table[ISO][2]
DISP_ShowChar(D1602, 0, 12, ISO_table[ISO][3])
DISP_ShowChar(D1602, 0, 13, ISO_table[ISO][4])
DISP_ShowChar(D1602, 0, 14, ISO_table[ISO][5])
DISP_ShowChar(D1602, 0, 15, ISO_table[ISO][6])
--ISO调用默认值（100）

while 1 do

    AE1 = AEncoder_scan(AEncoder1) + 1
    AE2 = AEncoder_scan(AEncoder2) + 1
    --读取编码器位置
    SWRead = KEY()
    if (SWRead == 0 and SWReadBF ~= SWRead)
    then
        timer.mdelay(5)
        SWRead = KEY()
        if (SWRead == 0)
        then
            MOD = MOD + 1
        end
        if (MOD >4)
        then
            MOD = 1
        end
        if(MOD == 3)
        then
            LOW_ISO = LOW_table[ISO][2]
            DISP_ShowChar(D1602, 0, 12, LOW_table[ISO][3])
            DISP_ShowChar(D1602, 0, 13, LOW_table[ISO][4])
            DISP_ShowChar(D1602, 0, 14, LOW_table[ISO][5])
            DISP_ShowChar(D1602, 0, 15, LOW_table[ISO][6])
        end
        if(MOD <3)
        then
            EV_ISO = ISO_table[ISO][2]
            DISP_ShowChar(D1602, 0, 12, ISO_table[ISO][3])
            DISP_ShowChar(D1602, 0, 13, ISO_table[ISO][4])
            DISP_ShowChar(D1602, 0, 14, ISO_table[ISO][5])
            DISP_ShowChar(D1602, 0, 15, ISO_table[ISO][6])
        end
    end
    SWReadBF = SWRead
    --检查按钮，切换模式

    print("lux")
    LUXBK = 0
    for i=1, 10, 1 do
        LUXBK = LUXBK + (LightSenser_read(LSensor1)/10)
        timer.mdelay(1)
    end
    LUXAK = LUXBK/SK
    EVT = (math.log(LUXAK) / math.log(2)) + LK
    print("EVT")
    print(EVT)
    --计算曝光度EV

    print("BATT")
    BR, BV = adc.read(1)
    BAT = (BV * 2)/1000
    BAI = tostring(math.floor(BAT))
    BAF = tostring(math.floor((BAT % 1)*10))
    DISP_ShowChar(D1602, 0, 3, BAI)
    DISP_ShowChar(D1602, 0, 5, BAF)
    --显示电池电压

    if (MOD ~=4)
    then
    EV_COM = COM_table[AE1][2]
    DISP_ShowChar(D1602, 1, 12, COM_table[AE1][3])
    DISP_ShowChar(D1602, 1, 13, COM_table[AE1][4])
    DISP_ShowChar(D1602, 1, 14, COM_table[AE1][5])
    DISP_ShowChar(D1602, 1, 15, COM_table[AE1][6])
    end
    --读取曝光补偿

    if (MOD == 1)
    --光圈优先模式
    then
        EV_A_FA = APE_table[AE2][2]
        EV_A_SHT = EVT - (EV_ISO + EV_COM + EV_A_FA)
        print("A MOD SHT EV")
        print(EV_A_SHT)
        --计算快门所需EV值
        SHT_CH = {}
        for i=1, 16, 1 do
            SHT_CH[i] = math.abs(EV_A_SHT - SHT_table[i][2])
        end
        --计算误差
        SHT_USE = 1
        SHT_ABS_ERR = SHT_CH[1]
        for i=2, 16, 1 do
            if(SHT_CH[i] < SHT_ABS_ERR)
            then
                SHT_USE = i
                SHT_ABS_ERR = SHT_CH[i]
            end
        end
        print(SHT_USE)
        SHT_ERR = EV_A_SHT - SHT_table[SHT_USE][2]
        --寻找匹配值
        if (math.abs(SHT_ERR) > 1)
        then
            DISP_ShowChar(D1602, 0, 7, "E")
        end
        if (SHT_ERR >0.3 and SHT_ERR <= 1.0)
        then
            DISP_ShowChar(D1602, 0, 7, "+")
        end
        if (SHT_ERR <-0.3 and SHT_ERR >= -1.0)
        then
            DISP_ShowChar(D1602, 0, 7, "-")
        end
        if (math.abs(SHT_ERR) <=0.3)
        then
            DISP_ShowChar(D1602, 0, 7, "=")
        end
        --误差提示
        DISP_ShowChar(D1602, 1, 0, MOD_table[1][2])
        DISP_ShowChar(D1602, 1, 8, APE_table[AE2][3])
        DISP_ShowChar(D1602, 1, 9, APE_table[AE2][4])
        DISP_ShowChar(D1602, 1,10, APE_table[AE2][5])

        DISP_ShowChar(D1602, 1,2, SHT_table[SHT_USE][3])
        DISP_ShowChar(D1602, 1,3, SHT_table[SHT_USE][4])
        DISP_ShowChar(D1602, 1,4, SHT_table[SHT_USE][5])
        DISP_ShowChar(D1602, 1,5, SHT_table[SHT_USE][6])
    end

    if (MOD == 2)
    --快门优先模式
    then
        EV_S_FS = SHT_table[AE2][2]
        EV_S_APE = EVT - (EV_ISO + EV_COM + EV_S_FS)
        print("S MOD APE EV")
        print(EV_A_SHT)
        --计算光圈所需EV值
        APE_CH = {}
        for i=1, 16, 1 do
            APE_CH[i] = math.abs(EV_S_APE - APE_table[i][2])
        end
        --计算误差
        APE_USE = 1
        APE_ABS_ERR = APE_CH[1]
        for i=2, 16, 1 do
            if(APE_CH[i] < APE_ABS_ERR)
            then
                APE_USE = i
                APE_ABS_ERR = APE_CH[i]
            end
        end
        print(APE_USE)
        APE_ERR = EV_S_APE - APE_table[APE_USE][2]
        --寻找匹配值
        if (math.abs(APE_ERR) > 1)
        then
            DISP_ShowChar(D1602, 0, 7, "E")
        end
        if (APE_ERR >0.3 and APE_ERR <= 1.0)
        then
            DISP_ShowChar(D1602, 0, 7, "+")
        end
        if (APE_ERR <-0.3 and APE_ERR >= -1.0)
        then
            DISP_ShowChar(D1602, 0, 7, "-")
        end
        if (math.abs(APE_ERR) <=0.3)
        then
            DISP_ShowChar(D1602, 0, 7, "=")
        end
        --误差提示
        DISP_ShowChar(D1602, 1, 0, MOD_table[2][2])
        DISP_ShowChar(D1602, 1, 8, APE_table[APE_USE][3])
        DISP_ShowChar(D1602, 1, 9, APE_table[APE_USE][4])
        DISP_ShowChar(D1602, 1,10, APE_table[APE_USE][5])

        DISP_ShowChar(D1602, 1,2, SHT_table[AE2][3])
        DISP_ShowChar(D1602, 1,3, SHT_table[AE2][4])
        DISP_ShowChar(D1602, 1,4, SHT_table[AE2][5])
        DISP_ShowChar(D1602, 1,5, SHT_table[AE2][6])
    end

    if (MOD == 3)
    --低感度模式
    then
        EV_L_FA = APE_table[AE2][2]
        EV_L_SHT = EVT - (LOW_ISO + EV_COM + EV_L_FA)
        print("L MOD SHT EV")
        print(EV_L_SHT)
        --计算快门所需EV值
        L_SHT_CH = {}
        for i=1, 16, 1 do
            L_SHT_CH[i] = math.abs(EV_L_SHT - SOW_table[i][2])
        end
        --计算误差
        L_SHT_USE = 1
        L_SHT_ABS_ERR = L_SHT_CH[1]
        for i=2, 16, 1 do
            if(L_SHT_CH[i] < L_SHT_ABS_ERR)
            then
                L_SHT_USE = i
                L_SHT_ABS_ERR = L_SHT_CH[i]
            end
        end
        print(L_SHT_USE)
        L_SHT_ERR = EV_L_SHT - SOW_table[L_SHT_USE][2]
        --寻找匹配值
        if (math.abs(L_SHT_ERR) > 1)
        then
            DISP_ShowChar(D1602, 0, 7, "E")
        end
        if (L_SHT_ERR >0.3 and L_SHT_ERR <= 1.0)
        then
            DISP_ShowChar(D1602, 0, 7, "+")
        end
        if (L_SHT_ERR <-0.3 and L_SHT_ERR >= -1.0)
        then
            DISP_ShowChar(D1602, 0, 7, "-")
        end
        if (math.abs(L_SHT_ERR) <=0.3)
        then
            DISP_ShowChar(D1602, 0, 7, "=")
        end
        --误差提示
        DISP_ShowChar(D1602, 1, 0, MOD_table[3][2])
        DISP_ShowChar(D1602, 1, 8, APE_table[AE2][3])
        DISP_ShowChar(D1602, 1, 9, APE_table[AE2][4])
        DISP_ShowChar(D1602, 1,10, APE_table[AE2][5])

        DISP_ShowChar(D1602, 1,2, SOW_table[L_SHT_USE][3])
        DISP_ShowChar(D1602, 1,3, SOW_table[L_SHT_USE][4])
        DISP_ShowChar(D1602, 1,4, SOW_table[L_SHT_USE][5])
        DISP_ShowChar(D1602, 1,5, SOW_table[L_SHT_USE][6])
    end

    if (MOD == 4) 
    --设置ISO
    then
        DISP_ShowChar(D1602, 1, 0, MOD_table[4][2])
        ISO = AE2
        DISP_ShowChar(D1602, 0, 12, ISO_table[ISO][3])
        DISP_ShowChar(D1602, 0, 13, ISO_table[ISO][4])
        DISP_ShowChar(D1602, 0, 14, ISO_table[ISO][5])
        DISP_ShowChar(D1602, 0, 15, ISO_table[ISO][6])
        DISP_ShowChar(D1602, 1, 12, LOW_table[ISO][3])
        DISP_ShowChar(D1602, 1, 13, LOW_table[ISO][4])
        DISP_ShowChar(D1602, 1, 14, LOW_table[ISO][5])
        DISP_ShowChar(D1602, 1, 15, LOW_table[ISO][6])
    end

    timer.mdelay(100)
end

-- 用户代码已结束---------------------------------------------
-- 结尾总是这一句
sys.run()
-- sys.run()之后后面不要加任何语句!!!!!