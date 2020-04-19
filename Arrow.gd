extends Node2D

func _process(delta):
	
	self.move_local_x(0.5)
	
	if self.position.x > 1024:
		self.position.x = 0
	elif self.position.x < 0:
		self.position.x = 1024
		
	if self.position.y > 1024:
		self.position.y = 0
	elif self.position.y < 0:
		self.position.y = 1024
