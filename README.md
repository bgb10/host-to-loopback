# Host to Loopback

Maps hostname to loopback address by adding line in /etc/hosts. Will block access to the website.

Written in shell script, works on Linux/Unix based OS(ubuntu, OSX, etc). Superuser priviledges needed.

```shell
# Usage: ./host_to_loopback.sh [-a(add)/-d(delete)] <URL>

sudo ./host_to_loopback.sh -a www.google.com
sudo ./host_to_loopback.sh -d www.google.com
```

```
##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
255.255.255.255 broadcasthost
::1             localhost
127.0.0.1       www.google.com # added!
```

If blocking not works well, please flush DNS cache of your OS. For example in MacOSX,

```shell
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;
```

**But some OSs are required to restart :)**
