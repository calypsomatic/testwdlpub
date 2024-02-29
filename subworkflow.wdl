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

workflow sub {
  workflow wf_hello {
    String wf_hello_input = "world"
    
    call hello { input: addressee = wf_hello_input }
    
    output {
      String salutation = hello.salutation
    }
  }
}

workflow main_workflow {
    call sub.wf_hello { input: wf_hello_input = "sub world" }
    output {
        String main_output = wf_hello.salutation
    }
}

