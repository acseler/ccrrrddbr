require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
Dir["./lib/codebreaker/*.rb"].each { |file| require file }

RSpec::Core::RakeTask.new(:spec)

task default: :spec


task :run do
  include Codebreaker
  system = System.new
  system.play_game
end
