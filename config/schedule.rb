every 1.day, :at => '8:00 am' do
  runner 'Activity.send_new_activities_digest'
end
