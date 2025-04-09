# Janction's layer 1 node

After cloning this repo, create the image:

```
git clone https://github.com/acostarodrigo/layer1DevDocker.git layer1Node
cd layer1Node
docker build -t layer1_node .
```

and execute it with privileges:

```
docker run -it \
  --privileged \
  -v /var/run/docker.sock:/var/run/docker.sock \
  layer1_node bash
```
