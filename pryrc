Pry.config.editor = "vim --nofork"

Pry.config.hooks.add_hook(:after_session, :say_bye) do
  puts "See ya!"
end

Pry.config.hooks.add_hook(:before_session, :say_bye) do
  puts "Hi there!"
end

# Prompt with ruby version
Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end
