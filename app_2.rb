require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------"
puts "|-◊-  Call-of-Duty Programming War    -◊-|"
puts "|                -v2.0-                  |"
puts "|________________________________________|"
puts "|    Tache de rester en vie le bleu !    |"
puts "------------------------------------------"
puts" "
puts" "
puts "Quel es ton nom de soldat ?"
print "-> "
user_name = gets.chomp
puts" "
puts" "
puts "Garde à vous recrue #{user_name} !"
puts" "

user = HumanPlayer.new(user_name)
player1 = Player.new("Jose Jalapeño on a stick")
player2 = Player.new("Peanuts")
enemies = [player1, player2]

puts "On va te mettre direct dans le bain recrue. Voici tes deux adversaires #{player1.player_name} et #{player2.player_name}"

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  user.show_state
  puts " "
  puts " "
  puts "Quelle action veux-tu effectuer ?"
  puts " "
  puts "  a - chercher une meilleure arme"
  puts "  b - chercher à te soigner"
  puts " "
  puts "  Attaquer un soldat ennemi :"
  print "   0 - "
  player1.show_state
  print "   1 - "
  player2.show_state

  print "Entre ton action ici -> "
  action = gets.chomp

  while action != "a" && action != "b" && action != "0" && action != "1"
    puts ""
    puts "Action incorrecte ! 100 pompes maintenant et recommance !!"
    puts "Quelle action veux-tu effectuer ?"
    puts " "
    puts "  a - chercher une meilleure arme"
    puts "  b - chercher à te soigner"
    puts " "
    puts "  Attaquer un soldat ennemi :"
    print "   0 - "
    player1.show_state
    print "   1 - "
    player2.show_state

    print "Entre ton action ici -> "
    action = gets.chomp
    puts " "
  end

  if action == "a"
    puts " "
    user.search_weapon
  elsif action == "b"
    puts " "
    user.search_health_pack
  elsif action == "0"
    puts " "
    user.attacks(player1)
  elsif action == "1"
    puts " "
    user.attacks(player2)
  end

  puts "  "
  puts" "
  puts "À COUVERT ! Les autres joueurs t'attaquent !"
  enemies.each do |player|
    if player.life_points <= 0
      puts " "
    else
      puts " "
      player.attacks(user)
    end
  end

end

puts "La parite est terminée !"
if user.life_points <= 0
  puts "T'appelles ça être soldat ? T'as rien dans le slip ! Tu ne mérite pas d'avoir des couilles/ovaires !!!"
else
  puts "Bravo champion ! Tu as su rester en vie beau combat !"
end