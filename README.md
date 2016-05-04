# Autoscaled load balancing

* Automatic container registration using [Consul](https://hub.docker.com/r/progrium/consul/) and [Registrator](https://hub.docker.com/r/gliderlabs/registrator/)
* Load balancing containers with [Haproxy](server.vm.provision :docker) and [Consul-templates](https://github.com/hashicorp/consul-template)

## Install vagrant plugins

```bash
$ vagrant plugin install vagrant-docker-compose

$ vagrant plugin install vagrant-reload
```

## Usage

Create Vagrantfile similar to Vagrantfile in `example` directory in the repository.

Copy `consul_server` and `consul_worker` to consul_haproxy folder inside zour home directory.

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
