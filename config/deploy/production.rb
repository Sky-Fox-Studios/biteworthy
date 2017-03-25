role :app, %w{deploy@45.55.118.103}
role :db,  %w{deploy@45.55.118.103}
role :web, %w{deploy@45.55.118.103}


server '45.55.118.103', user: 'deploy', roles: %w{web app db}
set :branch, 'master'
set :deploy_to, "/var/www/#{fetch(:application)}"
set :rails_env, 'production'
