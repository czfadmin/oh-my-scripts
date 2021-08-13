$mongoFileName= "mongodb-linux-x86_64-ubuntu2004-4.4.3.tgz"
$mongo_url= "https://fastdl.mongodb.org/linux/$mongoFileName"
cd ~/ && wget $mongo_url
tar -zxvf  $mongoFileName
sudo cp $mongoFileName/bin/* /usr/local/bin
sudo mkdir -p /var/lib/mongo
sudo chown `whoami` /var/lib/mongo     # Or substitute another user
sudo chown `whoami` /var/log/mongodb   # Or substitute another user

# start mongo
# mongod --dbpath /var/lib/mongo --logpath /var/log/mongodb/mongod.log --fork