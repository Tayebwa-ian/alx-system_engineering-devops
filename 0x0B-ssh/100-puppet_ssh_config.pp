# SSH Client configuration
file { '~/.ssg/config':
  ensure  => 'present',
  content => 'Host Ubuntu\n\tIdentityFile ~/.ssh/school\n\tPasswordAuthentication no'
}