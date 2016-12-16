set :application, 'libanco.com'
set :user, 'deployer'
set :repo_url, 'git://github.com/cirope/libanco.git'

set :format, :pretty
set :log_level, :info

set :deploy_to, "/var/www/#{fetch(:application)}"
set :deploy_via, :remote_cache

set :linked_files, %w{config/application.yml}
set :linked_dirs, %w{log private tmp/pids}

set :rbenv_type, :user
set :rbenv_ruby, '2.3.3'

set :keep_releases, 5

namespace :deploy do
  before :check,      'config:upload'
  after  :publishing, :restart
  after  :published,  'sidekiq:restart'
  after  :finishing,  :cleanup
end
