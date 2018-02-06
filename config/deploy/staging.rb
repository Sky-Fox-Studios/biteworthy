role :app, %w{deploy@52.27.124.36}
role :db,  %w{deploy@52.27.124.36}
role :web, %w{deploy@52.27.124.36}

server '52.27.124.36', user: 'ubuntu', roles: %w{web app db}
set :branch, 'staging'
set :deploy_to, "/data/#{fetch(:application)}/staging"
set :rails_env, 'staging'
