##############################################################################
# OpenSplice_IDLGEN(idlfilename)
#
# Macro to generate OpenSplice DDS sources from a given idl file with the 
# data structures.
# You must include the extension .idl in the name of the data file.
#
##############################################################################
# Courtersy of Ivan Galvez Junquera <ivgalvez@gmail.com>
##############################################################################


# Macro to create a list with all the generated source files for a given .idl filename
macro(DEFINE_OpenSplice_SOURCES idlfilename outPath)
	set(outsources)
	get_filename_component(it ${idlfilename} ABSOLUTE)
	get_filename_component(nfile ${idlfilename} NAME_WE)
	set(outsources ${outsources} ${outPath}/${nfile}.cpp ${outPath}/${nfile}.h)
	set(outsources ${outsources} ${outPath}/${nfile}_DCPS.cpp ${outPath}/${nfile}_DCPS.h)
	set(outsources ${outsources} ${outPath}/${nfile}SplDcps.cpp ${outPath}/${nfile}SplDcps.h)
	set(outsources ${outsources} ${outPath}/ccpp_${nfile}.h)
endmacro(DEFINE_OpenSplice_SOURCES)

macro(OpenSplice_IDLGEN idlfilenameArg outPath)
	get_filename_component(it ${idlfilenameArg} ABSOLUTE)
	get_filename_component(idlfilename ${idlfilenameArg} NAME)
	DEFINE_OpenSplice_SOURCES(${idlfilenameArg} ${outPath})
	set(ENV{LD_LIBRARY_PATH} "$ENV{LD_LIBRARY_PATH}:${OSPLLib}")

	project_execute_process(
		COMMAND ${OpenSplice_IDLGEN_BINARY} 
		-l isocpp2 
		-d ${outPath} ${it})
endmacro(OpenSplice_IDLGEN)

