# task 2 : 2-secured_and_monitored_web_infrastructure

![task1](https://raw.githubusercontent.com/Abdalmohsen-H/alx-system_engineering-devops/master/0x09-web_infrastructure_design/task2.png)
## Specifics about this infrastructure:
- Haproxy load balancer is configured to default Round Robin which is active-active, Requests are distributed sequentially to each server in rotation, It ensures an even distribution of traffic among servers.

- MySQL Master-Replica cluster used replication to keep data synchronized, Master act as the Primary server performing could handle read/write operations. and the other server to act as a Replica for read operations only and provide data redundancy.

- HTTPS is setup so that if someone intercepts the traffic, it cannot be read


-Configure monitoring to:

collect web server data
have an alert triggered if QPS is getting out of control

-
## Cons. of this infrastructure:
-The load balancer is still a single point of failure

-Terminating SSL at the load balancer level is an issue because the traffic between the load balancer and the web servers is unencrypted


