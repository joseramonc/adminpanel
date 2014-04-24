# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'adminpanel/version'

Gem::Specification.new do |spec|
  spec.name          = "adminpanel"
  spec.version       = Adminpanel::VERSION
  spec.authors       = ["Jose Ramon Camacho", "Victor Camacho"]
  spec.email         = ["joserracamacho@gmail.com"]
  spec.description   = %q{Gem that makes the admin panel for a site a breeze!}
  spec.summary       = %q{Developed with <3 by CoDN}
  spec.homepage      = "https://github.com/joseramonc/adminpanel"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib", "app/assets"]

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_dependency "rails", '>= 4.0.0'
  spec.add_dependency "carrierwave", "~> 0.10.0"
  spec.add_dependency "rmagick", "~> 2.13.2"
  spec.add_dependency "jquery-rails", "~> 3.1.0"
  spec.add_dependency 'bcrypt', '~> 3.1.7'
  spec.add_dependency 'rails-i18n', '~> 4.0.2'
  spec.add_dependency 'inherited_resources', '~> 1.4.1'
  spec.add_dependency "cancancan", "~> 1.7"
  spec.add_dependency "google-api-client", "~> 0.7.1"

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency 'factory_girl_rails', '~> 4.4.1'
  spec.add_development_dependency 'rspec', '~> 2.14.1'
  spec.add_development_dependency 'rspec-rails', '~> 2.14.1'
  spec.add_development_dependency 'capybara', '2.2.1'
  spec.add_development_dependency 'ammeter', '1.0.0'
  spec.add_development_dependency 'faker', '>= 1.3.0'
end
