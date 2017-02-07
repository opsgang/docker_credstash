# vim: et sr sw=4 ts=4 smartindent syntax=dockerfile:
FROM gliderlabs/alpine:3.4

MAINTAINER jinal--shah <jnshah@gmail.com>
LABEL \
      name="opsgang/credstash" \
      vendor="sortuniq"        \
      description="... alias docker-run to 'credstash' and run like the binary -\
Discover more about credstash at https://github.com/fugue/credstash"

COPY alpine_build_scripts /alpine_build_scripts

RUN sh /alpine_build_scripts/install_credstash.sh \
    && rm -rf /var/cache/apk/* /alpine_build_scripts 2>/dev/null

CMD ["credstash"]
ENTRYPOINT ["credstash"]

# built with additional labels:
#
# version
# opsgang.credstash_version
#
# opsgang.build_git_uri
# opsgang.build_git_sha
# opsgang.build_git_branch
# opsgang.build_git_tag
# opsgang.built_by
#
