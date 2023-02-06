##############################################################################
# Try to find linunwind
# Once done this will define:
#
#  Unwind_FOUND - system has OpenSplice.
#  Unwind_INCLUDE_DIRS - the OpenSplice include directory.
#  Unwind_LIBRARIES - Link these to use OpenSplice.
#
#
##############################################################################
FIND_PATH(Unwind_INCLUDE_DIRS
	PATHS
	$ENV{Unwind_HOME}/include
)
SET(Unwind_INCLUDE_DIRS 
  ${Unwind_HOME}/include
)

# Find libraries
FIND_LIBRARY(UNWIND_LIBRARY
	NAMES
		unwind
	PATHS
		${Unwind_HOME}/lib
)

FIND_LIBRARY(UNWIND_COREDUMP_LIBRARY
	NAMES
		unwind-coredump
	PATHS
		${Unwind_HOME}/lib
)

FIND_LIBRARY(UNWIND_GENERIC_LIBRARY
	NAMES
		unwind-generic
	PATHS
		${Unwind_HOME}/lib
)

FIND_LIBRARY(UNWIND_PTRACE_LIBRARY
	NAMES
		unwind-ptrace
	PATHS
		${Unwind_HOME}/lib
)

FIND_LIBRARY(UNWIND_x86_LIBRARY
	NAMES
		unwind-x86_64
	PATHS
		${Unwind_HOME}/lib
)

SET(Unwind_LIBRARIES
			${UNWIND_LIBRARY} 
			${UNWIND_COREDUMP_LIBRARY}
			${UNWIND_GENERIC_LIBRARY}
			${UNWIND_PTRACE_LIBRARY}
			${UNWIND_x86_LIBRARY}
)

IF (Unwind_INCLUDE_DIRS AND Unwind_LIBRARIES)
	SET(Unwind_FOUND TRUE)
	# Create imported target fastrtps
	add_library(unwind SHARED IMPORTED)
	set_property(TARGET unwind APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
	set_target_properties(unwind PROPERTIES
	   IMPORTED_LOCATION_RELEASE "${Unwind_HOME}/lib/libunwind.so"
	   IMPORTED_SONAME_RELEASE "libunwind.so"
	)
	list(APPEND _cmake_import_check_targets unwind )
	list(APPEND _cmake_import_check_files_for_unwind "${Unwind_HOME}/lib/libunwind.so" )
	
ENDIF (Unwind_INCLUDE_DIRS AND Unwind_LIBRARIES)

IF (Unwind_FOUND)
	MESSAGE(STATUS "Found Unwind libraries: ${UNWIND_LIBRARY}")
ELSE (Unwind_FOUND)
	IF (Unwind_FIND_REQUIRED)
		MESSAGE(FATAL_ERROR "Could not find Unwind libraries")
	ENDIF (Unwind_FIND_REQUIRED)
ENDIF (Unwind_FOUND)

MARK_AS_ADVANCED(Unwind_INCLUDE_DIRS Unwind_LIBRARIES)

