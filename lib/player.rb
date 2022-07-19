class Player
  attr_accessor :player_name, :life_points

  def initialize(pname)
    @player_name = pname
    @life_points = 10
  end

  def show_state
    puts "#{@player_name} a #{@life_points} points de vie"
  end

  def gets_damage(damage_points)
    @life_points -= damage_points
    if @life_points <= 0
      puts "#{@player_name} est tombé au combat"
      puts "press F to pay respects"
    end
  end

  def attacks(other_player)
    print "#{@player_name} attaque #{other_player.player_name}"
    damage_points = compute_damage
    puts " et inflige #{damage_points} points de dommages"
    other_player.gets_damage(damage_points)
    
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(pname)
    super(pname)
    @weapon_level = 1
    @life_points = 100
    
  end

  def show_state
    puts "#{@player_name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    return rand(1..6)*@weapon_level
  end

  def search_weapon
    dice = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{dice}"
    if @weapon_level < dice
      @weapon_level = dice
      puts "Ton arme est maintenant de niveau #{@weapon_level}"
    else
      puts "Cette camelote ne sert à rien ! Tu as déjà une arme de niveau #{@weapon_level}"
    end
  end

  def search_health_pack
    dice = rand(1..6)
    if dice == 1
      puts "Il n'y a rien ici... FACK !"
    elsif dice >= 2 && dice <= 5
      puts "Génial tu as pu te soigné ! +50pts de vie"
      @life_points += 50
      if @life_points > 100
        @life_points = 100
        puts "Santé Max"
      end
    elsif dice == 6
      puts "Génial tu as pu te soigné ! +80pts de vie"
      @life_points += 80
      if @life_points > 100
        @life_points = 100
        puts "Santé Max"
      end
    end
  end

end