# Task2:  puppet file to kill a process
# task is a demo how to execute command on shell
# Optional: uou could Specify the provider (default is provider => 'posix')
exec{ 'kill_process_killmenow':
  command => 'pkill -f killmenow',
  path    => ['/usr/bin','/usr/sbin'],# Set the PATH environment variable
}
