# -*- encoding: utf-8 -*-
require File.dirname(__FILE__) + "/lib/version"

Gem::Specification.new do |s|
  s.name = %q{ruby-app-cron}
  s.version = RubyAppCron::VERSION

  s.authors = ["Makarchev Konstantin"]
  
  s.description = %q{RubyApp extension, adds Foreverb support}
  s.summary = %q{RubyApp extension, adds Foreverb support}

  s.email = %q{kostya27@gmail.com}
  s.homepage = %q{http://github.com/kostya/ruby-app-cron}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'ruby-app', ">= 0.1.8"
  s.add_dependency 'foreverb'  
  
  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
   
end
