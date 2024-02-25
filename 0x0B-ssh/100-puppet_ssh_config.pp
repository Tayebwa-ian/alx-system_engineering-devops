# SSH Client configuration
file { 'home/3015f484ce90/.ssh/config':
  ensure  => present,
  content => "Host Ubuntu\n\tIdentityFile ~/.ssh/school\n\tPasswordAuthentication no",
}