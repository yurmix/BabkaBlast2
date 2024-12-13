extends RigidBody2D

signal clicked
signal missed

func _ready():
	# Connect to ground detection
	$GroundDetector.body_entered.connect(_on_ground_hit)

	# Get sprite size
	var sprite_size = $Sprite2D.texture.get_size() * $Sprite2D.scale

	# Set main collision shape
	var main_shape = RectangleShape2D.new()
	main_shape.size = sprite_size
	$CollisionShape2D.shape = main_shape

	# Set click area shape (10% larger than sprite)
	var click_shape = RectangleShape2D.new()
	click_shape.size = sprite_size * 1.1
	$Area2D/CollisionShape2D.shape = click_shape

	# Set ground detector shape
	var ground_shape = RectangleShape2D.new()
	ground_shape.size = Vector2(sprite_size.x, 2)  # thin horizontal rectangle
	
func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("clicked")
		queue_free()

func _on_ground_hit(_body):
	emit_signal("missed")
	queue_free()
