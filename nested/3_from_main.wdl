import "4_from_main.wdl" as four

task task_3_from_main {
  String addressee
  command {
    echo "Hello ${addressee}!"
    sleep 600
  }
  runtime {
    docker: "ubuntu:latest"
  }
}

workflow three_from_main {
  call four.four_from_main
}
