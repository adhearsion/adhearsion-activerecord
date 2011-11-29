ahn-activerecord
================

ahn-activerecord is an Adhearsion Plugin providing ActiveRecord compatibility.

Features
--------

* FIXME (list of features and unsolved problems)

Requirements
------------

* Adhearsion 2.0+

Install
-------

Add `ahn-activerecord` to your Adhearsion app's Gemfile.

Configuration
-------------

In your Adhearsion app configuration file, add the following values:

```ruby
Adhearsion.config[:ahn_activerecord] do |config|
  config.username = "db-user"
  config.password = "db-password"
  config.database = "database-id"
  config.adapter  = "db-adapter" # i.e. mysql, sqlite3
  config.host     = "db-host"    # i.e. localhost
  config.port     = "db-port".to_i # i.e. 3306
end
```

Author
------

Original author: [Juan de Bravo](https://github.com/juandebravo)

Links
-----
* [Source](https://github.com/adhearsion/ahn-xmpp)
* [Documentation](http://rdoc.info/github/adhearsion/ahn-xmpp/master/frames)
* [Bug Tracker](https://github.com/adhearsion/ahn-xmpp/issues)

Note on Patches/Pull Requests
-----------------------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  * If you want to have your own version, that is fine but bump version in a commit by itself so I can ignore when I pull
* Send me a pull request. Bonus points for topic branches.

Copyright
---------

Check [License file](https://github.com/adhearsion/ahn-xmpp/blob/master/LICENSE)