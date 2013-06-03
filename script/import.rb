require 'nokogiri'
require 'open-uri'
#replace the below xml source file with a new one if you want to upload more to the database
doc = Nokogiri::XML(open("http://www.cafeconleche.org/examples/baseball/1998statistics.xml"))

# cycle through the players in the above file and create ActiveRecord::Player objects to add to the database
doc.xpath('//PLAYER[not(SHUT_OUTS)]').each do |node|
  stats = node.children
  Player.create(
		:surname => stats.css('SURNAME').inner_text,
		:given_name => stats.css('GIVEN_NAME').inner_text,
		:games => stats.css('GAMES').inner_text,
		:games_started => stats.css('GAMES_STARTED').inner_text,
		:at_bats => stats.css('AT_BATS').inner_text,
		:runs => stats.css('RUNS').inner_text,
		:hits => stats.css('HITS').inner_text,
		:home_runs => stats.css('HOME_RUNS').inner_text,
		:rbi => stats.css('RBI').inner_text,
		:steals => stats.css('STEALS').inner_text,
		:sacrifice_flies => stats.css('SACRIFICE_FLIES').inner_text,
		:walks => stats.css('WALKS').inner_text,
		:hit_by_pitch => stats.css('HIT_BY_PITCH').inner_text
  )
end