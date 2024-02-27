version 1.0

task read_file {
  input {
    File file_to_read
  }

  command {
    echo "hi!"
  }

  output {
    Array[String] lines = read_lines(file_to_read)
  }
  
  runtime {
    docker: "ubuntu:latest"
    maxRetries: 5
  }
}

workflow read_a_file {
  call read_file
  output {
    Array[String] workflow_output = read_file.lines
  }
}
