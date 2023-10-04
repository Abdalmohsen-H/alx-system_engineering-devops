# 0x0E-web_stack_debugging_1
you will get Ubuntu container that have Nginx installed and configured, Using debugging skills, find why Ubuntu container’s Nginx installation fail to listen on port 80.
Then, write a Bash script with the minimum number of commands to automate your fix.

Problem to fix
root@966caff:/# curl 0:80
curl: (7) Failed to connect to 0 port 80: Connection refused


solution :
conflict due to /etc/nginx/sites-enabled have another conflicting config file , Because this config file is isn't a symbol like (isn't sym linked) to the default config inside /etc/nginx/sites-available/default
do this symbol link using  (ln -f -s ) and check the config file inside sites-available if any misconfiguration (here there wasn't ),
then (service nginx restart)

# useful commands I have used to debug:
	service nginx status
	sudo netstat -tuln | grep ':80'
	nginx -t
	service nginx restart
	ln -s -f path/of/source/file path/to/destination/directory
