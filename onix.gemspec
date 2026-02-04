# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "onix/version"

Gem::Specification.new do |s|
  s.name              = "onix"
  s.version           = ONIX::VERSION
  s.licenses          = ['MIT']
  s.summary           = "A convenient mapping between Ruby objects and the " +
                        "ONIX 2.1 XML specification"
  s.description       = "ONIX is the standard XML format for electronic data " +
                        "sharing in the book and publishing industries. This " +
                        "library provides a slim layer over the format and " +
                        "simplifies both reading and writing ONIX files in " +
                        "your Ruby applications."
  s.authors           = ["milkfarm productions"]
  s.email             = ["stuff@milkfarmproduction.com"]
  s.homepage          = "http://github.com/milkfarm/onix"
  s.rdoc_options     << "--title" << "ONIX - Working with the ONIX XML spec" <<
                        "--line-numbers"
  s.test_files        = Dir.glob("spec/**/*.rb")
  s.files             = Dir.glob("{lib,support,dtd}/**/**/*") + ["README.md", "CHANGELOG.md"]

  s.add_dependency 'roxml', '~> 4.0'
  s.add_dependency 'activesupport', '~> 6.0.2'
  s.add_dependency 'i18n', '~> 1.8.2'
  s.add_dependency 'nokogiri', '>= 1.10.9'

  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rdoc', '~> 6.2'
  s.add_development_dependency 'rspec', '~> 3.9'
end
