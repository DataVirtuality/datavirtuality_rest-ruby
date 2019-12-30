# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'datavirtuality_rest'
  s.version     = '0.0.2'
  s.date        = '2017-05-04'
  s.summary     = 'A REST client for Data Virtuality'
  s.description = 'Enables easy access to Data Virtuality via its REST API'
  s.authors     = ['Data Virtuality GmbH']
  s.email       = 'support@datavirtuality.com'
  s.files       = Dir.glob("{bin,lib}/**/*") + %w(README.md LICENSE.txt)
  s.homepage    = 'http://www.datavirtuality.com'
  s.license     = 'MIT'

  s.add_runtime_dependency 'httpclient'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'rubocop'
end
