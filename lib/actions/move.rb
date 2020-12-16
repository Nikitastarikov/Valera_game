class Move
  def work!(stats)
    if (stats['mana'] < 50) && (stats['fatigue'] < 10)
      stats['fun'] -= 5
      stats['mana'] -= 30
      stats['money'] += 100
      stats['fatigue'] += 70
    end
    stats
  end

  def to_contemplate_nature!(stats)
    stats['fun'] += 1
    stats['mana'] -= 10
    stats['fatigue'] += 10
    stats
  end

  def relax_at_home!(stats)
    if stats['money'] >= 20
      stats['fun'] -= 1
      stats['mana'] += 30
      stats['fatigue'] += 10
      stats['health'] -= 5
      stats['money'] -= 20
    end
    stats
  end

  def go_in_bar!(stats)
    if stats['money'] >= 100
      stats['fun'] += 1
      stats['mana'] += 60
      stats['fatigue'] += 40
      stats['health'] -= 10
      stats['money'] -= 100
    end
    stats
  end

  def drink_with_marginals!(stats)
    if stats['money'] >= 150
      stats['fun'] += 5
      stats['mana'] += 90
      stats['fatigue'] += 80
      stats['health'] -= 80
      stats['money'] -= 150
    end
    stats
  end

  def sing_in_metro!(stats)
    stats['money'] += 50 if (stats['mana'] > 40) && (stats['mana'] < 70)
    stats['fun'] += 1
    stats['mana'] += 10
    stats['fatigue'] += 20
    stats['money'] += 10
    stats
  end

  def go_to_sleep!(stats)
    stats['health'] += 90 if stats['mana'] < 30
    stats['fun'] -= 3 if stats['mana'] > 70
    stats['mana'] -= 50
    stats['fatigue'] -= 70
    stats
  end
end
