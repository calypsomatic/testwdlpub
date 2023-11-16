version 1.0

task echo_files {
  String outputFileName = "my_task_output.txt"

  meta {
    volatile: true
  }

  input {
    File file1
    File file2
  }

  command {
    echo "file1: ${file1}"
    echo "file2: ${file2}"
    echo "Task ran with ${file1} and ${file2} as inputs" > ${outputFileName}
  }

  output {
    File outFile = outputFileName
  }

  runtime {
    docker: "ubuntu:latest"
    maxRetries: 5
    azureSasEnvironmentVariable: "VALID_NAME"
  }
}

workflow azure_blob_storage_read {
  call echo_files
  output {
    String s1 = read_string(echo_files.outFile)
  }
}
