worker_processes 2
timeout 600
preload_app true

root_folder = '/home/ns/nonsolusapp'
working_directory File.join('/home/ns/nonsolusapp', 'current')

pid_file = File.join root_folder, 'shared/tmp/pids/unicorn.pid'
old_pid = pid_file + '.oldbin'
pid pid_file
listen File.join(root_folder, 'shared/tmp/sockets/unicorn.sock'), backlog: 2048
stderr_path File.join root_folder, 'shared/log/unicorn.log'
stdout_path File.join root_folder, 'shared/log/unicorn.log'

Unicorn::HttpServer::START_CTX[0] = File.join root_folder, 'current/bin/unicorn_rails'

before_exec do |_server|
  ENV['BUNDLE_GEMFILE'] = File.join root_folder, 'current/Gemfile'
end

run_once = true

before_fork do |server, _worker|

  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      Process.kill('QUIT', File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      puts 'Rescue from Errno::ENOENT, Errno::ESRCH'
    end
  end
end

after_fork do |_server, _worker|

  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to sent QUIT'
  end

  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end

