extends Area2D

var n = 1



func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:		
		print(n)
		
		$ScoreLable.text = "Твой счёт: " + str(n)
		for i in range(1):
			n = n + 1
			
