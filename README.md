# Autoscaled load balancing

* Automatic container registration using [Consul](https://hub.docker.com/r/progrium/consul/) and [Registrator](https://hub.docker.com/r/gliderlabs/registrator/)
* Load balancing containers with [Haproxy](http://cbonte.github.io/haproxy-dconv/configuration-1.7.html) and [Consul-templates](https://github.com/hashicorp/consul-template)

## Install vagrant plugins

```bash
$ vagrant plugin install vagrant-docker-compose

$ vagrant plugin install vagrant-reload
```

## Usage

Create Vagrantfile similar to Vagrantfile inside `example` directory in the repository.

Create script similar to script inside `example` directory. Script installs Docker and Docker-compose.
Specify path to script that will be executed on guest machine.

```ruby
	config.vm.provision "shell", path: "~/script.sh"
```

Copy `consul_server` and `consul_worker` to consul_haproxy folder inside your home directory.

Sync consul_haproxy folder to the guest machine:

```ruby
	server.vm.synced_folder "~/consul_haproxy" , "/vagrant/consul_template"
```
To run server machine with docker-compose on `vagrant up`

```ruby
	server.vm.provision :docker
  	server.vm.provision :docker_compose, yml: "/vagrant/consul_template/consul_server/docker-compose.yml", rebuild: true, run: "always"
```

To run worker machine with docker-compose on `vagrant up`

```ruby
	server.vm.provision :docker
  	server.vm.provision :docker_compose, yml: "/vagrant/consul_template/consul_worker/docker-compose.yml", rebuild: true, run: "always"
```
