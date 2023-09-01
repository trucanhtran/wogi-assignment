## How to run

### Step1:

`docker-compose build` #build docker-compose

### Step2:

`docker-compose run web bundle` #install Rails

### Step3:

`docker-compose run web rails db:create` #Generate database

### Step4:

`docker-compose run web rails db:migrate` #Run migration to create tables and columns

### Step5:

`docker-compose run wesb rails db:seed` #Create seed for users

### Step6:

`docker-compose up` #Run container to run website

### Step7:

`localhost:3000`

## How to run test

### Step1:

`docker compose run web rails db:migrate RAILS_ENV=test` #Generate database for test env

### Step2:

`docker-compose run web rspec` #Run Rspec to test API
