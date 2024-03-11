version 1.0

task read_file {
  input {
    File file_to_read
  }

  command {
    cat ~{file_to_read}
  }

  output {
    File outputFile = file_to_read
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
    Array[String] the_output = read_lines(read_file.outputFile)
  }
}
