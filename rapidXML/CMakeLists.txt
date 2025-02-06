project(rapidXML
  VERSION 1.13
  DESCRIPTION "XML Parser"
)
# Commit: 2ae4b2888165a393dfb6382168825fddf00c27b9
# Origin : https://github.com/discord/rapidxml
cmake_minimum_required(VERSION 3.21)

if (NOT DEFINED CMAKE_BUILD_TYPE)
  set (CMAKE_BUILD_TYPE Release CACHE STRING "Build type")
endif ()

option (BUILD_SHARED_LIBS "Build rapidXML as a shared library" ON)



add_library(rapidXML
  rapidxml_iterators.hpp
	rapidxml_print.hpp
	rapidxml_utils.hpp
	rapidxml.hpp
)

set_property(TARGET rapidXML PROPERTY PUBLIC_HEADER
  rapidxml_iterators.hpp
  rapidxml_print.hpp
  rapidxml_utils.hpp
  rapidxml.hpp
)


target_include_directories(rapidXML PRIVATE
	"${CMAKE_CURRENT_SOURCE_DIR}"
)

set_target_properties(rapidXML PROPERTIES LINKER_LANGUAGE CXX)
