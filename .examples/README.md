[1]: https://github.com/fugue/credstash "Credstash - store and retrieve secrets in aws"
# credstash

_... a replacement for credstash binary, using docker opsgang/credstash:stable ..._

    Particularly useful for locked down OS on which you can't install
    python, pip, credstash etc ... e.g. RancherOS or CoreOS

Replaces credstash cmd line tool: invokes the credstash:stable image under the hood
to provide the same functionality.

## USAGE

Copy file to anywhere in your $PATH and make executable:

```bash
wget https://github.com/opsgang/docker_credstash/raw/master/.examples/credstash -O /in/my/PATH/credstash
chmod a+x /in/my/PATH/credstash
```

Now run like [credstash][1]

        credstash -t my-table put -k alias/cmk-in-kms SECRET $my_secret_value

If running on an ec2 instance with an iam profile, the container will automatically
have the same aws policies. If you need to interact with aws api as a different user
or with different rights, see below about $DOCKER\_OPTS.

## DOCKER\_OPTS

You must set $DOCKER\_OPTS first if you want to use any env vars:


### EXAMPLE: USING AWS\_ ENV VARS

    Credstash will read and honour certain AWS env vars set in the shell in which
    the command is invoked, such as those to set region or aws credentials.

    This replacement runs a docker container with its own environment. It does not
    have access to your shell's vars by default.

```bash
# ... pass the AWS_ vars I've got set in my current shell
export DOCKER_OPTS="
    --env AWS_SECRET_ACCESS_KEY
    --env AWS_ACCESS_KEY_ID
    --env AWS_DEFAULT_REGION=eu-west-2
"
credstash -t my-table get MY_SECRET # get decrypted value of MY_SECRET key from dynamodb my-table
```

