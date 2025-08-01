# IoT Device Simulator with Docker and macvlan

This project simulates multiple independent IoT devices running on an [Orange Pi Zero 2W](https://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Zero-2W.html), each with its own unique IP address on the local network using Docker's `macvlan` networking driver.  
**Note:** This setup currently only works with a wired (Ethernet) network connection.

## Features

- ✅ **Simulates multiple devices** from a single Orange Pi board  
- 🌐 **Each container gets a real IP address** on the physical LAN (not just bridge/NAT)
- 🐳 **Lightweight**: runs on Docker with minimal resource usage
- 🔧 **Customizable device behavior** via Python (`app.py`)
- 📦 Organized structure with Docker Compose

## Folder Structure

```
iot-simulator/
├── .env                  # Network and device IP settings
├── docker-compose.yml    # Multi-container setup
├── iot_device/           
│   ├── Dockerfile        # Container definition
│   ├── app.py            # Simulated device logic
│   └── templates/index.html  # Basic web UI
```

## Installation and Usage

1. Clone this repository on your Orange Pi Zero 2W (connected via ethernet):

```bash
git clone https://github.com/ander-yamamoto/iot-simulator.git
cd iot-simulator
```

2. Create the `.env` file to configure your network interface and IP addresses for the simulated devices:

```env
INTERFACE=eth0       # Your Orange Pi network interface
SUBNET=192.168.0.0/24          # Your local subnet
GATEWAY=192.168.0.1            # Your router gateway
DOCKER_NETWORK=macvlan_net      # Docker macvlan network name
IOT1_IP=192.168.0.201          # IP addresses assigned to simulated devices
IOT2_IP=192.168.0.202
IOT3_IP=192.168.0.203
```

3. Build and run the containers with Docker Compose:

```bash
docker compose up --build -d
```

Each container will simulate an independent IoT device accessible on the assigned IP address in your local network.

## Use Case

This setup is ideal for developers and testers who need to simulate multiple real IoT devices on a LAN for development, testing, or demonstration of applications such as:

- Smart home dashboards  
- SCADA and industrial control systems  
- Network monitoring tools  
- IoT gateway and broker development

---


