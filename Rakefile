#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'pathname'
ENV['BUNDLE_GEMFILE'] ||= File.expand_path("../Gemfile", Pathname.new(__FILE__).realpath)
require 'rubygems'
require 'bundler/setup'

require 'rake/dsl_definition'
require "rspec/core/rake_task"
 
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.rspec_opts = ['--backtrace']
end

Bundler::GemHelper.install_tasks

task default: :spec

require 'rdoc/task'

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = "rdoc"
  rdoc.rdoc_files.add "lib/**/*.rb", "README.rdoc"
end
