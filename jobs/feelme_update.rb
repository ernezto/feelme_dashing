current_valuation = 0
current_karma = 0

SCHEDULER.every '30s' do

  send_event('Today', { current: 1, last: 1 })
end
