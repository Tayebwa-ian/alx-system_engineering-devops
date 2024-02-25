# SSH Client configuration
file { '~/.ssh/config':
  ensure  => present,
  owner   => 'root',
  group   => 'root',
  content => "Host Ubuntu\n\tIdentityFile ~/.ssh/school\n\tPasswordAuthentication no",
}