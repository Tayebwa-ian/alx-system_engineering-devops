# Install python3 and pip3
package { 'python3':
  ensure => 'installed',
}

package { 'python3-pip':
  ensure  => 'installed',
  require => Package['python3'],
}

# Install Werkzeug using pip
package { 'Werkzeug':
  ensure   => '2.1.1',
  provider => 'pip3',
  require  =>Package['python3-pip'],
}

# Install Flask using pip3 with the desired version
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  require  => Package['Werkzeug'],
}