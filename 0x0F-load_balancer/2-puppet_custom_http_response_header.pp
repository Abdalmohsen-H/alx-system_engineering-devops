# task2: puppet code instead of bash script on task 0, for Nginx install. and config
exec {'install_nginx':
  command  => 'sudo apt-get update ; sudo apt-get -y install nginx',
  provider => shell,
}

-> package {'nginx':
  ensure => 'present',
}

-> exec {'Hello_world':
  command  => 'echo "Hello World!" > /var/www/html/index.html',
  provider => shell,
}

-> file_line { 'add_header_line':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  line   => "	server_name _;
  add_header X-Served-By ${hostname};",
  match  => '^\tserver_name _;',
}

-> exec {'apply_new_config':
  command  => 'sudo service nginx restart',
  provider => shell,
}
