#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "avcpp::avcpp" for configuration ""
set_property(TARGET avcpp::avcpp APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(avcpp::avcpp PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libavcpp.so"
  IMPORTED_SONAME_NOCONFIG "libavcpp.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS avcpp::avcpp )
list(APPEND _IMPORT_CHECK_FILES_FOR_avcpp::avcpp "${_IMPORT_PREFIX}/lib/libavcpp.so" )

# Import target "avcpp::avcpp-static" for configuration ""
set_property(TARGET avcpp::avcpp-static APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(avcpp::avcpp-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libavcpp.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS avcpp::avcpp-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_avcpp::avcpp-static "${_IMPORT_PREFIX}/lib/libavcpp.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
