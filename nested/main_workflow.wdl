import "sub_wdl.wdl" as sub

task foo {
  command {
    echo "Hello from a top level task!"
    sleep 600
  }
  runtime {
    docker: "ubuntu:latest"
  }
}

workflow main_workflow {
    call foo
    call sub.hello_and_goodbye { input: hello_and_goodbye_input = "sub world" }
    
    output {
        String main_output = hello_and_goodbye.hello_output
    }
}
