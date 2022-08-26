extends World
class_name Locations

export (bool) var breathable = 0
enum DecayPresences {None, Low, High, Pure}
export(DecayPresences) var decay_presence = DecayPresences.None
export (bool) var interior/exterior = 0
