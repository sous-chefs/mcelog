# mcelog Cookbook CHANGELOG
This file is used to list changes made in each version of the mcelog cookbook.

## v1.0.0 (2016-01-31)
- Add integration testing with Test Kitchen and kitchen-docker in Travis CI
- Add support for RHEL 7
- Bump the minimum RHEL release to 6 as 5 was actually broken before
- Add inspec tests to ensure the service is started
- Remove the attributes for service name and config dir and instead use helper methods

## v0.2.0
- Use standard Chef .gitignore file
- Add travis.yml file for testing
- Remove use of hash rockets in the rubocop.yml file
- Add a Berksfile
- Add a Contributing doc
- Update and breakout deps in the Gemfile
- Add badges and requirements information to the readme
- Add chefignore to limit what files are uploaded to the server
- Add basic chefspec converge test
- Add source_url and issues_url to metadata.rb
- Add a changelog file
