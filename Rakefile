task :default => :run

task :migrate do
  `ruby migrate.rb`
end

task :run => :migrate do
  `ruby main.rb`
end