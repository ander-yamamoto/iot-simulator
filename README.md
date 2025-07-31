# iot-simulator




.env file
```bash
# inteface name: eth0, wlan0, etc.
INTERFACE=eth0

# your network addresses, example for router ip 192.168.0.1
SUBNET=192.168.0.0/24
GATEWAY=192.168.0.1
DOCKER_NETWORK=macvlan_net

# use ap available on you network.
# check addresses to not overlap with the ones already taken.
IOT1_IP=192.168.0.101
IOT2_IP=192.168.0.102
IOT3_IP=192.168.0.103

```