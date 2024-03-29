# puppet script to do tasks till task 3 with nginx installed
exec {'install_nginx':
  command  => 'sudo apt-get update ; sudo apt-get -y install nginx',
  provider => shell,
}

package {'nginx':
  ensure => 'present',
}

exec {'Hello_world':
  command  => 'echo "Hello World!" > /var/www/html/index.html',
  provider => shell,
}

exec {'replace_config_with_sed':
  command  => 'sh -c "sed -i \"s|server_name _;|server_name _;\\n\\trewrite ^/redirect_me https://youtube.com permanent;|\" /etc/nginx/sites-enabled/default"',
  provider => shell,
}

exec {'apply_new_config':
  command  => 'sudo service nginx restart',
  provider => shell,
}
