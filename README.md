prerequisite

- docker
- curl
- jq

docker compose build --no-cache

docker compose run app bundle exec rails db:prepare

docker compose up app

run the tests

docker compose run tests

You can use a tool as curl or postman or even run the server and access the url http://localhost:3000/api-docs to use the rswag documentation

see the curl examples below

GET Teams
curl -X GET 'http://localhost:3000/teams' --header "Accept: application/json" | jq .

GET TEAM
curl -X GET 'http://localhost:3000/teams/bb6eca09-a203-4621-b94d-8d9f163d0d55' --header "Accept: application/json" | jq .

GET Users
curl -X GET 'http://localhost:3000/users' --header "Accept: application/json" | jq .

GET User
curl -X GET 'http://localhost:3000/users/dcacc83e-a774-477e-a689-4fd8b10b0eed' --header "Accept: application/json" | jq .

GET Roles
curl -X GET 'http://localhost:3000/roles' --header "Accept: application/json" | jq .

GET Role
curl -X GET 'http://localhost:3000/roles/3b4dc77f-7114-4581-870f-d686ec97fc30' --header "Accept: application/json" | jq .

POST Role
curl -X POST 'http://localhost:3000/roles' \
--header 'Content-Type: application/json' \
--data-raw '{
  "role": {
    "name": "QA",
    "description": "Helps the team to reach the goal removing all the problems in the way"
  }
}' | jq .



TODOS:
- Developer should be the default role.

- Gems to add
- shouldamatchers
