# A.Hesham : Puppet code for project web stack debug. no. 4, require to change lines on OS config, holberton hard nofile 5
# and holberton soft nofile 4
# So I could login with holberton user (su - holberton), then be able to open file without getting any  "Too many open files"  error
exec { 'Update OS security limits config':
  command => 'sudo sed -i "s/4/39526/" /etc/security/limits.conf; sudo sed -i "s/5/48657/" /etc/security/limits.conf',
  path    => ['/usr/bin', '/bin'],
}
