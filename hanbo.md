cmake_minimum_required(VERSION 3.2)

set(PRJ_NAME "test")
project(${PRJ_NAME})

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/build/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/build/bin)

# compile flags
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -DNDEBUG -O2")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -DDEBUG -g")

list(APPEND INCLUDE_DIRS
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/json
    # ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/opencv4.5.4/include/opencv4
    # ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/freetype2/include
    ${CMAKE_CURRENT_SOURCE_DIR}/vastai/include
    ${CMAKE_CURRENT_SOURCE_DIR}
    $ENV{VASTSTREAM_INCLUDE_DIR}
)
list(APPEND LIB_DIRS
    ${CMAKE_CURRENT_SOURCE_DIR}/vastai/lib
    # ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/freetype2/lib
    # ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/opencv4.5.4/lib
    $ENV{VASTSTREAM_LIB_DIR}
)

include_directories(${INCLUDE_DIRS})
link_directories(${LIB_DIRS})

aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR} MY_SRC_DIR)
file(GLOB MY_SRC_DIR1 ${CMAKE_CURRENT_SOURCE_DIR}/vastai/src/*.cc)
# aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/vastai_util MY_SRC_DIR1)

# add_executable(test ${CMAKE_CURRENT_SOURCE_DIR}/test.cpp ${CMAKE_CURRENT_SOURCE_DIR}/my_log.cpp ${CMAKE_CURRENT_SOURCE_DIR}/test_conf.cpp)
add_executable(test ${MY_SRC_DIR} ${MY_SRC_DIR1})

target_include_directories(test PUBLIC ${VASTSTREAM_INCLUDE_DIR} ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(test PRIVATE fn-log vacm vace vame vaml pthread vmpp-enc vmpp-dec)





TranscodeTemplate::TranscodeTemplate(char* json_path)
{
    std::string codec_type;
    std::ifstream ifs(json_path);
    nlohmann::json configJson;
    
    ifs >> configJson;
    output_path_prefix = configJson.at("output_path_prefix").get<std::string>();
    device_id = configJson.at("device_id").get<uint32_t>();

    test_times = configJson.at("test_times").get<int>();
    decoder_template._src_path = configJson.at("inputs_desc").at("input_path").get<std::string>();
    codec_type = configJson.at("inputs_desc").at("codec_type").get<std::string>();
    decoder_template.SetCodecType(codec_type);
    
    // codec_type = configJson.at("outputs_desc").at("codec_type").get<std::string>();
    // encoder_template.SetCodecType(codec_type);
    // encoder_template._out_desc.encParams.videoConfig.cqp = configJson.at("outputs_desc").at("cqp").get<uint32_t>();
    // encoder_template._out_desc.encParams.videoConfig.crf = configJson.at("outputs_desc").at("crf").get<uint32_t>();
    // encoder_template._out_desc.encParams.videoConfig.vbr = configJson.at("outputs_desc").at("vbr").get<uint32_t>();
    // encoder_template._out_desc.encParams.videoConfig.qpMaxI = configJson.at("outputs_desc").at("qpMaxI").get<uint32_t>();
    // encoder_template._out_desc.encParams.videoConfig.qpMaxPB = configJson.at("outputs_desc").at("qpMaxPB").get<uint32_t>();
    // encoder_template._out_desc.encParams.videoConfig.qpMinI = configJson.at("outputs_desc").at("qpMinI").get<uint32_t>();
    // encoder_template._out_desc.encParams.videoConfig.qpMinPB = configJson.at("outputs_desc").at("qpMinPB").get<uint32_t>();
    // encoder_template._out_desc.encParams.videoConfig.bitRate = configJson.at("outputs_desc").at("bitRate").get<uint32_t>();
    // encoder_template._out_desc.encParams.videoConfig.maxFrameSizeMultiple = configJson.at("outputs_desc").at("maxFrameSizeMultiple").get<uint32_t>();
    // encoder_template._out_desc.encParams.videoConfig.vbvMaxRate = configJson.at("outputs_desc").at("vbvMaxRate").get<uint32_t>();
    // encoder_template._out_desc.encParams.videoConfig.vbvBufSize = configJson.at("outputs_desc").at("vbvBufSize").get<uint32_t>();
    // encoder_template._out_desc.encParams.videoConfig.svcTLayers = configJson.at("outputs_desc").at("svcTLayers").get<uint32_t>();

    // int width;
    // int height;

    // width = configJson.at("outputs_desc").at("encode_output_size")[0].get<int>();
    // height = configJson.at("outputs_desc").at("encode_output_size")[1].get<int>();
    // output_path_name = configJson.at("outputs_desc").at("output_path_name").get<std::string>();
    // if(encoder_template._out_desc.encParams.codecType == VAME_CODEC_ENC_H264)
    // {
    //     output_path_type = ".h264";
    // }
    // else if(encoder_template._out_desc.encParams.codecType == VAME_CODEC_ENC_HEVC)
    // {
    //     output_path_type = ".h265";
    // }
    // else
    // {
    //     output_path_type = "";
    // }
    // encoder_template._out_desc.video_path = output_path_prefix + output_path_name + output_path_type;
    // encoder_template._out_desc.video_width = width;
    // encoder_template._out_desc.video_height = height;
    // encoder_template._out_desc.encParams.videoConfig.width = width;
    // encoder_template._out_desc.encParams.videoConfig.height = height;
    // encoder_template._out_desc.svcExtractMaxTLayer = encoder_template._out_desc.encParams.videoConfig.svcTLayers;
}


这里的Windows  mac平台的硬件加速指的是在这两个平台上通过gpu加速转码吗














