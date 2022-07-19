require './lib/player.rb'
class Game
  attr_accessor :human_player, :enemies

  def initialize(user_name)
    @human_player = HumanPlayer.new(user_name)
    player1 = Player.new("Jose Jalapeño on a stick")
    player2 = Player.new("Peanuts")
    player3 = Player.new("Bubba J")
    player4 = Player.new("Walter")
    @enemies = [player1, player2, player3, player4]
  end

  def kill_player(player)
    @enemies.delete(player)
  end

  def is_still_ongoing?
    if @human_player.life_points > 0
      @enemies.each do |player| 
        if player.life_points < 0
          return false
        else
          return true
        end
      end
    else
      return false
    end
  end

  def show_players
    print "1) "
    @human_player.show_state
    puts "2) Il y a #{@enemies.length} à vaincre !"
  end

  def menu
    puts " "
    puts " "
    puts "Quelle action veux-tu effectuer ?"
    puts " "
    puts "  a - chercher une meilleure arme"
    puts "  b - chercher à te soigner"
    puts " "
    puts "  Attaquer un soldat ennemi :"
    i = 0
    @enemies.each do |player|
      print "   #{i} - "
      player.show_state 
      i += 1
    end
  end

  def menu_choice
    print "Entre ton action ici -> "
    action = gets.chomp

    while action != "a" && action != "b" && action != "0" && action != "1" && action != "2" && action != "3"
      self.menu
      puts ""
      print "Entre ton action ici -> "
      action = gets.chomp
    end

    if action == "a"
      puts " "
      @human_player.search_weapon
    elsif action == "b"
      puts " "
      @human_player.search_health_pack
    elsif action == "0"
      puts " "
      @human_player.attacks(@enemies[0])
    elsif action == "1"
      puts " "
      @human_player.attacks(@enemies[1])
    elsif action == "2"
      puts " "
      @human_player.attacks(@enemies[2])
    elsif action == "3"
      puts " "
      @human_player.attacks(@enemies[3])
    end

    @enemies.each do |player|
      if player.life_points <= 0
        self.kill_player(player)
      end
    end
  end
    
  def enemies_attack
    puts "  "
    puts" "
    puts "À COUVERT ! Les ennemis t'attaquent !"
    enemies.each do |player|
      if player.life_points <= 0
        puts " "
      else
        puts " "
        player.attacks(@human_player)
      end
    end
  end

  def end
    puts "La parite est terminée !"
    if @human_player.life_points <= 0
      puts "T'appelles ça être soldat ? T'as rien dans le slip ! Tu ne mérite pas d'avoir des couilles/ovaires !!!"
    else
      puts "Bravo champion ! Tu as su rester en vie beau combat !"
    end
  end

end