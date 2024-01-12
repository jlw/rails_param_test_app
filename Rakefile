# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

task :document_test_output do
  system [
    "rm -f app/views/bars/_test_output.html.erb",
    "rspec --force-color | ./bin/ansi2html --body-only > app/views/bars/_test_output.html.erb"
  ].join(" && ")
end
