# 0x09. Web infrastructure design

# Task 0:  Simple web stack
![Task 0 Diagram](https://raw.githubusercontent.com/Abdalmohsen-H/alx-system_engineering-devops/master/0x09-web_infrastructure_design/task0.png)

## Specifics about this infrastructure:
DNS’s role is to translate the record of a domain name into an IP address
server : is generally located in a data center
, Also server can be physical or virtual, It runs lunix os and the server is communicating over a network (TCP/IP)
web server’s role is to serve web pages (static content)
application server’s role is to compute dynamic content
database’s role is to store application data


## Single point of failure 
server is a single point of failure because nothing is redundant and There are multiple SPOF (Single Point Of Failure) in this infrastructure, like database.
# Downtime when maintenance needed
website would be temporarily down when new code is deployed and the web server needs to be restarted
## Scalability
this infrastructure cannot scale and will not be able to handle traffic that would exceed the server capacity

# task 1 : 1-distributed_web_infrastructure

![https://raw.githubusercontent.com/Abdalmohsen-H/alx-system_engineering-devops/master/0x09-web_infrastructure_design/task1.png]

## Specifics about this infrastructure:
- Haproxy load balancer is configured to default Round Robin which is active-active, Requests are distributed sequentially to each server in rotation, It ensures an even distribution of traffic among servers.

- MySQL Master-Replica cluster used replication to keep data synchronized, Master act as the Primary server performing could handle read/write operations. and the other server to act as a Replica for read operations only and provide data redundancy.
## Cons. of this infrastructure:
-The load balancer is still a single point of failure
-There is no firewall on servers
-Traffic is unencrypted
- No monitoring