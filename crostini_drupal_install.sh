# Mariadb config
# sudo mysql -u root -p #Need to automate this as well
# CREATE DATABASE drupaldb;
# GRANT ALL PRIVILEGES on drupaldb.* to 'drupal'@'localhost' identified by 'w$09234lkjnzo';
# FLUSH PRIVILEGES;
# \q


# Drupal install
curl -L https://www.drupal.org/download-latest/tar.gz > ~/Downloads/drupal.tar.gz
tar xzf ~/Downloads/drupal.tar.gz
sudo mv ~/Downloads/drupal-8.7.7/ /var/www/html/drupal
sudo chmod -R 755 /var/www/html/*
sudo chown -R www-data:www-data /var/www/html/*
sudo a2enmod rewrite
sudo a2enmod env
sudo a2enmod dir
sudo a2enmod mime
curl -L https://raw.githubusercontent.com/crosfan/drupal/master/000-default.conf > ~/Downloads/000-default.conf
sudo cp /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf.orig
sudo mv ~/Downloads/000-default.conf /etc/apache2/sites-enabled/000-default.conf
# check if security correct on this file
sudo systemctl restart apache2
x-www-browser http://penguin.linux.test/drupal


