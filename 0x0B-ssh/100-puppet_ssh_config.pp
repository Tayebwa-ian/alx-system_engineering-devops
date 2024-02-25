# SSH Client configuration
file { '/home/.ssh':
  ensure  => directory,
}

file { '/home/.ssh/config':
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  content => "Host Ubuntu\n\tIdentityFile ~/.ssh/school\n\tPasswordAuthentication no",
}