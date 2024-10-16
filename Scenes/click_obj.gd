extends Area2D

# кол во кликов
var clik = 0
# мощ клика по умолчанию 1
var clikStr = 1
# цена апгрейда
var costUpgrade = 10


func _process(delta):
	$ScoreLable.text = str(clik)
	
	
	
	
# функция тапанья
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index != MOUSE_BUTTON_WHEEL_UP and event.button_index != MOUSE_BUTTON_WHEEL_DOWN:	
		print(clik)
		
		#$ScoreLable.text = str(clik)
		for i in range(1):
			clik = clik + clikStr
			




# функция апгрейда
func _on_button_button_down() -> void:
	if clik >= costUpgrade:
		clik = clik - costUpgrade
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
