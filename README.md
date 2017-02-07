# docker\_credstash

_... for systems such as RancherOS or CoreOS -_
_use this container to emulate the credstash cmd line tool to manage secrets in aws_

See [more about credstash here] [1].

## docker tags

3 types 

* 'stable' - indicates the last built version that passed testing.

* timestamp format (the time docker image was built) e.g. opsgang/credstash:20170207223534

* x.y.z format credstash version e.g. opsgang/credstash:1.11.2

## installing

```bash
# ... replace /in/my/PATH below with somewhere in your $PATH
docker pull opsgang/credstash:stable # or use x.y.z version as required.
wget https://github.com/opsgang/docker_credstash/raw/master/.examples/credstash -O /in/my/PATH/credstash
chmod a+x /in/my/PATH/credstash
```

## running

```bash
# ... run like credstash cli
credstash --region us-east-1 --table my-table get MY_SECRET # ... or whatever else you need to do.
```

Note that the credstash cmd is running within a container, so there are caveats when it comes to
making AWS\_\* env vars available to the container if you need to run against a specific account.

See [README in .examples dir](https://github.com/opsgang/docker_credstash/tree/master/.examples)
for how to use $DOCKER\_OPTS to get around those caveats.

## building

**master branch built at shippable.com**

[![Run Status](https://api.shippable.com/projects/589a52e75512b90f00b71080/badge?branch=master)](https://app.shippable.com/projects/589a52e75512b90f00b71080)

```bash
git clone https://github.com/opsgang/docker_credstash.git
cd docker_credstash
git clone https://github.com/opsgang/alpine_build_scripts
./build.sh # adds custom labels to image
```
