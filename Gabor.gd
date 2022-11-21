extends Area2D
signal hit

var screen_size # Size of the app window
export var speed = 400 # How fast the gabor will move (pixels/sec)

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO # movement vector
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)

	var center_left = (screen_size.x / 2) - 5
	var center_right = (screen_size.x / 2) + 5
	if position.x >= center_left and position.x <= center_right:
		emit_signal("hit")

func start(pos):
	position = pos
	show()

func change_texture(filename):
	var imported_resource = load(filename)
	$Sprite.texture = imported_resource
	print("texture loaded: ", filename)
