FROM spreecommerce/spree:latest

RUN sed -i "s/gem 'rack-mini-profiler'/#gem 'rack-mini-profiler'" /spree/sandbox/Gemfile

ENTRYPOINT []

CMD rm -f /spree/sandbox/tmp/pids/server.pid && sh docker-entrypoint.sh
