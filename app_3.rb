require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------"
puts "|-◊-  Call-of-Duty Programming War    -◊-|"
puts "|                -v3.0-                  |"
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

my_game = Game.new(user_name)

puts "On va te mettre direct dans le bain recrue. Voici tes adversaires #{my_game.enemies.join(", ")}"

while my_game.is_still_ongoing? == true
  my_game.show_players
  my_game.menu
  my_game.menu_choice
  my_game.enemies_attack
end

my_game.end