# frozen_string_literal: true

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'trackplus'
  s.version = '1.0.0'
  s.licenses = ['MIT']
  s.summary = 'Support the latest V1 API'
  s.description = 'Developed for easy integration with TrackPlus'
  s.required_ruby_version = '>= 2.4.0'

  s.author = ['Ammit']
  s.email = ['akosti92@gmail.com']
  s.homepage = 'https://www.google.com'

  s.files         = Dir['{bin,lib}/**/*', 'README.md']
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']
  s.requirements << 'none'

  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec', '~> 2.14.1'
  s.add_development_dependency 'webmock', '~> 1.20.4'
end
