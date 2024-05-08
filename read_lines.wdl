version 1.0

task read_file {
  input {
    File file_to_read
  }

  command {
    cat ~{file_to_read}
  }

  output {
    Array[String] lines = ["1", "2", "3"]
  }
  
  runtime {
    docker: "ubuntu:latest"
  }

  meta {
    volatile: true
  }
}

workflow read_a_file {
  call read_file
  output {
    Array[String] a1 = read_file.lines
  }
}