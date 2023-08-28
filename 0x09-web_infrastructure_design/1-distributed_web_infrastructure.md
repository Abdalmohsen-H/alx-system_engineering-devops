# task 1 : 1-distributed_web_infrastructure

![task1](https://raw.githubusercontent.com/Abdalmohsen-H/alx-system_engineering-devops/master/0x09-web_infrastructure_design/task1.png)
## Specifics about this infrastructure:
- Haproxy load balancer is configured to default Round Robin which is active-active, Requests are distributed sequentially to each server in rotation, It ensures an even distribution of traffic among servers.

- MySQL Master-Replica cluster used replication to keep data synchronized, Master act as the Primary server performing could handle read/write operations. and the other server to act as a Replica for read operations only and provide data redundancy.
## Cons. of this infrastructure:
-The load balancer is still a single point of failure
-There is no firewall on servers
-Traffic is unencrypted
-No monitoring
