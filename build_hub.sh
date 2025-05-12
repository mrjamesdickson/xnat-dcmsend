python3 ./command2label.py command.json >> Dockerfile
docker build -t xnatworks/xnat-dcmsend:1.1.0 .
docker push xnatworks/xnat-dcmsend:1.1.0
