require_relative ('models/bounty.rb')

options1 = {'name' => 'Qlodrem',
  'species' => 'Grey', 'bounty_value' => 5000, 'danger_level' => 'medium'}

bounty1 = Bounty.new(options1)

options2 = {'name' => 'Qaebrurstae',
  'species' => 'Tsumazoar', 'bounty_value' => 15000, 'danger_level' => 'high'}

bounty2 = Bounty.new(options2)

options3 = {'name' => 'Keanuypto',
  'species' => 'Veludens', 'bounty_value' => 20000, 'danger_level' => 'ermagerdyerderd'}

bounty3 = Bounty.new(options3)

options4 = {'name' => 'Boxcar Willie', 'species' => 'Draconian', 'bounty_value' => 1000, 'danger_level' => 'low'}

bounty4 = Bounty.new(options4)

bounty1.save
bounty2.save
bounty3.save
bounty4.save

all_bounties = Bounty.return_all_bounties()
p all_bounties
puts ""

first_bounty = all_bounties.first
first_bounty.name = "Old Jim"
first_bounty.update()

p Bounty.return_all_bounties()
puts ""

first_bounty.delete()

puts ""
p Bounty.return_all_bounties()

puts ""
