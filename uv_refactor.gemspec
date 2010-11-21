# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "uv_refactor"
  s.version = "0.0.1"
  s.require_paths = ["lib"]
  s.files = [ "Gemfile",
              "Gemfile.lock",
              "README.markdown",
              "init.rb",
              "lib/uv_refactor.rb",
              "lib/uv_refactor/deprecation.rb"]

  s.description = "Some refactoring helpers."
  s.summary     = "Refactoring your rails application."
  s.required_ruby_version = ">= 1.8.7"
  s.test_files = [ "autotest/discover.rb",
                   "spec/spec_helper.rb",
                   "spec/uv_refactor/deprecation_spec.rb" ]
  s.homepage = "http://github.com/urbanvention/uv_refactor"
  s.email = "jan@urbanvention.com"
  s.date = "2010-11-21"
  s.authors = ["Jan Riethmayer"]
  s.rubygems_version = "1.3.6"
  s.add_dependency("activesupport", "~> 3.0.3")
  s.add_dependency("i18n", "~> 0.4.2")
end
