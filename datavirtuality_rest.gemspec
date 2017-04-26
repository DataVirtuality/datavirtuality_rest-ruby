# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'datavirtuality_rest'
  s.version     = '0.0.1'
  s.date        = '2017-04-26'
  s.summary     = 'A REST client for DataVirtuality'
  s.description = 'Enables easy access to DataVirtuality via its REST API'
  s.authors     = ['DataVirtuality GmbH']
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
