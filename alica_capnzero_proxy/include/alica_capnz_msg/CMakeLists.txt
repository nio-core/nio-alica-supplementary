cmake_minimum_required(VERSION 2.8.3)
project(alica_capnzero_proxy)


#### ALICA CAPNZERO MESSAGES
find_package(CapnProto CONFIG REQUIRED)

capnp_generate_cpp(source header AllocationAuthorityInfo.capnp)

#capnp_generate_cpp(${CMAKE_CURRENT_SOURCE_DIR}/include/alica_capnz_msg ${CMAKE_CURRENT_SOURCE_DIR}/include/alica_capnz_msg include/alica_capnz_msg/AllocationAuthorityInfo.capnp)

#set(CAPNPC_IMPORT_DIRS "/media/sf_Dev.Cloud.Area/C++/ALICA_independent/capnzero/id_capnzero/include")     # include external capnp message schema files
#set(${PROJECT_NAME}_msgs "${CMAKE_CURRENT_SOURCE_DIR}/include/alica_capnz_msg")
#file(GLOB_RECURSE capnp_messages ${${PROJECT_NAME}_msgs} *.capnp)
#set(CAPNPC_SRC_PREFIX ${${PROJECT_NAME}_msgs})
#set(CAPNPC_OUTPUT_DIR ${${PROJECT_NAME}_msgs})
#capnp_generate_cpp(CAPNP_SRCS CAPNP_HDRS ${capnp_messages})


