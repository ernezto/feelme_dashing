# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '2m', :first_in => 0 do |job|
  puts "running job"
  value1 = rand(100)
  value2 = 100 - value1
  data = [
    { label: "Hello world", value: value1 },
    { label: "Testing", value: value2 },
  ]

  send_event 'bookmarks_frequency', { value: data }
end
