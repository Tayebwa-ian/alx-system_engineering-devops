# SSH Client configuration
file { '/../../etc/ssh':
  ensure  => directory,
}

file { '/../../etc/ssh/ssh_config':
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  content => "Host Ubuntu\n\tIdentityFile ~/.ssh/school\n\tPasswordAuthentication no",
}