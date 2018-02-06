role :app, %w{deploy@45.55.118.103}
role :db,  %w{deploy@45.55.118.103}
role :web, %w{deploy@45.55.118.103}

server '45.55.118.103', user: 'deploy', roles: %w{web app db}
set :branch, 'staging'
set :deploy_to, "/data/#{fetch(:application)}/staging"
set :rails_env, 'staging'
