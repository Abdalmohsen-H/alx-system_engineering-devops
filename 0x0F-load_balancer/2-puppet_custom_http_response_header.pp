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

file { '/etc/nginx/sites-available/default':
  ensure  => file,  # Ensure that the file exists
  content => template('nginx_config/nginx.conf.erb'),  # Set the content of the file using an ERB template
  require => Package['nginx'],  # Require the 'nginx' package to be installed first
  notify  => Service['nginx'],  # Notify the 'nginx' service to restart if the file changes
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
