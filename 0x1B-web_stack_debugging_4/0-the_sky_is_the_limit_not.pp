# Puppet code to make sure that nginxcould handle large number of requests
# number will be less or equal max. number of file descriptors that a shell
# session or process can have, you could check with "ulimit -n" cmd
exec { 'Higher Nginx ULIMIT':
  command => 'sudo sed -i "s/15/4096/" /etc/default/nginx; sudo service nginx restart',
  path    => ['/usr/bin', '/bin'],
}
