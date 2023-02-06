##############################################################################
# PROTOC_GEN(protofilename)
#
# Macro to generate protobuf sources from a given proto file with the 
# data structures.
# You must include the extension .proto in the name of the data file.
#
##############################################################################

function(PROTOC_GEN protocfilenameArg protofolderNameArg outPath)
	file(MAKE_DIRECTORY ${outPath})
	set(PROTOC_EXECECUTABLE ${PROTOBUF_PROTOC_EXEC}
		${protocfilenameArg}
		--proto_path=${protofolderNameArg}
		--cpp_out=${outPath})
	project_execute_process(COMMAND "${PROTOC_EXECECUTABLE}")
endfunction(PROTOC_GEN)

