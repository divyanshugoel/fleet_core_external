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
		--plugin=protoc-gen-grpc=${GRPC_PLUGIN_EXEC_CPP}
		--grpc_out=${outPath}
		--cpp_out=${outPath})
	project_execute_process(COMMAND "${PROTOC_EXECECUTABLE}")
endfunction(PROTOC_GEN)


function(PROTOC_GEN_PY protocfilenameArg protofolderNameArg outPath)
	file(MAKE_DIRECTORY ${outPath})
	set(PROTOC_EXECECUTABLE ${PROTOBUF_PROTOC_EXEC}
		${protocfilenameArg}
		--proto_path=${protofolderNameArg}
		--plugin=protoc-gen-grpc_python=${GRPC_PLUGIN_EXEC_PY}
		--grpc_python_out=${outPath}
		--python_out=${outPath})
	project_execute_process(COMMAND "${PROTOC_EXECECUTABLE}")
endfunction(PROTOC_GEN_PY)

