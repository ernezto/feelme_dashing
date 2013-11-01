# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '2s', :first_in => 0 do |job|
    puts 'Jobs de happiness'
    value1 = rand(60)
    value2 = rand(60)
    data = [value1, value2]
  send_event('happiness', { points: data})
end
