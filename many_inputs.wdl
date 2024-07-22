version 1.0

workflow manyInputs {
    input {
        Array[File] inputFiles
    }

    output {
        Int count = length(inputFiles)
    }
}