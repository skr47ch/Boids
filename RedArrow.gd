extends KinematicBody2D

export (int) var detect_radius = 100
var vis_color = Color(.867, .91, .247, .1)
var laser_color = Color(1.0, .329, .298)
var targets = []
var hit_pos
var rot = 0
var screen_size

func _ready():
	screen_size = get_viewport().get_visible_rect().size
	var shape = CircleShape2D.new()
	shape.radius = detect_radius
	$Visibility/CollisionShape2D.shape = shape
	
func _process(delta):
	update()
	remain_in_view()
	move()

func move():
	# calculate angle to swerve
	# for target in targets:
		
	
	pass



func _draw():
	draw_circle(Vector2(), detect_radius, vis_color)
	for target in targets:
		draw_line(Vector2(), (target.get_global_position() - self.get_global_position()).rotated(0), laser_color)

func remain_in_view():
	
	self.move_local_x(0.3)
	
	var x = self.get_global_position().x
	var y = self.get_global_position().y
	
	if x > screen_size.x:
		self.set_global_position(Vector2(0, y))
	elif x < 0:
		self.set_global_position(Vector2(screen_size.x, y))
		
	if y > screen_size.y:
		self.set_global_position(Vector2(x, 0))
	elif y < 0:
		self.set_global_position(Vector2(x, screen_size.y))

func _on_Visibility_body_entered(body):
	var target = body
	
	if body == self:
		return
		
	for item in targets:
		if target == item:
			return
			
	targets.append(target)
	target.modulate = Color(0, 1, 0)

func _on_Visibility_body_exited(body):
	var target = body
	for item in targets:
		if target == item:
			targets.erase(item)
			target.modulate = Color(1, 1, 1)

