# -*- encoding: utf-8 -*-
# stub: padrino-cache 0.9.21 ruby lib

Gem::Specification.new do |s|
  s.name = "padrino-cache"
  s.version = "0.9.21"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Padrino Team", "Nathan Esquenazi", "Davide D'Agostino", "Arthur Chiu"]
  s.date = "2011-02-28"
  s.description = "Caching support for memcached, page and fragment"
  s.email = "padrinorb@gmail.com"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://www.padrinorb.com"
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubyforge_project = "padrino-cache"
  s.rubygems_version = "2.4.4"
  s.summary = "Page and fragment caching for Padrino"

  s.installed_by_version = "2.4.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<padrino-core>, ["= 0.9.21"])
    else
      s.add_dependency(%q<padrino-core>, ["= 0.9.21"])
    end
  else
    s.add_dependency(%q<padrino-core>, ["= 0.9.21"])
  end
end
