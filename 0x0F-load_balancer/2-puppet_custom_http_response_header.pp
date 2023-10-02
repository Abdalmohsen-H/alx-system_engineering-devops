# task2: puppet code instead of bash script on task 0, for Nginx install. and config
#Puppet class to apply Nginx installation and config.
class nginx_config {
  package { 'nginx':
    ensure  => installed,
  }

  file { '/var/www/html/index.html':
    ensure  => file,
    content => 'Hello World!',
  }

  file { '/var/www/html/404.html':
    ensure  => file,
    content => "Ceci n'est pas une page",
  }

  file_line { 'add_http_header':
    path  => '/etc/nginx/nginx.conf',
    match => 'server_name _;',
    line  => "server_name _;\n\tadd_header X-Served-By \"${hostname}\";",
    }

  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx'],
  }

#   exec { 'ufw-allow-ssh':
#     command => 'ufw allow 22/tcp',
#     unless  => 'ufw status | grep 22/tcp | grep ALLOW',
#   }

#   exec { 'ufw-allow-http':
#     command => 'ufw allow 80/tcp',
#     unless  => 'ufw status | grep 80/tcp | grep ALLOW',
#   }
}

# Apply the class to the node
node 'my_node_name' {
  include nginx_config
}
