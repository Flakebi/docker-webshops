FROM systemsector/seotoaster:v241

Copy application.ini /var/www/seotoaster_core/application/configs/application.ini

Expose 80
CMD /usr/local/bin/start.sh; /bin/bash -c "trap : TERM INT; sleep infinity & wait"
