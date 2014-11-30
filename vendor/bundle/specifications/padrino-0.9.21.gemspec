# -*- encoding: utf-8 -*-
# stub: padrino 0.9.21 ruby lib

Gem::Specification.new do |s|
  s.name = "padrino"
  s.version = "0.9.21"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Padrino Team", "Nathan Esquenazi", "Davide D'Agostino", "Arthur Chiu"]
  s.date = "2011-02-28"
  s.description = "The Godfather of Sinatra provides a full-stack agnostic framework on top of Sinatra"
  s.email = "padrinorb@gmail.com"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://www.padrinorb.com"
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubyforge_project = "padrino"
  s.rubygems_version = "2.4.4"
  s.summary = "The Godfather of Sinatra"

  s.installed_by_version = "2.4.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<padrino-core>, ["= 0.9.21"])
      s.add_runtime_dependency(%q<padrino-helpers>, ["= 0.9.21"])
      s.add_runtime_dependency(%q<padrino-mailer>, ["= 0.9.21"])
      s.add_runtime_dependency(%q<padrino-gen>, ["= 0.9.21"])
      s.add_runtime_dependency(%q<padrino-cache>, ["= 0.9.21"])
      s.add_runtime_dependency(%q<padrino-admin>, ["= 0.9.21"])
    else
      s.add_dependency(%q<padrino-core>, ["= 0.9.21"])
      s.add_dependency(%q<padrino-helpers>, ["= 0.9.21"])
      s.add_dependency(%q<padrino-mailer>, ["= 0.9.21"])
      s.add_dependency(%q<padrino-gen>, ["= 0.9.21"])
      s.add_dependency(%q<padrino-cache>, ["= 0.9.21"])
      s.add_dependency(%q<padrino-admin>, ["= 0.9.21"])
    end
  else
    s.add_dependency(%q<padrino-core>, ["= 0.9.21"])
    s.add_dependency(%q<padrino-helpers>, ["= 0.9.21"])
    s.add_dependency(%q<padrino-mailer>, ["= 0.9.21"])
    s.add_dependency(%q<padrino-gen>, ["= 0.9.21"])
    s.add_dependency(%q<padrino-cache>, ["= 0.9.21"])
    s.add_dependency(%q<padrino-admin>, ["= 0.9.21"])
  end
end
