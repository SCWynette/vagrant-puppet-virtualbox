# Global variables
PE_VERSION=2019.8.10
OS_VERSION=el-7
PP_TARBALL=puppet-enterprise-${PE_VERSION}-${OS_VERSION}-x86_64
PUPPET_URL=https://s3.amazonaws.com/pe-builds/released/${PE_VERSION}/${PP_TARBALL}.tar.gz

# Changes default directory used by yum for caching
sed -i 's|var/cache|cached/.vcache|g' /etc/yum.conf

# Configure yum for caching any downloaded package
sed -i 's|keepcache=0|keepcache=1|g' /etc/yum.conf

# Check cache for puppet tarball and downloadsif missing
if [ ! -f "/cached/.vcache/${PP_TARBALL}.tar.gz" ]; then
  cd /cached/.vcache && curl -JLO ${PUPPET_URL}
fi

# Extract the downloaded puppet enterprise tarball in /root
tar zxf /cached/.vcache/${PP_TARBALL}.tar.gz --directory ~/

# Configuring firewall...
systemctl start firewalld
systemctl enable firewalld
firewall-cmd --zone=public --add-port=22/tcp --permanent
firewall-cmd --zone=public --add-port=443/tcp --permanent
firewall-cmd --zone=public --add-port=4433/tcp --permanent
firewall-cmd --zone=public --add-port=5432/tcp --permanent
firewall-cmd --zone=public --add-port=8081/tcp --permanent
firewall-cmd --zone=public --add-port=8140/tcp --permanent
firewall-cmd --zone=public --add-port=8142/tcp --permanent
firewall-cmd --zone=public --add-port=8143/tcp --permanent
firewall-cmd --zone=public --add-port=8170/tcp --permanent
firewall-cmd --reload

# Setting system locale
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Starting install
cd ~/${PP_TARBALL}
./puppet-enterprise-installer -c /cached/pe.conf

# Configure hosts file
cat > /etc/hosts <<EOF
127.0.0.1       localhost
192.168.33.10   puppet.example.com puppet
192.168.33.20   node01.example.com node01
EOF

# Configures autosigning of certificate requests
cat > /etc/puppetlabs/puppet/autosign.conf <<EOF
*.example.com
EOF

# Setup PATH to access puppet command
source /etc/profile.d/puppet-agent.sh

# Startup script to add an additional directory to PATH
cat > /etc/profile.d/vagrant-puppet-enterprise.sh <<EOF
export PATH=$PATH:/opt/puppetlabs/puppet/bin
EOF

# Running agent
puppet agent -t
puppet agent -t

# Deletes default environment ready for synced_folder
rm -rf /etc/puppetlabs/code/environments/production/*

# Workaround to vagrant not mounting shares post-provisioning
ln -s /puppet/* /etc/puppetlabs/code/environments/production/

# Retrieves the latest release tagged in the GitHub repo and then modifies the output to be stored in a variable
tag_name=$(curl -ks https://api.github.com/repos/xorpaul/g10k/releases/latest | grep tag_name | cut -d '"' -f 4)

# Sets working directory and downloads latest g10k release using curl and the tag_name that was retrieved earlier
cd /root && curl -JLO https://github.com/xorpaul/g10k/releases/download/$tag_name/g10k-linux-amd64.zip --insecure

# Install pre-requisites
yum install git unzip -y

# Extract downloaded g10k zip file in root
unzip -q /root/g10k-linux-amd64.zip -d bin
