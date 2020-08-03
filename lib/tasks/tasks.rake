require "#{Rails.root}/app/helpers/file_helper"
include FileHelper
desc "Tasks for our LogWatch"

# task :define_tasks => :environment do
#     Alert.all.each do |alert|
#       task :"#{alert[:alert_type]}_log_watch}" do
#         FileHelper.find_match(pattern:Regexp.new(alert.alert_type),freq:alert.frequency,duration:alert.duration,wait_time:alert.wait_time)
#       end
#   end
# end
task :critical_log_watch => :environment do
  alert = Alert.where(alert_type: "Critical").first
  FileHelper.find_match(pattern:Regexp.new(alert.alert_type),freq:alert.frequency,duration:alert.duration,wait_time:alert.wait_time)
end
task :info_log_watch => :environment do
  alert = Alert.where(alert_type: "Info").first
  FileHelper.find_match(pattern:Regexp.new(alert.alert_type),freq:alert.frequency,duration:alert.duration,wait_time:alert.wait_time)
end
task :warning_log_watch => :environment do
  alert = Alert.where(alert_type: "Warning").first
  FileHelper.find_match(pattern:Regexp.new(alert.alert_type),freq:alert.frequency,duration:alert.duration,wait_time:alert.wait_time)
end


