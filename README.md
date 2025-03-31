# Janction's layer 1 node

After cloning this repo, create the image:

```
git clone https://github.com/acostarodrigo/layer1DevDocker.git layer1Node
cd layer1Node
docker build -t layer1_node .
```

and execute it with privileges:

```
docker run --rm -it \
  --privileged \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /root/.janctiond/renders:/root/.janctiond/renders \
  layer1_node bash
```

Right now, the following lines are commented  at file `entryporint.sh` because the command doesn't executes correctly. For example, the mySQL database used to keep track of video rendering status is not created.

So it is better to execute them manually until is fixed:

```
# compiles and installs the layer 1 node
make install

# configures the node to be a video rendering node
make init

# joins the node to the current testnet
make testnet-add
```