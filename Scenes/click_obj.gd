extends Area2D

# кол во кликов
var clik = 0
# мощ клика по умолчанию 1
var clikStr = 1
# цена апгрейда 10 100 500 1000
var costUpgrade = 10
# пассивный доход цена
var costAutoCoin = 25
# пассивный доход за тик (1 секунда) 
var tikCoins = 0
# Переменная для отслеживания времени
var timer = 0.0

# инфо о силе клика


func _process(delta):
	# счет
	$ScoreLable.text = str(clik)
	# информация лейбл
	$"../info".text = "		ИНФО:
сила клика = " + str(clikStr) + "
пассивный доход = " + str(tikCoins)
	# пассивный тик дохода
	timer = timer + delta
	# Проверяем, прошло ли 1 секунда
	if timer >= 1.0:
		clik = clik + tikCoins  # Добавляем tikCoins к clik
		timer = 0.0  # Сбрасываем таймер


# кнопки обновление цены
	$"../ButtonUpClik".text = "Улучшение нажатия\nцена: " + str(costUpgrade)
	$"../ButtonUpPassiv".text = "Пассивный доход\nцена: " + str(costAutoCoin)
	
	

# функция тапанья
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index != MOUSE_BUTTON_WHEEL_UP and event.button_index != MOUSE_BUTTON_WHEEL_DOWN:	
		print(clik)
		
		#$ScoreLable.text = str(clik)
		for i in range(1):
			clik = clik + clikStr
			

# пассивный доход

	


# функция апгрейда
func _on_button_button_down() -> void:
	if clik >= costUpgrade:
		clik = clik - costUpgrade
		# изменяем цену апгрейда

		costUpgrade = 100
		# добавляем усиление клика 
		clikStr = 2
		
		
func _on_button_2_button_down() -> void:
	if clik >= costAutoCoin:
		clik = clik - costAutoCoin

		costAutoCoin = costAutoCoin + 150
		tikCoins = 1
		costAutoCoin = 50
	
	

# Завершить Выход
func _on_exit_button_down() -> void:
	get_tree().quit()  
	
	
