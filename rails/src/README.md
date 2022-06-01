## Technical specification

The project is an API web application built using the Ruby on Rails framework. It uses the PostgreSQL database as the main data storage. The test coverage is provided with the help of RSpec framework, view templates are on Slim.

### Job processing

##SHRINE##


## Usage

### Environment variables

- `HOST`
- `APP_HOST`
- `PORT`
- `DEVELOPMENT_DATABASE`
- `DEVELOPMENT_DATABASE_USER`
- `DEVELOPMENT_DATABASE_PASSWORD`
- `TEST_DATABASE`
- `TEST_DATABASE_USER`
- `TEST_DATABASE_PASSWORD`

- `PEPPER`
- `SECRET_KEY_BASE`
- `JWT_SECRET_KEY`
- `ENCRYPTION_SALT`

- `ROLLBAR_ACCESS_TOKEN`
- `SENDGRID_API_KEY`
- `SENDGRID_EMAIL_FROM`



## Development

### Code analyzer

The project uses **Rubocop** for static code analysis and **Slim-lint** for template linting. It can run either from command line as `rubocop` / `slim-lint`, or as pre-commit git hook (recommended). When running as a pre-commit hook it checks added or modified files for coding standard compliance, and if problem found cancels the commit.

To install git hook locally just launch the installation script:

```./script/install-git-hooks.sh```
