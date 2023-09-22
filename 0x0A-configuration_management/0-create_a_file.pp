# Create a file named 'school' at '/tmp/school'
# Also you could add
# ensure  => 'file',
# it's the default value for file type it doesn't really matter unless you want another
# value for ensure than file
# tasjk also require specified owner, group, mode, and content.
file { '/tmp/school':
  path    => '/tmp/school',
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0744',
  content =>'I love Puppet',
}
