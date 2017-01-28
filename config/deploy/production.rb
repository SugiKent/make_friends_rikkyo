# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '13.112.83.15', user: 'kento', roles: %w{app db web}

#デプロイするサーバーにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/halcala_key_rsa'
