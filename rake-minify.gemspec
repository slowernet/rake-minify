# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rake-minify}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matteo Collina"]
  s.date = %q{2011-04-01}
  s.description = %q{A rake task to minify javascripts}
  s.email = %q{matteo.collina@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".autotest",
    ".document",
    ".rspec",
    ".rvmrc",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "features/js-expected/a.min.js",
    "features/js-expected/b.min.js",
    "features/js-sources/a.js",
    "features/js-sources/b.js",
    "features/rake-minify.feature",
    "features/step_definitions/rake-minify_steps.rb",
    "features/support/env.rb",
    "features/support/generate_rakefiles.rb",
    "lib/rake-minify.rb",
    "lib/rake/minify.rb",
    "lib/rake/minify/group.rb",
    "lib/rake/minify/source.rb",
    "spec/rake/minify/group_spec.rb",
    "spec/rake/minify/source_spec.rb",
    "spec/rake/minify_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/mcollina/rake-minify}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.3}
  s.summary = %q{A rake task to minify javascripts}
  s.test_files = [
    "spec/rake/minify/group_spec.rb",
    "spec/rake/minify/source_spec.rb",
    "spec/rake/minify_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jsmin>, ["~> 1.0.1"])
      s.add_development_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<test_notifier>, ["~> 0.3.6"])
      s.add_development_dependency(%q<autotest>, ["~> 4.4"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<jsmin>, ["~> 1.0.1"])
      s.add_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<test_notifier>, ["~> 0.3.6"])
      s.add_dependency(%q<autotest>, ["~> 4.4"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<jsmin>, ["~> 1.0.1"])
    s.add_dependency(%q<rspec>, ["~> 2.5.0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<test_notifier>, ["~> 0.3.6"])
    s.add_dependency(%q<autotest>, ["~> 4.4"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

