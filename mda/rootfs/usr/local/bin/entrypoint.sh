#!/bin/sh
dockerize \
  -template /etc/dovecot/conf.d/10-master.conf.templ:/etc/dovecot/conf.d/10-master.conf \
  -template /etc/dovecot/conf.d/15-lda.conf.templ:/etc/dovecot/conf.d/15-lda.conf \
  -template /etc/dovecot/dovecot-sql.conf.ext.templ:/etc/dovecot/dovecot-sql.conf.ext \
  -wait tcp://${MYSQL_HOST}:3306 \
  -wait file://${SSL_CERT} \
  -wait file://${SSL_KEY} \
  -timeout ${WAITSTART_TIMEOUT} \
  /usr/sbin/dovecot -F
