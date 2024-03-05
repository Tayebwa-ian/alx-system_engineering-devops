# Script to install nginx using puppet
exec {'install_update':
  command  => 'sudo apt-get -y update ; sudo apt-get -y install nginx',
  provider => shell,

}

package {'nginx':
  ensure  => 'present',
  require => Exec['install_update'],
}

exec {'change_owner':
  command  => 'sudo chown -R "$USER":"$USER" /var/www/',
  provider => shell,
}

exec {'owner_change':
  command  => 'sudo chown -R "$USER":"$USER" /etc/nginx',
  provider => shell,
}

exec {'Hello':
  command  => 'echo "Hello World!" | sudo tee /var/www/html/index.html',
  provider => shell,
  require  => Exec['change_owner'],
}

exec {'404_message':
  command  => 'echo "Ceci n\'est pas une page" | sudo tee /usr/share/nginx/html/404.html',
  provider => shell,
}

exec {'configure':
  command  => 'sudo sed -i "48i\\	location /redirect_me {\n\t\treturn 301 https://www.youtube.com/watch?v=dQw4w9WgXcQ;\n\t}\n\n\terror_page 404 /404.html;\n\tlocation = /404.html {\n\t\troot /usr/share/nginx/html;\n\t\tinternal;\n\t}\n" /etc/nginx/sites-available/default',
  provider => shell,
  require  => Exec['owner_change'],
}

exec {'response_header':
  command  => 'sed -i "/\t\t# First attempt/ i\\\n\t\t# add a custom response header\n\t\tadd_header X-Served-By 475467-web-02;\n" /etc/nginx/sites-available/default',
  provider => shell,
  require  => Exec['configure']
}

exec {'nginx_restart':
  command  => 'sudo service nginx restart',
  provider => shell,
  require  => Exec['response_header'],
}