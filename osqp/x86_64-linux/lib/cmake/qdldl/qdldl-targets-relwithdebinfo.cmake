#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "qdldl::qdldlstatic" for configuration "RelWithDebInfo"
set_property(TARGET qdldl::qdldlstatic APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(qdldl::qdldlstatic PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELWITHDEBINFO "C"
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libqdldl.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS qdldl::qdldlstatic )
list(APPEND _IMPORT_CHECK_FILES_FOR_qdldl::qdldlstatic "${_IMPORT_PREFIX}/lib/libqdldl.a" )

# Import target "qdldl::qdldl" for configuration "RelWithDebInfo"
set_property(TARGET qdldl::qdldl APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(qdldl::qdldl PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libqdldl.so"
  IMPORTED_SONAME_RELWITHDEBINFO "libqdldl.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS qdldl::qdldl )
list(APPEND _IMPORT_CHECK_FILES_FOR_qdldl::qdldl "${_IMPORT_PREFIX}/lib/libqdldl.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
