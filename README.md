vagrant-node-server
===================

使用 [Vagrant](http://www.vagrantup.com/) 快速建立和配置 Node.js 開發環境。

Feature
-------

| VM name     | OS               | Environment     |
| ----------- | ---------------- | --------------- |
| node-server | Ubuntu 12.04 LTS | Node.js 0.10.22 |

Installation
------------

1. 下載安裝 [VirtualBox 4.2.18](https://www.virtualbox.org/wiki/Download_Old_Builds_4_2)
2. 下載安裝 [Vagrant 1.3.5](http://downloads.vagrantup.com/tags/v1.3.5)

Usage
-----

- 啟動 VM: `vagrant$ vagrant up`
- 關閉 VM: `vagrant$ vagrant halt`
- 操作 VM: `vagrant$ vagrant ssh [vm-name]`

> 第一次 `vagrant up` 因為需要安裝和設定環境，所以需要一點時間。

Example
-------

1. `vagrant$ vagrant up`
2. `vagrant$ vagrant ssh node-server`
3. `vagrant@node-server:~$ cd /vagrant_data/`
4. `vagrant@node-server:/vagrant_data$ npm install`
5. `vagrant@node-server:/vagrant_data$ node server.js`

出現 `Listening on port 3000` 表示成功啟動 Node.js server!

Configuration
-------------

編輯 `Vagrantfile`:

- 設定 VM hostname `node_server_config.vm.hostname = "node-server"`
- 設定 port `node_server_config.vm.network :forwarded_port, guest: 3000, host: 3000`
- 設定 VM 共享資料夾 `node_server_config.vm.synced_folder "../YOUR_NODE_PROJECT", "/vagrant_data"`
- 設定 CPU 和 memory `vb.customize ["modifyvm", :id, "--cpus", "1", "--memory", "256"]`
- 設定 Node.js 版本

```
node_server_config.vm.provision "shell" do |s|
	s.path = "nvm.sh"
    s.args = "0.10"
end
```

See Also
--------

- [Vagrant Documentation](http://docs.vagrantup.com/v2/)

Reference
---------

- [使用Vagrant練習環境佈署](http://gogojimmy.net/2013/05/26/vagrant-tutorial/)
- [A brief introduction to Vagrant](http://www.slideshare.net/ihower/vagrant-osdc)
- [用 Vagrant 快速建立開發環境](http://reality.hk/posts/2011/12/21/vagrant)