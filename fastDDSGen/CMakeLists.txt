# #######################################################################
# Macro definations for Java based idl->header file generation for fastDDS.
# #######################################################################

find_package(Java COMPONENTS Runtime)
if (Java_Runtime_FOUND)
	set(FAST_DDSGen_ENABLED TRUE PARENT_SCOPE)
else()
	set(FAST_DDSGen_ENABLED FALSE PARENT_SCOPE)
endif()	
include(share/MacroFastDDSGen.cmake)