# Janction's layer 1 node

After cloning this repo, create the image:

```
git clone https://github.com/acostarodrigo/layer1DevDocker.git layer1Node
cd layer1Node
docker build -t layer1_node .
```

and execute it with privileges:

```
docker run --rm -it --privileged -v /var/run/docker.sock:/var/run/docker.sock -v root/.janctiond/renders:/root/.janctiond/renders layer1_node bash

```