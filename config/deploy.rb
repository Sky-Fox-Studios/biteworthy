# config valid only for current version of Capistrano
lock '3.8.1'
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
set :keep_releases, 3

set :log_level, :debug
# set :linked_files, fetch(:linked_files, []).push('config/application.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push("public/system", "public/cache")

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5

namespace :deploy do

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

namespace :solr do
  desc "start solr"
  task :start do
    on roles(:app) do
      within release_path do
        puts "Starting solr"
        begin
          execute :rake, "RAILS_ENV=#{fetch(:rails_env)} sunspot:solr:start"
        rescue Exception => error
          puts "**Start solr error (could be already running)**"
          puts error
        end
      end
    end
  end

  desc "reindex solr"
  task :reindex do
    on roles(:solr) do
      within release_path do
        puts "Reindex solr"
        execute :rake, "RAILS_ENV=#{fetch(:rails_env)} sunspot:solr:reindex"
      end
    end
  end

  desc "stop solr"
  task :stop do
    on roles(:app) do
      within current_path do
        puts "Stopping solr"
        begin
          execute :rake, "RAILS_ENV=#{fetch(:rails_env)} sunspot:solr:stop"
        rescue Exception => error
          puts "**Stop solr error (could have not been running)**"
          puts error
        end
      end
    end
  end

  desc "Symlink in-progress deployment to a shared Solr index"
  task :symlink do
    on roles(:app) do
      puts "Solr Symlink"
      execute "rm -rf #{release_path}/solr/#{fetch(:rails_env)}/data/"
      execute "ln -s #{shared_path}/solr/data #{release_path}/solr/#{fetch(:rails_env)}/"
      execute "ln -s #{shared_path}/solr/pids #{release_path}/solr/"

      puts "Sitemap Symlink"
      execute "ln -s #{shared_path}/sitemaps #{release_path}/public/"
    end
  end
end

before "deploy:migrate",       "figaro:setup"
before "deploy:migrate",       "figaro:symlink"
before "deploy:finished",      "solr:stop"
after  "deploy:finished",      "solr:symlink"
after  "deploy:finished",      "solr:start"
# after  "deploy:finishing",     "deploy:restart_nginx"
# after  "deploy:finishing",     "deploy:restart_nginx"
