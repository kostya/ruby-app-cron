RubyAppCron
===========

[RubyApp](http://github.com/kostya/ruby-app) extension, adds [Forverb](https://github.com/DAddYE/foreverb) support.


Using
-----

Add to Gemfile:

    gem 'ruby-app-cron'
 
Create runner: bin/crons

```ruby
#!/usr/bin/env ruby

require File.join(File.dirname(__FILE__), %w{.. config environment})

App::Cron.run  
```
    
Create example cron: app/crons/test1.rb

```ruby
class Test1 < Application::Cron

  every 45.seconds, :puts1
  every 35.seconds, :puts2

  def puts1
    App.logger.info '1'
  end

  def puts2
    App.logger.info '2'
  end

end
```

