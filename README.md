docker compose build --no-cache

docker compose run app bundle exec rails db:prepare

docker compose up app
