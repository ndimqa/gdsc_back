# ReVita Backend Part of the App
___
It is the App for solving is the process of rehabilitation after organ 
transplantation.

# About
___
* This is the Backend Part of the App, which includes GraphQL API, for quicker 
and better requests.
* In this repo you can find docker file for the database.
# Usage
___
1. Ensure you have installed golang and postgresql (https://go.dev/dl/, https://www.postgresql.org/download/)
2. Git clone the project into the directory of your choosing.
```
git clone https://github.com/ndimqa/gdsc_back.git 
```
3. Enter to your repo
4. Now we need to compile packages and dependecies
```
go build
```
4. After that start Docker
```
docker compose up -d
``` 
5. Now you can start the App
```
go run server.go 
```
