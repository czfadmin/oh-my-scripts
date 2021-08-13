# fetch git package
#!/usr/bin/zsh
# check_cmd_success() {
# 	if [ $? -eq 0 ]; then
# 		echo "$(!!) failed"
# 		exit 1
# 	fi
# }
$loguser= whoami
$gitFileName=git-2.9.5.tar.gz
cd ~ && wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.9.5.tar.gz
sudo su
cp $gitFileName /usr/local/src
cd /usr/local/src && sudo tar -xvf $gitFileName
yum remove -y git
# install dependence
yum install yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel asciidoc
yum install perl-ExtUtils-MakeMaker package
# build and install
make prefix=/usr/local/git all
if [ $? -eq 1 ]; then
	echo "make prefix=/usr/local/git all: failed\n\a"
	exit 1
fi
make prefix=/usr/local/git install
if [ $? -eq 1 ]; then
	echo "make prefix=/usr/local/git install: failed\n\a"
	exit 1
fi

echo "export PATH=$PATH:/usr/local/git/bin" >>/etc/profile
echo "export PATH=$PATH:/usr/local/git/bin" >>~/.zshrc
source /etc/profile
source ~/.zshrc
echo "End! Success Install:$(git--version)"
su whoami
echo "export PATH=$PATH:/usr/local/git/bin" >>~/.zshrc
source ~/.zshrc
exit 0
