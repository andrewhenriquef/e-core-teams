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
docker compose run tests bundle exec rails db:create db:migrate
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

**Remember to always replace the ids and the data of the requests**

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

## Explanation of Solution

To address the required tasks for the new Roles service, I structured the solution by organizing the API endpoints using curl examples into clearly defined sections. Here's how I reached the solution:

1. **Reading the Documentation**: I started by carefully reviewing all the provided documentation to understand the requirements thoroughly.

2. **Creating a Draft**: Based on my understanding, I created a draft outlining all the required tables and data structures. This included defining the User, Team, Role, and Membership models and their relationships.

3. **Building Initial Endpoints**: With the draft in place, I began creating the initial endpoints to retrieve the required data. This step involved setting up the necessary routes, controllers, and actions to handle the basic CRUD operations for roles and memberships.

4. **Testing and Adding Functionality**: After setting up the initial endpoints, I started testing them using curl and Postman to ensure they worked as expected. During this phase, I incrementally added more functionality, such as:
- **Presenters**: Implementing presenters to format the data before sending it in the API response.
Used Gems: Integrating useful gems to enhance the application's functionality, like rswag for API documentation and factory_bot for test data setup.
- **Setting Up Prerequisites**: I listed the prerequisites for running the project, including Docker, curl, and jq, ensuring that anyone following the instructions can set up the environment correctly.

5. **Organizing Setup Instructions**: I provided clear and concise setup instructions for building the Docker image, preparing the database, and starting the application, facilitating an efficient project setup.

6. **API Documentation**: I highlighted how to access the API documentation using Swagger, providing an interactive way to explore and test the API endpoints.

7. **Structuring Curl Examples**: I organized the curl examples into specific sections corresponding to the required tasks: