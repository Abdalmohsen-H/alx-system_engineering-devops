# task2: puppet code instead of bash script on task 0, for Nginx install. and config
exec {'install_nginx':
    command  => 'sudo apt-get update ; sudo apt-get -y install nginx',
    provider => shell,
}

file_line { 'add_http_header':
    path    => '/etc/nginx/nginx.conf',
    match   => 'server_name _;',
    line    => "server_name _;\n\tadd_header X-Served-By \'${hostname}\';",
    require => Exec['install_nginx'],  # this line to specify the dependency
}

exec {'run':
    command => '/usr/sbin/service nginx restart',
}
