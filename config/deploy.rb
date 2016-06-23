# config valid only for current version of Capistrano
lock '3.4.1'
set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }

set :application, 'bwd'
set :repo_url, 'git@github.com:shadoath/bwd.git'
set :rake, 'bundle exec rake'
set :scm, :git
set :log_level, :debug
set :pty, true
set :rvm_ruby_string, :local
set :deploy_to, "/var/www/#{fetch(:application)}"
set :bundle_gemfile, -> { release_path.join('Gemfile') }

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'


# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  task :restart_nginx do
    on roles(:app), in: :sequence, wait: 5 do
      execute "sudo service nginx restart"
    end
  end
end

namespace :figaro do
  desc "SCP transfer figaro configuration to the shared folder"
  task :setup do
    on roles(:app) do
      upload! "config/application.yml", "#{shared_path}/application.yml", via: :scp
    end
  end

  desc "Symlink application.yml to the release path"
  task :symlink do
    on roles(:app) do
      execute "ln -sf #{shared_path}/application.yml #{release_path}/config/application.yml"
    end
  end
end

namespace :assets  do
  namespace :symlinks do
    desc "Setup shared folders for assets. Run ONCE."
    task :setup do
      on roles(:app) do
        ['public/images'].each { |link| execute "mkdir -p #{shared_path}/#{link}" }
      end
    end

    desc "Setup application symlinks for shared assets."
    task :clear_dev do
      on roles(:app) do
        ['public/images'].each { |link| execute "rm -rf #{release_path}/#{link}" }
      end
    end

    desc "Link assets for current deploy to the shared location"
    task :update do
      on roles(:app) do
        ['public/images'].each { |link| execute "ln -nfs #{shared_path}/#{link} #{release_path}/#{link}" }
      end
    end
  end
end
#
# before "deploy:migrate", "assets:symlinks:clear_dev"
# before "deploy:migrate", "assets:symlinks:update"

before "deploy:migrate",       "figaro:setup"
before "deploy:migrate",       "figaro:symlink"
after  "deploy:finishing",     "deploy:restart_nginx"
