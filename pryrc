Pry.config.editor = "vim --nofork"

Pry.config.hooks.add_hook(:after_session, :say_bye) do
  puts "See ya!"
end

Pry.config.hooks.add_hook(:before_session, :say_bye) do
  puts "Hi there!"
end

# Prompt with ruby version
Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

# For rails
rails = File.join Dir.getwd, 'config', 'environment.rb'

if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails

  if Rails.version[0..0] == "2"
    require 'console_app'
    require 'console_with_helpers'
  elsif Rails.version[0..0] == "3"
    require 'rails/console/app'
    require 'rails/console/helpers'
  else
    warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
  end

  begin
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  rescue
  end
end
