# TinyMon - Website Acceptance Monitoring

TinyMon is a small tool to automatically and periodically monitor that features of your website are still working. It basically emulates a browser and does health checks composed of steps, like a normal user would do. The steps are easily defined and configured over a nice user interface. Internally, the wonderful Webrat framework is used, so the engine is powerful and well tested.

## Use cases

- Use TinyMon to monitor if your on-site search feature is working as expected
- Fill in login forms and log in with a test account
- Do a complete transaction for your online shop
- Monitor your signup process (e.g. sign up a user, click activation link, check welcome page etc.)

## Features

- Available in two languages: English and German
- Automatically updated overview
- Overview of recent activity
- Test duration graph
- Log output
- Email on failure
- Retry 3 times on failure to avoid false negatives
- Extreme Feedback Device-like overview
- Choose check interval per health check (every minute to once a day)
- Checks IMAP email inboxes (important for monitoring signup processes)
- Login mechanism
- Group health checks in accounts
- Assign any number of users to any number of accounts
- Prowl notifications
- Create similar health checks from templates
- Even create your own flexible health check templates with a nice user interface
- Import health checks from CSV files
- Start as many workers as you want when using Resque
- Bulk update health checks
- Mark your check runs with the currently deployed revision to quickly identify bad deployments

## Missing Stuff

- Configuration has to be done by hand
- Some step types might be missing
- Alerts other than by email and Prowl (e.g. SMS)
- Nice way of distributing the application
- Nice way to setup the database
- Nice way of starting all needed processes

## Installation

Clone the repository. Then run

  bundle install
  rake db:create:all
  rake db:migrate

## Running

This is pre-alpha. So there you need to start the processes manually. Start the server like any Rails application:

```
rails server -e production
```

Start the background checker process with

```
RAILS_ENV=production script/scheduler
```

## Contributing

Do the Github dance. That means fork the project, make your changes, and send me a pull request.

## About

TinyMon was written by Thomas Kadauke.

## Getting it, License and Patches

Get the complete source code through github.com/tkadauke/tiny_mon. For installation instructions, see above. License is MIT. That means that you can do whatever you want with the software, as long as the copyright statement stays intact. Please be a kind open source citizen, and give back your patches and extensions. Just fork the code on Github, and after you’re done, send us a pull request. Thanks for your help!
