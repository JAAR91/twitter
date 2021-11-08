sudo service postgresql start
sudo -u postgres createdb twitterdb
sudo -u postgres createdb twitterdbtest
rails db:migrate