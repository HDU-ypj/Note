用来写笔记的

- http协议最佳实践:RESTful设计风格，官网：https://restfulapi.cn/

Syntax：语法

HTTP 的 URL 是由 http:// 起始与默认使用端口 **80**，而 HTTPS 的 URL 则是由 https:// 起始与默认使用端口**443**。

SSL（Secure Sockets Layer）

TLS（Transport Layer Security）

客户端发送一个HTTP请求到服务器的请求消息包括以下格式：请求行（request line）、请求头部（header）、空行和请求数据四个部分组成

HTTP响应也由四个部分组成，分别是：状态行、消息报头、空行和响应正文。

CRLF回车换行

字符串前面加上R可以防止转义

thumbnail 缩略图

extract 提取，解压

render 提供，给予，提交

Triples 三元组

Cipher 密码

Integrity 完整性

mfreader 文件读取，录制解码的协议

upper_mixer 混音混屏

transcoder 转码

IVVR是Interactive Voice and Video Response的缩写，即交互式语音和视频响应

1080p 1920*1080planer模式

720p 1280*720

I420  planar排列方式： y1y2y3…ysu1u2u3…unv1v2v3…vn

首先，在发布版本的时候会给管理版本信息的服务器发送更新，

ruby

SRTP传输安全机制

https://docs.gitlab.cn/jh/ci/yaml/gitlab_ci_yaml.html#gitlab-ciyml-%E6%96%87%E4%BB%B6

restful

[API 请求 – RESTful API 一种流行的 API 设计风格](https://restfulapi.cn/restful-api-request)

在qt安装自定义后需要将安装目录加入path，同时，vs安装目录下有可以安装离线拓展的，叫什么installer忘了

![](D:\Users\yl5342\AppData\Roaming\marktext\images\2023-09-18-19-56-39-image.png)

Confidentiality 保密性

authentication 认证

successive 随后的

sufficient足够

# DTLS 协议

kdf是用于导出session key的函数，默认使用的时加解密函数，AES128_CM为kdf一种

环境准备

1、beyondcompare 4用来比较代码，解决冲突合并

2、gitlab 类似于github的仓库管理工具

3、服务器10.4.11.111 硬件 10.4.10.161软端

4、windterm终端工具

asan c++动态内存错误检测器

wThAgU+0bzU1zT+JoWmku8AjpEgcSB+LqO1tksBaNcO8Z2hhU40OxbV2Y0C0OA==

50402

按照srtp_unprotect里面的逻辑，它先查找之前有没有对应ssrc的流，没有的话以自身创建模板，（更改roc值），然后进行验证，验证后进行解密，解密成功后将流加入到列表中

如果要给外部提供接口的话，就要得到相对ssrc的流的结构体，如果是第一次，这个结构体是需要按照模板生成的，而且必须要进行验证，解密等一系列步骤才能把这个结构体加入到列表，因此要实现提供接口不好实现

9-26导出

JIE/KhJuTDvAgnCNg/yjE2CjS8eByG8ip8vNt7was0G50KlkUIu+JjDHiaR7sA==

50412

![](D:\Users\yl5342\AppData\Roaming\marktext\images\2023-09-27-14-25-27-image.png)

![](D:\Users\yl5342\AppData\Roaming\marktext\images\2023-09-27-14-25-46-image.png)

cppcheck工具，可以检查代码

gitlab_ci有时间一定学一下，遇到好多次了，shell脚本

BGRA 颜色编码格式

采样率 khz，每秒采样的次数

frametime

声道数

Accelerate 加速

interval间隔

extract提取

blend混合

cumulative累积的

render提供

IVVR是Interactive Voice and Video Response的缩写，交互式语音视频

invalid

Aggregation聚合

Thumbnail缩略图

corresponding相应的

banner横幅

adaptive:适应的

boot启动
resume重新开始




MSB LSB：起始地址为最高位， 最后地址为最低位。



source媒体的产生者，sink媒体接收器，**source**是**生产**媒体资源的，**sink**负责**消费**

封装格式有 MP4、MKV、AVI、TS 等。

CD 标准的量化精度是 16bit，DVD 标准的量化精度是 24bit。也可理解为一个采样点用多少 bit 表示

常见的有单声道、立体声道、4 声道、5.1 声道、7.1 声道等。

AC3：有损音频编码格式，被广泛应用于 5.1 声道（Dolby AC3 提供的环绕声系统由 5 个全频域声道和 1 个超低音声道组成）。

uml:

子类指向父类，实线空心填充三角形箭头，继承关系

实现指向接口，虚线空心填充三角形箭头，实现关系

A用到了B，则A指向B，实线无填充普通箭头 —>，在A类中需要传入B类作为参数依赖，关联关系

整体和局部的关系，A包含了B，B指向A，尾部为空心菱形的实线箭头（也可以没箭头），聚合关系

组合关系，总体由分部组合而成，总体指向局部，总体那儿黑色一坨

文件打开处理方式：

```c++
#include <codecvt>
#ifdef WIN32
    std::wstring_convert<std::codecvt_utf8<wchar_t>> converter;
    std::wstring filename_w = converter.from_bytes(src_filename);
    auto fp = std::unique_ptr<FILE, decltype(&fclose)>(_wfopen(filename_w.c_str(), L"rb"), &fclose);
#else
    auto fp = std::unique_ptr<FILE, decltype(&fclose)>(fopen(src_filename.c_str(), "rb"), &fclose);
#endif
    if (!fp)
    {
        ERROR_TRACE_THIS(IMG_LOG << "open " << src_filename << " failed!");
        return -1;
    }
```

使用智能指针巧妙地赋值删除器，然后就不用管异常后的return了,包含头文件codecvt





Q：什么是量化参数qp

A：在对图像进行帧间压缩和帧内压缩时，需要进行离散余弦变换，然后对变换系数进行量化，解码时需要反量化反IDCT变换， 量化参数QP时量化步长的序号，值越大，那么量化损失越大，图像越模糊，码率越小，反之。实际上现有的码率控制算法主要是通过调整离散余弦变换的量化参数大小输出目标码率

因此通过解码统计出宏块的平均 QP 值 Avg QP 可以作为衡量量化噪声、 伪影强度的直接指标。



Q:H264码率控制模式

A:H264码率控制模式分别有：CBR、VBR、AVBR三种经典的模式

[嵌入式音视频开发过程中如何控制码率？-腾讯云开发者社区-腾讯云](https://cloud.tencent.com/developer/article/2320133)

CBR（const bit rate）指的是固定编码控制模式：它指的是以恒定编码比特率进行压缩操作，当有运动时刻发生的时候，由于码率保持着恒定变化。所以，大部分情况下只能通过增大QP数值来调节画面质量，而当运动画面变多时图像质量变差。当场景从运动画面切换到静止画面的时候，图像质量变差。所以这种算法是优先考虑节省码率(带宽)，而牺牲画面质量。

VBR（Variable Bit Rate）控制模式：

VBR指的是动态编码控制模式，它的最大特点是码率的变化是随着画面质量的变化而变化。比方说在运动的时刻码率会变高，从而马赛克和花屏的现象会减少。这种码率控制模式的最大优点就是以画面质量为最优先考虑，在处理一些复杂画面的时候，会大幅度提高码率解决画质问题。但是其缺点也很明显，就是它的码率不能以恒定的值进行处理，所以会大幅度消耗码率。

VBR调节一般由四个编码参数决定：

- maxbitrate
- minqp
- maxqp
- changepos

AVBR指的是可变码率控制。这种码率控制模式的特点是，它会自动检测当前编码的图像是静止画面还是运动画面。若是运动画面，AVBR模式会提高码率去大大改善当前的画面质量，而当检测到静止画面的时候。AVBR会主动降低码率来节省带宽。这种模式的最大特点是，它会根据最大码率和最小码率之间进行调整。所以AVBR综合了CBR和VBR的优势，在运动模式下能够提高码率来保证画面质量的平稳，而在静止画面下会保带宽。在AVBR模式下有三个参数来表示码率的变化，分别是：

- maxbitrate
- changepos
- minstillpercent。

在运动场景下，最大码率就等于maxbitrate，而在静止模式下最小码率就等于maxbitrate * changepos * minstillpercent



Q：帧速度

A：FPS，frame per second，每秒刷新图片次数，帧率，一般为25或者30帧，影响FPS值的主要因素就是显卡，一款好的独立显卡会对FPS的提升有着很大的作用。



Q:码流

A:码流(Data Rate)是指视频文件在单位时间内使用的数据流量，也叫码率或码流率，通俗一点的理解就是取样率,是视频编码中画面质量控制中最重要的部分，一般我们用的单位是kb/s或者Mb/s



Q:采样位深

A:我们常见的16Bit（16比特），可以记录大概96分贝的动态范围。那么，您可以大概知道，每一个比特大约可以记录6分贝的声音。同理，20Bit可记录的动态范围大概就是120dB；24Bit就大概是144dB。假如，我们定义0dB为峰值，那么声音振幅以向下延伸计算，那么，CD音频可的动态范围就是“-96dB～0dB。”，依次类推，24Bit的HD-Audio高清音频的的动态范围就是“-144dB~0dB。”。由此可见，位深度较高时，有更大的动态范围可利用，可以记录更低电平的细节。



Q：采样率（HZ）音频

A：采样率是指将模拟信号转换成数字信号时的采样频率，也就是单位时间内采样多少点

我们人耳能听到的声音一般在20Hz~20KHz之间，根据奈奎斯特采样定理，采样频率fs大于信号中最高频率fmax的2倍时，采样之后的数字信号便能完整的反应真实信号。所以44.1KHz为常见的采样率（音频CD，MP3，VCD）。



Q：rtcp相关

A：rtcp中主要由sr，rr，sdes，bye，app等报文，sr或rr是每一个包所必须含有的，SR并不是发送者发送多少包告诉对方，而是sender这端接收了多少包，接收过程中丢了多少包。将这些信息传送给对端，所以SR包含两个信息，将sender自己发送的信息告诉对端，同时将自己接收的信息也告诉对端。而RR是当报文发送方只作为接收者，而不发送媒体数据时，发给对端自己作为接收方接收到的数据的统计信息

如果一个会话参加者自最后一次发送 RTCP报文后，发送了新的 RTP 数据报文，那么该参加者需要传送 SR 报文, 否则传送 RR 报文



Q：I420

A：即YUV420p，先存放Y, 再存放U，再存放V

Y1,Y2,Y3,Y4,Y5,Y6,U1,U2,U3,V1,V2,V3

**YUV420sp（即YV12）**：先存放Y， 然后UV交错存放



Q：cairo图形库

A：用来构建图形界面，开源

tips:好用的截屏软件snipaste

Q:inband_fec_count,前向纠错（Forward Error Correction，FEC）
A:音频或视频编码器中使用的一种纠错技术,每隔多少个数据包就会插入一个FEC包，以提高数据的可靠性和抗丢包能力。inband_fec_count的命名中，inband表示“带内”的意思，表示这种FEC技术是在数据流中直接插入FEC包，而不是通过另外的信道传输FEC包；fec表示“前向纠错”的意思，表示这种技术是通过在数据流中插入冗余数据来实现错误纠正；count表示“计数”的意思，表示这个变量是用来记录插入FEC包的计数器。



tip:OSI 模型中定义中，会话层负责两端的会话维持、身份鉴别等，表示层负责对数据的加解密

Q:shell脚本中$?什么含义
A:
$? 显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。
$* 引用所有传入到脚本的参数
$@ 引入所有传入到脚本的参数
区别在于双引号中时，"$*" 标识只有一个参数"1 2 3","$@" 标识有多个参数"1" "2" "3"

普通数组：
array_name=(value1 value2 ... valuen)
关联数组（相当于map）
declare -A array_name //声明了一个关联数组
array_name["google"] = "www.google.com"
array_name["baidu"] = "www.baidu.com"
访问时直接${array_name["google"]}

使用 @ 或 * 可以获取数组中的所有元素
echo "数组的元素为: ${array_name[ * ]}"
在数组前加一个感叹号 ! 可以获取数组的所有键
echo "数组的元素为: ${!array_name[ * ]}"

获取数组长度的方法和获取字符串长度的方法相同
${#array_name[ * ]}

运算符之间要有空格，赋值运算时不能有空格
val=`expr $a + $b`

代码中的 [] 执行基本的算数运算，
if test $[num1] -eq $[num2]
then
    echo '两个数相等！'
else
    echo '两个数不相等！'
fi

result = $[a+b]
重定向，将标准错误和标准输出合并后写入file
$ command > file 2>&1
$ command > /dev/null 2>&1    //不会输出信息

文件包含只需要 . filename
或者 source filename


diff a.text b.text -y -w 50
ls -lha

netstat
top 查看进程情况


画面黑屏：I帧没有正常读取，所以后续的帧没有正常解码
音频和视频的编码器都是aaclc格式正常吗？
为什么每次vpts增加3000



demo设置通道参数，调用转码Start(),转码调用StartTranscode(),转码调用StartTranscoderImpl(),workTranscode(),进入死循环，处理一次数据OnHeartbeat(),ProcessYealinkRecordFile(),从中间文件读取数据后将数据放入jitterbuffer


mp4v2开源库，可以将h264和aac混成mp4
二进制查看工具 HXD
h264码流查看工具：Elecard Streameye
git管理：git，小乌龟
远程工具:vs的remote ssh，winterm
vs
记笔记：sublime text
打包依赖文件：dependencies
虚拟摄像头：e2eSoft VCam
思维导图：xmind
编译工具：cmake
代码对比工具：beyond compare

<locale>头文件的facet进行字符编码转换。

grep -E "a|b"//可以支持匹配多个

NV12 在硬件系统中用的比较多 YYYYUVUV
YV12（又叫I420）图像处理用的比较多，YYYYUUVV

chatgpt free:
https://chatbb.free2gpt.xyz/

常见视频编码格式
无版权编码格式：
VP8
VP9
AV1

有版权编码格式：
H.262
H.264
H.265

常见音频编码格式:
MP3
AAC



编码器是实现某种编码格式的库文件。只有安装了某种格式的编码器，才能实现该格式视频/音频的编码和解码。
以下是一些 FFmpeg 内置的视频编码器

libx264：最流行的开源 H.264 编码器
NVENC：基于 NVIDIA GPU 的 H.264 编码器
libx265：开源的 HEVC 编码器
libvpx：谷歌的 VP8 和 VP9 编码器
libaom：AV1 编码器

音频编码器：
libfdk-aac
aac

ffmpeg {1} {2} -i {3} {4} {5}

1、全局参数
2、输入文件参数
3、输入文件
4、输出文件参数
5、输出文件


话机，avc

单个大括号标识一个作用域，就算没有if或者while这些，它也算是一个作用域

