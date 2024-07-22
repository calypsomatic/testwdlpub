version 1.0

task manyInputsTask {
    input {
        File inputFile
    }

    command <<<
        cat ~{inputFile}
    >>>

    output {
        String stdout = read_string(stdout())
    }

    runtime {
        docker: "ubuntu:latest"
    }

    meta {
        volatile: true
    }
}

workflow manyInputs {
    input {
        Array[File] inputFiles
    }
    scatter (file in inputFiles) {
        call manyInputsTask {
        input: 
            inputFile = file   
        }
    }
}