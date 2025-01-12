extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

var vidaPlayer = 20
@onready var BarraVida:Label = $"../../InterfazJugador/infromacionVida"

func _ready() -> void:
	BarraVida.text = "Vida: " + str(vidaPlayer)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionx := Input.get_axis("ui_left", "ui_right")
	if directionx:
		velocity.x = directionx * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var directiony := Input.get_axis("ui_up", "ui_down")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group('Estrellas'):
		vidaPlayer -= 1
		BarraVida.text = "Vida: " + str(vidaPlayer)

func GameOver():
	if vidaPlayer <= 0:
		queue_free()
