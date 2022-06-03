## Technical specification

The project is an API web application built using the Ruby on Rails framework. It uses the PostgreSQL database as the main data storage. The test coverage is provided with the help of RSpec framework, view templates are on Slim.

##SIDEKIQ##

##SHRINE##

## Usage

### Environment variables

| Key name                        | Description                                                                           |
|---------------------------------|---------------------------------------------------------------------------------------|
| `HOST`                          | the hostname of the application API (for example, _api.example.com_)                  |
| `APP_HOST`                      | the hostname of the application, available for users (for example, _app.example.com_) |
| `PORT`                          | the port of the application API server                                                |
| `DEVELOPMENT_DATABASE`          | the development database name                                                         |
| `DEVELOPMENT_DATABASE_USER`     | the development database username                                                     |
| `DEVELOPMENT_DATABASE_PASSWORD` | the development database password                                                     |
| `TEST_DATABASE`                 | the test database name                                                                |
| `TEST_DATABASE_USER`            | the test database username                                                            |
| `TEST_DATABASE_PASSWORD`        | the test database password                                                            |
| `PEPPER`                        | the key for encrypting user passwords in the database                                 |
| `SECRET_KEY_BASE`               | used for encrypting cookies                                                           |
| `JWT_SECRET_KEY`                | used for encrypting JWT tokens                                                        |
| `ENCRYPTION_SALT`               | the salt for encrypting user passwords in the database                                |
| `ROLLBAR_ACCESS_TOKEN`          | the access token for Rollbar                                                          |
| `SENDGRID_API_KEY`              | the API key of Sendgrid                                                               |
| `SENDGRID_EMAIL_FROM`           | the email address used in From field for outgoing emails                              |


## Development

### Code analyzer

The project uses **Rubocop** for static code analysis and **Slim-lint** for template linting. It can run either from command line as `rubocop` / `slim-lint`, or as pre-commit git hook (recommended). When running as a pre-commit hook it checks added or modified files for coding standard compliance, and if problem found cancels the commit.

To install git hook locally just launch the installation script:

```./script/install-git-hooks.sh```
