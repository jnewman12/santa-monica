# -*- encoding: utf-8 -*-
# stub: url_mount 0.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "url_mount"
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Daniel Neighman"]
  s.date = "2010-06-06"
  s.description = "Glue to allow mounted rack applications to know where they're mounted"
  s.email = "has.sox@gmail.com"
  s.homepage = "http://github.com/hassox/url_mount"
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubygems_version = "2.4.4"
  s.summary = "Universal mounting points for rack applications"

  s.installed_by_version = "2.4.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<rack>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rack>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rack>, [">= 0"])
  end
end
