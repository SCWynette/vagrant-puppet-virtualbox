Vagrant.configure("2") do |config|

  # Defining puppet vm using virtualbox
  config.vm.define "puppet" do |puppet|

    # Vagrant box from bento project
    puppet.vm.box = "bento/centos-7"

    # Configure vm specification for puppet
    puppet.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--ioapic", "on"]
      vb.linked_clone = true
      vb.memory = "4096"
      vb.cpus = "2"
    end

    # Configure private network using 192.168.33.0/24 subnet
    puppet.vm.network "private_network", ip: "192.168.33.10"

    # Changing puppet vm hostname with domain
    puppet.vm.hostname = "puppet.example.com"

    # This will disable the default vagrant share in the vm
    puppet.vm.synced_folder ".", "/vagrant", disabled: true

    # Used during provisioning and caching files
    puppet.vm.synced_folder "cached/", "/cached"

    # Share control-repo folder to symlink later
    puppet.vm.synced_folder "puppet/", "/puppet"

    # Configure vm and install the puppetserver package
    puppet.vm.provision :shell, :path => "bootstrap.sh"

    # Always run the command below at start up
    puppet.vm.provision :shell, run: "always",
      # Updating all modules on the puppet master by using g10k
      inline: "cd /puppet && /root/bin/g10k -puppetfile -quiet"
  end

  # Defining node01 vm using virtualbox
  config.vm.define "node01" do |node01|

    # Vagrant box from bento project
    node01.vm.box = "bento/centos-7"

    # Configure vm specification for node01
    node01.vm.provider "virtualbox" do |vb|
      vb.linked_clone = true
      vb.memory = "1024"
      vb.cpus = "1"
    end

    # Configure private network using 192.168.33.0/24 subnet
    node01.vm.network "private_network", ip: "192.168.33.20"

    # Changing node01 vm hostname with domain
    node01.vm.hostname = "node01.example.com"

    # This will disable the default vagrant share in the vm
    node01.vm.synced_folder ".", "/vagrant", disabled: true

    # Used for caching files during provisioning
    node01.vm.synced_folder "cached/", "/cached"

    # Configure vm and install the puppet-agent package
    node01.vm.provision :shell, :path => "puppetize.sh"

    # Automatically purge the node from puppet
    node01.trigger.after :destroy do |trigger|
      trigger.warn = "Purging node01 from Puppet"
      trigger.run = {inline: "vagrant ssh puppet -- 'sudo /opt/puppetlabs/bin/puppet node purge node01.example.com'" }
      trigger.on_error = :continue
    end
  end
end
