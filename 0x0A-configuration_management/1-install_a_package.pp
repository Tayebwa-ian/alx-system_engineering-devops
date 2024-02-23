# Install Flask using pip3 with the desired version
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}
