class Player
  attr_accessor :player_name, :life_points

  def initialize(player_name)
    @player_name = player_name
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