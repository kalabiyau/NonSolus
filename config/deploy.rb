require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'mina/unicorn'
require 'mina_sidekiq/tasks'

set :domain, 'act.suse.de'
set :user, 'ns'
set :deploy_to, '/home/ns/nonsolusapp'
set :repository, 'https://github.com/kalabiyau/NonSolus.git'
set :branch, 'master'

set :shared_paths, ['config/database.yml', 'log', 'tmp/pids', 'tmp/sockets', 'config/secrets.yml']

task :environment do
  invoke :'rvm:use[ruby-2.1.5@default]'
end

task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/tmp/sockets"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/tmp/sockets"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/tmp/pids"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/tmp/pids"]

  queue! %[touch "#{deploy_to}/#{shared_path}/config/database.yml"]
  queue  %[echo "-----> Be sure to edit '#{deploy_to}/#{shared_path}/config/database.yml'."]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'sidekiq:quiet'
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    to :launch do
      invoke :'sidekiq:restart'
      invoke :'unicorn:restart'
    end
  end
end


