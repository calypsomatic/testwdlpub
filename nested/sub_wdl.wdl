import "equality.wdl" as equal

task hello {
  String addressee
  command {
    echo "Hello ${addressee}!"
  }
  runtime {
    docker: "ubuntu:latest"
  }
  output {
    String salutation = read_string(stdout())
  }
}
task goodbye {
  String addressee
  command {
    echo "Goodbye ${addressee}!"
  }
  runtime {
    docker: "ubuntu:latest"
  }
  output {
    String salutation = read_string(stdout())
  }
}
workflow hello_and_goodbye {
  String hello_and_goodbye_input
  
  call hello {input: addressee = hello_and_goodbye_input }
  call goodbye {input: addressee = hello_and_goodbye_input }
  call equal.eqality_testing
  
  output {
    String hello_output = hello.salutation
    String goodbye_output = goodbye.salutation
  }
}
