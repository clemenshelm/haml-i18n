# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "haml-i18n/version"

Gem::Specification.new do |s|
  s.name        = "haml-i18n"
  s.homepage = "http://github.com/clemenshelm/haml-i18n"
  s.license = "MIT"
  s.version     = Haml::I18n::VERSION
  s.authors     = ["Clemens Helm"]
  s.email       = ["clemens.helm@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Easy translation of haml templates.}
  s.description = %q{This gem automatically retrieves translations from the I18n backend without reqiring explicit calls to I18n.translate from the haml templates.}
  
  s.add_development_dependency "rspec"
  
  s.add_dependency 'haml'
  s.add_dependency 'activesupport'
  s.add_dependency 'i18n'

  s.rubyforge_project = "haml-i18n"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
