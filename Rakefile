require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Ejecutar las espectativas de la clase Tabla"
task :spec do
  sh "rspec -I. spec/prct06_spec.rb"
end
