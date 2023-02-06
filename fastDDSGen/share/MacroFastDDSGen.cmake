##############################################################################
# FastDDS_IDLGEN(idlfilename)
#
# Macro to generate Fast DDS sources from a given idl file with the 
# data structures.
# You must include the extension .idl in the name of the data file.
#
##############################################################################

macro(FastDDS_IDLGEN idlfilenameArg outPath)
	set(FastDDS_JAR "${FAST_DDSGEN_SRC}/share/fastddsgen/java/fastddsgen.jar")
	set(FastDDS_IDLGEN_BINARY "${Java_JAVA_EXECUTABLE}")
			get_filename_component(outPath ${idl_file} DIRECTORY)
		
	file(MAKE_DIRECTORY ${outPath})
	project_execute_process(
		COMMAND ${FastDDS_IDLGEN_BINARY} 
		-jar ${FastDDS_JAR} 
		-replace 
		${idlfilenameArg} 
		-d ${outPath})
endmacro(FastDDS_IDLGEN)

