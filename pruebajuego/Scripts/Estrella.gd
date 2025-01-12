extends CharacterBody2D
# Variables para controlar el movimiento
var velocidad = 100  # Velocidad de movimiento en píxeles por segundo
var direccion = -1    # Dirección de movimiento: 1 para derecha, -1 para izquierda
var limite_izquierdo = -500  # Límites de la pantalla o el área de movimiento
var limite_derecho = 500     # Límites de la pantalla o el área de movimiento

func _ready():
	# Establecer la posición inicial
	position.x = limite_derecho

func _process(delta):
	# Mover el objeto lateralmente
	position.x += velocidad * direccion * delta
