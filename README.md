# Project README

## Prerequisites

- **Docker**: Ensure Docker is installed and running on your machine.
- **curl**: Command-line tool for making HTTP requests.
- **jq**: Command-line JSON processor.
- Any web browser(to access through the swagger api)

## Setup instructions

### Build the Docker Image

```bash
docker compose build --no-cache
```

### Prepare the Database(development)

```bash
docker compose run app bundle exec rails db:prepare
```

### Prepare the Database(tests)
```bash
docker compose run tests bundle exec rails db:prepare
```

### Start the Application

```bash
docker compose up app
```

## Running tests

```bash
docker compose run tests
```

## API Documentation

You can use tools like **curl** or **Postman** to interact with the API, or you can access the Swagger documentation at http://localhost:3000/api-docs.

## API Examples

Below are some example curl commands to interact with the API. All responses are piped through jq for pretty-printing.

**<i>Remember to always replace the ids and the data of the requests<i/>**

### Required Topics

#### Create a New Role

To create a new role, use the following command

```bash
curl -X POST 'http://localhost:3000/roles' \
--header 'Content-Type: application/json' \
--data-raw '{
  "role": {
    "name": "QA",
    "description": "Helps the team to reach the goal removing all the problems in the way"
  }
}' | jq .
```

#### Assign a Role to a Team Member

To assign a role to a team member, use the following command

```bash
curl -X POST 'http://localhost:3000/memberships' \
--header 'Content-Type: application/json' \
--data-raw '{
  "team_id": "06b6ecd6-7259-490e-8260-d06376dcf60c",
  "user_id": "29351ff9-ec29-47cc-95dc-f5b2be642bfb",
  "role_id": "53b71a16-5512-4bdb-a329-75e7bacedd3d"
}' | jq .
```

#### Look Up Memberships for a Role

To look up all memberships associated with a specific role, use the following command

```bash
curl -X GET 'http://localhost:3000/role_memberships/1046b83a-f136-4487-a4b1-b1c91bee0502' --header "Accept: application/json" | jq .
```

#### Look Up a Role for a Membership

To look up the role for a specific membership, use the following command

```bash
curl -X GET 'http://localhost:3000/users/29351ff9-ec29-47cc-95dc-f5b2be642bfb' --header "Accept: application/json" | jq .
```

### Additional API Examples

#### Get All Teams

```bash
curl -X GET 'http://localhost:3000/teams' --header "Accept: application/json" | jq .
```

#### Get a Specific Team

This request brings the team lead, users and its roles in the team

```bash
curl -X GET 'http://localhost:3000/teams/06b6ecd6-7259-490e-8260-d06376dcf60c' --header "Accept: application/json" | jq .
```

#### Get All users

This request brings the users data and all their roles in the company

```bash
curl -X GET 'http://localhost:3000/users' --header "Accept: application/json" | jq .
```

#### Get the user

```bash
curl -X GET 'http://localhost:3000/users/29351ff9-ec29-47cc-95dc-f5b2be642bfb' --header "Accept: application/json" | jq .
```

#### Get All registered roles

```bash
curl -X GET 'http://localhost:3000/roles' --header "Accept: application/json" | jq .
```

#### Get data from a specific role

```bash
curl -X GET 'http://localhost:3000/roles/3b4dc77f-7114-4581-870f-d686ec97fc30' --header "Accept: application/json" | jq .
```
