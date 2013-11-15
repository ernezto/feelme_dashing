require 'httparty'

current_valuation = 0
current_karma = 0

SCHEDULER.every '5s' do

  send_event('Today', { current: 1, last: 1 })

  response_pie = HTTParty.get("http://localhost:3000/daily_moods/today")
  response_area = HTTParty.get("http://localhost:3000/daily_moods/current_week")

  send_event('highpie', response_pie)
  send_event('higharea', response_area)

end
