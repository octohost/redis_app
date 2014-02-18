FROM octohost/ruby-1.9
ADD . /srv/www
RUN cd /srv/www; bundle install --deployment --without test development
# LINK_SERVICE redis
EXPOSE 5000
CMD ["/usr/local/bin/foreman","start","-d","/srv/www"]
