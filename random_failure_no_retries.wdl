version 1.0

task randomly_fail_task {
  input {
    String inputString
  }

  command {
    echo ${inputString}
    if [ $(( RANDOM % 2 )) -eq 0 ]; then
        echo "Exiting with status 0"
        exit 0
    else
        echo "Exiting with status 1"
        exit 1
    fi
  }

  output {
    String outputString = inputString
  }
  
  runtime {
    docker: "ubuntu:latest"
  }

  meta {
    volatile: true
  }
}

workflow randomly_fail_wf {
  scatter (i in range(5)) {
    call randomly_fail_task
  }
}