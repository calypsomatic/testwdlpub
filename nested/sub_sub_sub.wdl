task foo {
  command {
    echo "Hello from a scatter task in a sub sub sub workflow!"
    sleep 600
  }
  runtime {
    docker: "ubuntu:latest"
  }
  
  meta {
    volatile: true
  }
}

workflow wf {
  scatter (i in range(2)) {
    call foo
  }
}
