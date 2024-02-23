# installing flask
package { 'python3':
  ensure => 'installed',
}

package { 'python3-pip':
  ensure => 'installed',
  require => Package['python3'],
}

# Install Flask using pip3 with the desired version
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  require  => Package['python3-pip'],
}