server '36.255.222.190',
       user: 'deploy',
       roles: %w{app db cache web},
       ssh_options: {
           user: 'deploy', # overrides user setting above
           keys: %w(~/.ssh/id_rsa),
           port: 5022,
           forward_agent: false,
           auth_methods: %w(publickey password)
           # password: 'please use keys'
       }

set :workers, {'*': 1}

set :deploy_to, '/deploy/test/pokerking_cms'
set :branch, ENV.fetch('REVISION', ENV.fetch('BRANCH', 'master'))
set :rails_env, 'production'

# puma
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_env, fetch(:rails_env, 'production')
set :puma_threads, [0, 5]
set :puma_workers, 0