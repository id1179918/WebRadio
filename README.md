# WebRadio

Description:
- webpage with music streaming
- web server hosted on a raspberry pi 5

# Steps

## WEB
- webpage accessible from localhost ✅
- webpage accesible from remote device on local network ✅
- Fetch musical reference
- Stream music on webpage

## SERVER
- GET/POST actions
- Define musical referencing model

## Deploy / Execute
To run the app in development mode on localhost, do the following:
```
flutter run -d web-server
```
To run the apllication in  mode on local network, do the following:
```
flutter run -d web-server --web-hostname <your_ip> --web-port <your_port>
```