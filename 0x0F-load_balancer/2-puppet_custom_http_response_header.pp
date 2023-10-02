# task2: puppet code instead of bash script on task 0, for Nginx install. and config
#Puppet class to apply Nginx installation and config.
class nginx_config {
  package { 'nginx':
    ensure  => installed,
  }

  file_line { 'add_http_header':
    path  => '/etc/nginx/nginx.conf',
    match => 'http {',
    line  => "http {\n\tadd_header X-Served-By \"${hostname}\";",
    }

  exec {'run':
    command => '/usr/sbin/service nginx restart',
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
