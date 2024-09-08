## Archives Space End-to-End Tests

#### How to install

Clone this repository on your machine, navigate to the root application folder, and run:

```
bundle install
```

### How to run the tests

#### Run on remote host
To run the tests on the `https://e2e.archivesspace.org`, run:
```
bundle exec cucumber
```

#### Run on localhost
To run the tests on localhost, you have to setup the application with:

```
docker compose -f docker-compose.yml up
```

Wait until everything is up and running.
You can check if the staff interface is running on `http://localhost:8080`.

Then, to run the tests, open another terminal, and run:
```
bundle exec cucumber HOST=localhost staff_features/
```

### Linters
```
bundle exec cuke_linter
```

```
bundle exec rubocop
```
