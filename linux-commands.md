# Windows shortcuts
## Desktops shortcuts
### Switch Desktops:
`Ctrl + Win + L/R Arrows`
# Docker
## Qdrant
### Snapshots
Generate
```
curl -X POST "http://localhost:6333/collections/law_fragments/snapshots" -H "Content-Type: multipart/form-data" -F "snapshot=@./law_fragments20250301.snapshot"
```
Retrieve
```
curl -X GET "http://localhost:6333/collections/law_fragments/snapshots/law_fragments-4479057213279147-2025-03-11-20-26-29.snapshot" -H "Content-Type: multipart/form-data" --output "nice_jones20250311.tar"
```
Recover
```
curl -X POST "http://localhost:6333/collections/law_fragments/snapshots/upload" -H "Content-Type: multipart/form-data" -F "snapshot=@./law_fragments20250301.snapshot"
```
# PostgreSQL
## Installation
Install postgres on linux: follow instructions at `https://gist.github.com/ammarshah/40535b7e6c76597bda58afece875b7e6`
## Create database
```
sudo -u postgres psql
postgres=# create database mydb;
postgres=# create user myuser with encrypted password 'mypass';
postgres=# grant all privileges on database mydb to myuser;
```
## Migrations
Add
```
```
Apply
```
```

## Backups
Generate
```
pg_dump -h localhost -U postgres -d LegePeDos -F t -f ~/postgres_<currentdate>.tar
```
It will ask for password, so have it!

Replace data
```
pg_restore -h localhost -U postgres -d LegePeDos -F t ~/Downloads/postgres_<currentdate>.tar
```
# SSH
## Make ssh connection
### Generate
```
ssh-keygen -t rsa -b 4096 -C "user-description@machine-description" -f "filenames"
```
### Authorize
Put the .pub key in the `authorized_keys` file in:
1. `cd ~/.ssh` directory - for root access.
2. `cd /home/legalbuddy-admin/.ssh` directory - for account-based access.
## SCP
Copy to VM
```
scp -o ProxyJump=azureuser@20.90.145.114 law_fragments20250301.snapshot azureuser@10.0.0.6:/home/azureuser/docker-images
```
Copy from VM
```
scp -o ProxyJump=azureuser@20.90.145.114 azureuser@10.0.0.6:/home/azureuser/docker-images/law_fragments20250301.snapshot ./
```
