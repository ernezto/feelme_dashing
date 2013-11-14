require 'httparty'

current_valuation = 0
current_karma = 0

SCHEDULER.every '5s' do

  send_event('Today', { current: 1, last: 1 })

  response = HTTParty.get("http://localhost:3000/daily_moods/get")

  puts response
  send_event('highpie', response)
end
