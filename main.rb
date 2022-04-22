require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'

  gem 'json'
  gem 'git'
  gem 'tty-prompt'
  gem 'thor'
  gem 'activesupport'
  gem 'colorize'
end

Dir[File.expand_path(File.join(File.dirname(File.absolute_path(__FILE__)), './app')) + "/**/*.rb"].each do |file|
  require file
end

CLI.start
