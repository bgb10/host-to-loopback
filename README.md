# Host to Loopback

Maps hostname to loopback address by modifying /etc/hosts, which blocks outbound traffic.
Written in Bash shell script, works on Linux/Unix based OS(ubuntu, OSX, etc).

```shell
# Usage: ./host_to_loopback.sh [-a(add)/-d(delete)] <URL>

./host_to_loopback.sh -a www.google.com
./host_to_loopback.sh -d www.google.com
```
