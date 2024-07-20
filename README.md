prerequisite

- docker
- curl
- jq

docker compose build --no-cache

docker compose run app bundle exec rails db:prepare

docker compose up app


GET Teams
curl -X GET 'http://localhost:3000/teams' --header "Accept: application/json" | jq .

GET TEAM
curl -X GET 'http://localhost:3000/teams/bb6eca09-a203-4621-b94d-8d9f163d0d55' --header "Accept: application/json" | jq .

GET Users
curl -X GET 'http://localhost:3000/users' --header "Accept: application/json" | jq .

GET User
curl -X GET 'http://localhost:3000/users/dcacc83e-a774-477e-a689-4fd8b10b0eed' --header "Accept: application/json" | jq .


TODOS:
- Each team has one user as a team lead;
- Developer should be the default role.