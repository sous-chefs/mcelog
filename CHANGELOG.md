# mcelog Cookbook CHANGELOG

This file is used to list changes made in each version of the mcelog cookbook.

## Unreleased

## 2.2.2 - *2024-05-02*

## 2.2.1 - *2024-05-02*

## 2.2.0 - *2023-10-31*

- Fix markdown in contributing docs

## 2.1.13 - *2023-10-31*

## 2.1.12 - *2023-09-28*

## 2.1.11 - *2023-09-04*

## 2.1.10 - *2023-07-10*

## 2.1.9 - *2023-05-17*

## 2.1.8 - *2023-05-03*

## 2.1.7 - *2023-04-01*

## 2.1.6 - *2023-03-02*

- Standardise files with files in sous-chefs/repo-management

## 2.1.5 - *2023-03-02*

- Standardise files with files in sous-chefs/repo-management

## 2.1.4 - *2022-02-08*

- Remove delivery folder

## 2.1.3 - *2021-08-30*

- Standardise files with files in sous-chefs/repo-management

## 2.1.2 - *2021-06-01*

- Standardise files with files in sous-chefs/repo-management

## 2.1.1 - *2021-06-01*

- Standardise files with files in sous-chefs/repo-management

## 2.1.0 - *2021-03-22*

- Cookstyle fixes
- Sous Chefs Adoption

## 2.0.1 (2020-01-02)

- Correct path of mcelog.conf for rhel fedora - [@ashangit](https://github.com/ashangit)
- Update specs to 16.04 - [@tas50](https://github.com/tas50)
- Updates for cookstyle - [@tas50](https://github.com/tas50)

## 2.0.0 (2017-03-01)

- Use ChefDK for test deps and not the Gemfile
- Add Github issue and PR templates
- Test using Local Delivery and not Rake
- Move ownership over to Chef from tas50
- Require Chef 12.1+

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
- Add source\_url and issues\_url to metadata.rb
- Add a changelog file
