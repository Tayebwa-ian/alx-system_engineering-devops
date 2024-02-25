# SSH Client configuration
file { 'home/ubuntu/.ssh/config':
  ensure  => present,
  content => "Host Ubuntu\n\tIdentityFile ~/.ssh/school\n\tPasswordAuthentication no",
}