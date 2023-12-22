原文地址：https://www.jianshu.com/p/515cb88fbc75



aac音频格式有：
ADIF (Audio Data Interchage Format)音频数据交换格式，只有一个统一的头，需要得到所有的数据才能解码，适合本地文件
ADTS (Audio Data Transport Stream)音频数据传输流，每一帧都有头信息，任意帧解码，适合传输流



ADTS Frame = adts header+aac es
adts header包含了采样率，声道数，帧长度信息，为7字节或者9字节(有crc时)
adts header = adts_fixed_header+adts_variable_header+crc(optional)

ADTS_Header的可以分为以下三部分：
- adts_fixed_header：每一帧的内容是不变的。
- adts_variable_header：每一帧的内容是存在变化的。
- crc：16bits，protection_absent字段为0时存在。

d6710ce19d1f