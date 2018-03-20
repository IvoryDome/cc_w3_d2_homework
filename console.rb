require_relative ('models/bounty.rb')

options = {'name' => 'Qlodrem',
  'species' => 'Grey', 'bounty_value' => 5000, 'danger_level' => 'medium'}

bounty1 = Bounty.new(options)

options_hash = {'name' => 'Qaebrurstae',
  'species' => 'Tsumazoar', 'bounty_value' => 15000, 'danger_level' => 'high'}

bounty2 = Bounty.new(options)

options_hash = {'name' => 'Keanuypto',
  'species' => 'Veludens', 'bounty_value' => 20000, 'danger_level' => 'ermagerdyerderd'}

bounty3 = Bounty.new(options)

bounty1.save
bounty2.save
bounty3.save

all_bounties = Bounty.return_all_bounties()
p all_bounties
