# frozen_string_literal: true

$:.push File.expand_path("../lib", __FILE__)
require "trackplus/version"

Gem::Specification.new do |s|
  s.name = 'trackplus'
  s.version = Trackplus::VERSION.dup
  s.platform = Gem::Platform::RUBY
  s.licenses = ['MIT']
  s.summary = 'Support the latest V1 API'
  s.description = 'Developed for easy integration with TrackPlus'
  s.required_ruby_version = '>= 2.4.0'

  s.author = ['Amit Kosti']
  s.email = ['akosti92@gmail.com']
  s.homepage = 'https://github.com/ammit/trackplus-ruby'

  s.files         = Dir['{bin,lib}/**/*', 'README.md']
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']
  s.requirements << 'none'

  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec', '~> 2.14.1'
  s.add_development_dependency 'webmock', '~> 2.3.2'
end
