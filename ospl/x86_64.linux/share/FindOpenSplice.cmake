##############################################################################
# Try to find OpenSplice
# Once done this will define:
#
#  OpenSplice_FOUND - system has OpenSplice.
#  OpenSplice_INCLUDE_DIRS - the OpenSplice include directory.
#  OpenSplice_LIBRARIES - Link these to use OpenSplice.
#  OpenSplice_IDLGEN_BINARY - Binary for the IDL compiler.
#
# You need the environment variable $OSPL_HOME to be set to your OpenSplice
# installation directory.
# This script also includes the MacroOpenSplice.cmake script, which is useful
# for generating code from your idl.
#
##############################################################################
# Courtesy of Ivan Galvez Junquera <ivgalvez@gmail.com>
##############################################################################
FIND_PATH(OpenSplice_INCLUDE_DIR
	NAMES
		make_files.py
	PATHS
		$ENV{OSPL_HOME}/include
)
SET(OpenSplice_INCLUDE_DIRS 
  ${OSPL_HOME}/include
  ${OSPL_HOME}/include/sys
  ${OSPL_HOME}/include/dcps/C++/isocpp2
  ${OSPL_HOME}/include/dcps/C++/SACPP
  
)

# Find libraries
FIND_LIBRARY(KERNEL_LIBRARY
	NAMES
		ddskernel
	PATHS
		${OSPL_HOME}/lib
)

FIND_LIBRARY(DCPSISOCPP_LIBRARY
	NAMES
		dcpsisocpp2
	PATHS
		${OSPL_HOME}/lib
)

SET(OpenSplice_LIBRARIES
			${KERNEL_LIBRARY}
			${DCPSISOCPP_LIBRARY}
			${DCPSCPP_LIBRARY}

)

# Binary for the IDL compiler 
set(OpenSplice_IDLGEN_BINARY ${OSPL_HOME}/bin/idlpp)

IF (OpenSplice_INCLUDE_DIRS AND OpenSplice_LIBRARIES)
	SET(OpenSplice_FOUND TRUE)
ENDIF (OpenSplice_INCLUDE_DIRS AND OpenSplice_LIBRARIES)

IF (OpenSplice_FOUND)
	MESSAGE(STATUS "Found OpenSplice DDS libraries: ${OpenSplice_LIBRARIES}")
ELSE (OpenSplice_FOUND)
	IF (OpenSplice_FIND_REQUIRED)
		MESSAGE(FATAL_ERROR "Could not find OpenSplice DDS")
	ENDIF (OpenSplice_FIND_REQUIRED)
ENDIF (OpenSplice_FOUND)

MARK_AS_ADVANCED(OpenSplice_INCLUDE_DIRS OpenSplice_LIBRARIES OpenSplice_IDLGEN_BINARY)
include(MacroOpenSplice)

