version 1.0

task manyOutputsTask {
    input {
        String fileName
        String fileExtension
        Int numberOfFiles
    }

    command <<<
        for i in {1..~{numberOfFiles}}
        do
            echo "Creating file ~{fileName}_$i.~{fileExtension}"
            touch "~{fileName}_$i.~{fileExtension}"
        done
    >>>

    output {
        Array[File] outputFiles = glob("*.~{fileExtension}")
        String stdout = read_string(stdout())
    }

    runtime {
        docker: "ubuntu:latest"
    }

    meta {
        volatile: true
    }
}

workflow manyOutputs {
    call manyOutputsTask {input: fileName = "filename", fileExtension = "txt", numberOfFiles = 5}
    output {
        Array[File] files = manyOutputsTask.outputFiles
        String stdout = manyOutputsTask.stdout
    }
}