# SSH Client configuration
file {'ssh_config_file':
  path    => '/home/3015f484ce90/.ssh/config',
  ensure  => present,
  owner   => 'root',
  group   => 'root',
  content => "Host Ubuntu\n\tIdentityFile ~/.ssh/school\n\tPasswordAuthentication no",
}