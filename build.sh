pushd /usr/share/logstash
sudo /usr/share/logstash/bin/logstash-plugin remove logstash-output-syslog
popd
sudo -u logstash gem build logstash-output-syslog.gemspec           
sudo -u logstash gem install logstash-output-syslog-3.0.5.gem
pushd /usr/share/logstash
sudo /usr/share/logstash/bin/logstash-plugin install /usr/src/logstash-output-syslog/logstash-output-syslog-3.0.5.gem
popd
sudo /usr/share/logstash/bin/logstash -f /etc/logstash/conf.d/access-test.conf --config.reload.automatic
