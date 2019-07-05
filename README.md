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
