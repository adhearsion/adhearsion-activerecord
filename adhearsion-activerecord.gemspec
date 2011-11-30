# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require "adhearsion/activerecord/version"

Gem::Specification.new do |s|
  s.name        = "adhearsion-activerecord"
  s.version     = Adhearsion::ActiveRecord::VERSION
  s.authors     = ["juandebravo", "Ben Langfeld"]
  s.email       = ["juandebravo@gmail.com", "ben@langfeld.me"]
  s.homepage    = ""
  s.summary     = %q{This gem provides an Adhearsion plugin to handle the ActiveRecord and database integration}
  s.description = %q{This gem provides an Adhearsion plugin to handle the ActiveRecord and database integration}

  s.rubyforge_project = "adhearsion-activerecord"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "activerecord"
  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
end
