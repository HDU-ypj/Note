Q:rtp帧格式
A:
version:rtp协议版本，目前版本为2，2bit
p(panding):包末尾是否含有padding bytes，机密算法可能会用到
x(extension):标识是否有头部扩展，可以用于存储信息，比如视频旋转角度
CC(csrc count):csrc的数量，且最多只能有15个csrc
M(marker):程序自己定义的行为
PT(payload type):payload的数据类型，音视频的默认映射格式参见rfc3551
sequence number:递增序列号
timestamp：时间戳，接收方根据其来回放音视频，时间戳的间隔由传输的数据结构类型确定
ssrc:同步源标识符，相同rtp会话中ssrc是唯一的，需要保持随机
csrc:mcu混流时使用，标识混流出的新的音视频流的ssrc是由哪些源ssrc贡献的，最多混15路音视频流
extension header:头部扩展

Q:DTMF信号(Dual Tone Multi-Frequency)双音多频
A:
当用户在电话键盘上按下数字键或符号键时，电话系统会产生两个不同频率的声音信号，这两个频率的信号叠加在一起，形成一个独特的双音多频信号，然后通过电话线路传输给接收方。接收方的电话系统会识别这个双音多频信号，然后执行相应的操作，比如拨打电话、查询语音信箱等。
简单的讲，就是按下数字键或者符号键的信号，这个技术就是用来识别电话键盘上数字、符号和字母等按键信息的技术。

Q:NetEq是网络延迟估计器
A:
NetEq技术的主要作用是抵消网络延迟和波动对音频传输造成的影响，使音频数据在接收端能够按照正确的顺序和时间播放出来。NetEq技术通过自适应抖动缓冲的方式，可以动态地调整音频数据的延迟和抖动，以适应网络状况的变化。
提供一定的抗抖动，抗丢包能力

Q:某一个音频协议的编码码率
A:
音频编码码率可以简单计算得出：码率=采样率(khz) * 采样位深(16bit) * 通道数量
码率越高，代表着携带的信息越多，同时消耗的网络带宽也越多，码率越低，代表压缩率可能比较高，携带的有效信息可能较少，可能会造成音视频卡顿，失真等现象，但是再弱网情况下，有时不得不降低输出码率来适应网络需求。

Q:source /opt/rh/devtoolset-8/enable
A:
这个是在linux上编译代码时首先需要运行加载的资源，它包含了一组更新的编译器、调试器和其他开发工具，用于编译和构建C/C++等程序

Q:服务器传输到另一台服务器上
A:
scp filename root@10.4.11.161:
然后输入密码

Q:Linux返回上一次操作目录
A:cd -


Q:为什么会出现-c++17支持不了的情况
A:
source /opt/rh/devtoolset-8/enable

Q:直接克隆指定远程分支
A:
git clone -b branch_name --recursive http://git

Q:shell中的:=什么意思
A:
变量为空或者没有经过赋值，则对其进行赋值，否则就不进行赋值

Q:shell中的?=什么意思
A:
变量没定义，则定义并赋值

Q:coredump文件存放路径
A:
cat /proc/sys/kernel/core_pattern

Q:远程docker
A:
Dev Containers 插件

tips：centos上data命令可以查看当前时间
tips：gdb可以使用where查看调用栈

Q:git 查看track情况
A:
git branch -vv

Q:git 更新子模块
A:
git submodule update --remote <submodule-name>

Q:g++ -w不生成任何警告信息
A:


Q:
A:


Q:
A:


Q:
A:


Q:
A:

tips：async表示异步，sync表示同步

tips：3840 * 2160 4k分辨率

deinit析构器

ITranscoderSdkInterface 里面有创建转码器的接口，接口类型为ITranscoderInterface
ITranscoderInterface
TranscoderParam	解码参数，在解码开始时(start函数)会传入
TranscoderChannelParam 解码通道参数，在解码开始时(start函数)会将多个通道打包成vector传入
接口如下：
```virtual TRANSCODER_STATUS Start(const TranscoderParam& param, const std::vector<TranscoderChannelParam>& channelParams, ITranscoderEventCallback* eventCallback) = 0;
```
ComTimerWrapperSink定时器发生器接口，只有一个ontimer的接口
ITranscoderEventCallback 转码事件回调接口，里面有一堆相当于槽函数的东西

Transcoder继承了转码接口和通道参数接口ITranscoderInterface，IChannelParamGether
将所有的通道的信息存入，然后根据通道查找对应参数IChannelParamGether
affinity 密切关系
Resolution分辨率




10.4.12.162/root/Admin123@pl这个环境 国产化gpu平台



硬件库ma-hw -> umpl -> 转码->sdk



umpl模块:
IUmplEncodedDataSink数据编码输出，只有一个可重写的OnDataEncoded
IUmplEncoder：编码器

i420感觉就是yuv420p，yyyyuuvv
yv12 yyyyvvuu
nv12 yyyyuuvv
nv21 yyyyvvuu

1、拉取support_arm分支代码到Linux上，编译得到so文件
2、将这个so文件替换到vendors/umpl/lib/arm64-linux下的so文件
3、更改ma-hw amd64 release2.0.5
4、


已经替换了硬件库
然后替换arm64的umpl.so动态库
替换umpl接口


1、下载更新ma-hw release2.0.5，替换vendors/ma-hw
2、在10.4.12.162的docker-gcc中编译umpl的support_arm分支代码，将生成的.so文件替换到vendors/umpl/lib/arm64-linux下
3、更换umpl/interface/下的umpl文件夹和umpl.h接口
4、在10.4.12.162上make出现链接错误


如何控制走硬件转码还是走软件
我更改了之后
现在国产化上面的平台还没有编译成功
docker中编译成功
本地已经修改配置
  



```
1、download_hw.sh release 2.0.5 更新硬件库
2、download_umpl.sh develop-13.0.1.3 更新软件库
3、转码端修改video_mixer.cpp
4、编译转码库
5、cpresource.sh将所有的动态库依赖复制到新的release_gather_dir文件夹
6、修改demo.cpp ,添加tparam._performance_mode=TRANSCODERSDK_PERFORM_HARDWARE; 强制走硬件
7、修改demo的Makefile，链接参数修改如下：
		LINK_OPTION  =  -lpthread \
                -Wl,-rpath=$(G_ROOT)/release_gather_dir/ \
                -L$(G_ROOT)/system_wrappers/build/lib/aarch64-kylin/ -lsystem_wrappers \
                -L$(G_ROOT)/app/ -ltranscoder
8、编译demo.cpp
9、./launch.sh
```
