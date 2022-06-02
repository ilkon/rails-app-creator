# Rails App Creator

This template serves as the base for every Rails project.

## Usage

Run `create PROJECT_PATH` and it will generate a Rails project with all of our common gems and configurations.

## Technical implementation

1. The script runs a regular `rails new` command, using some pre-configurations from `.rails.rc` config-file and `template.rb` template. Then it adds / overwrites the app files with the files from `rails/src` folder.


2. After that the script asks the user about desired app configuration, such as:

   - to use UUIDs for primary keys
   - to use `rails-app-generator` gem as a generator for models/migrations
   - to use `shrine` gem for file uploads
   - etc.

    In case of positive answer script adds files from `src` subfolder of corresponding option, and use files from subfolder `subs` for substituting params in the app config files.


3. Next, the script installs `rubocop` gem and runs it with auto-correcting option, to fix all the offences.


4. Finally, it initializes the local git repository, installs pre-commit hook and exits.

> **Note**: the command `bundle install` is not a part of this script, because of:
>
> - it may fail if some packages are not installed in the target sustem (for example, some db-related packages)
> - it may require installing target version of Ruby first and / or gemset (in case of using RVM)
> 
> User needs to run this command individually.
