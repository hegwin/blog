# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "#{path}/log/cron.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
#
env :PATH, ENV['PATH']

every 1.day do
  rake 'scheduled:db_backup'
end

every 3.days do
  # I use create instead of refresh,
  # because ping Google is not available for some reasons
  rake 'sitemap:create'
end
