server '52.27.124.36', user: 'ubuntu', roles: %w{web app db}
set :branch, 'sb-points'
set :deploy_to, "/data/#{fetch(:application)}_staging"
set :rails_env, 'staging'
