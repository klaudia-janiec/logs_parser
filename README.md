[![CircleCI](https://circleci.com/gh/klaudia-janiec/logs_parser.svg?style=svg)](https://circleci.com/gh/klaudia-janiec/logs_parser) [![Maintainability](https://api.codeclimate.com/v1/badges/b897ab1071965fbc5f39/maintainability)](https://codeclimate.com/github/klaudia-janiec/logs_parser/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/b897ab1071965fbc5f39/test_coverage)](https://codeclimate.com/github/klaudia-janiec/logs_parser/test_coverage)

Write a ruby script that:
- Receives a log as argument (webserver.log is provided) e.g. `./parser.rb webserver.log`
- Returns the following:
  - list of webpages with most page views ordered from most pages views to less page views
  ```
  /home 90 visits
  /index 80 visits
  ...
  ```
  - list of webpages with most unique page views also ordered
  ```
  /about/2 8 unique views
  /index 5 unique views
  ...
  ```
