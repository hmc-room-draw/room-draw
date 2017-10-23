working_directory File.expand_path("../..", __FILE__)
worker_processes 5
listen "/tmp/unicorn.sock"
timeout 30
pid "/tmp/unicorn_roomdraw.pid"
stdout_path "/tmp/unicorn.log"
stderr_path "/tmp/unicorn.log"
