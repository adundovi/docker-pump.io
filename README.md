######################

### pump.io http://pump.io Docker image - listens port 443

1) Install docker

2) Clone the repos
	```git clone https://github.com/adundovi/docker-pump.io```

3) Go inside folder pump.io

4) Copy pump.io.json.sample to pump.io.json and configure pump.io.json according to the needs
	```cp pump.io.json.sample pump.io.json```

5) Build the docker image using
	```docker builder -t adundovi/pump.io .```

6) Run docker
	```docker run --name pumpio -p 7775:443 -t adundovi/pump.io```
