require "bundler/gem_tasks"
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :shell do
  system "irb -I #{File.expand_path('../lib', __FILE__)} -r bcycle"
end

task :default => :spec
