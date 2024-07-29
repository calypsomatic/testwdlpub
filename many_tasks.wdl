version 1.0

task trivialTask {
    input {
        Int duration
    }

    command <<<
        echo "Sleeping for ~{duration} seconds"
        sleep ~{duration}
    >>>

    output {
        String stdout = read_string(stdout())
    }
}

workflow manyTasks {
    input {
        Int taskDuration
        Int numTasks
    }

    scatter (i in range(numTasks)) {
        call trivialTask {
            input:
                duration = taskDuration
        }
    }

    output {
        Array[String] stdouts = trivialTask.stdout
    }
}
