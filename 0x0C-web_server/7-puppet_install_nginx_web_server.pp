# Script to install nginx using puppet
exec {'install_update':
  command  => 'sudo apt-get -y update ; sudo apt install nginx',
  provider => shell,

}

package {'nginx':
  ensure   => 'present',
  required => Exec['install_update'],
}

exec {'change_owner':
  command  => 'sudo chown -R "$USER":"$USER" /var/www/',
  provider => shell,
}

exec {'owner_change':
  command  => 'sudo chown -R "$USER":"$USER" /etc/nginx'
  provider => shell,
}

exec {'Hello':
  command  => 'echo "Hello World!" | sudo tee /var/www/html/index.html',
  provider => shell,
}

exec {'sudo sed -i "48i \tlocation /redirect_me {\n\t\treturn 301 https://www.youtube.com/watch?v=dQw4w9WgXcQ permanent;\n\t}\n\n\terror_page 404 /404.html;\n\tlocation = /404.html {\n\t\troot /usr/share/nginx/html;\n\t\tinternal;\n\t}" /etc/nginx/sites-available/default':
  provider => shell,
}

exec {'nginx_restart':
  command  => 'sudo service nginx restart',
  provider => shell,
}