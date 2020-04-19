extends Node2D

func _ready():
	
	var rand = RandomNumberGenerator.new()
	var arrowscene = load("res://Arrow.tscn")
	var redarrowscene = load("res://RedArrow.tscn")
	var screen_size = get_viewport().get_visible_rect().size
	

	for i in range(0, 40):
		var arrow = arrowscene.instance()
		rand.randomize()
		var x = rand.randf_range(0, screen_size.x)
		rand.randomize()
		var y = rand.randf_range(0, screen_size.y)
		
		arrow.set_rotation(x+y)
		arrow.position = Vector2(x, y)
		add_child(arrow)
		
		
	var redarrow = redarrowscene.instance()
	var x = screen_size.x/2
	var y = screen_size.y/2
	
	redarrow.set_rotation(0)
	redarrow.position = Vector2(x, y)
	add_child(redarrow)
