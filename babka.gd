extends RigidBody2D

signal clicked
signal missed

func _ready():
	# Connect to ground detection
	$GroundDetector.body_entered.connect(_on_ground_hit)

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("clicked")
		queue_free()

func _on_ground_hit(_body):
	emit_signal("missed")
	queue_free()
