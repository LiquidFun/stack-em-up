extends Area2D

var is_pressed = false

export(PackedScene) var particles_on_press = null

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	is_pressed = false
	for body in bodies:
		if body.name == "Player": 
			is_pressed = true
			break
			
	if is_pressed:
		print($Sprite.frame)
		if $Sprite.frame == 0 and particles_on_press != null:
			var particles = particles_on_press.instance()
			particles.modulate = modulate
			particles.position = position
			get_tree().get_current_scene().add_child(particles)
			particles.restart()
		$Sprite.frame = 1
	else:
		$Sprite.frame = 0
