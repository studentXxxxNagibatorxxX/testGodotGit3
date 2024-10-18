extends Area2D

# кол во кликов Общае
var clik = 0
# мощ клика по умолчанию 1
var clikStr = 1
# цена апгрейда 10 100 500 1000
var costUpgrade = 1
# пассивный доход цена
var costAutoCoin = 2 
# пассивный доход за тик (1 секунда) 
var tikCoins = 0
# Переменная для отслеживания времени
var timer = 0.0


# инфо о силе клика


func _process(delta):
	# СЧЕТ
	$ScoreLable.text = str(int(clik))
	# ИНФОРМаЦИОННЫЙ ЛЕЙБЛ!!!!
	$"../info".text = "		ИНФО:
сила клика = " + str(int(clikStr)) + "
пассивный доход = " + str(int(tikCoins))
	# пассивный тик дохода начинаем отсчет
	timer = timer + delta

	# Проверяем, прошло ли 1 секунда
	if timer >= 0.1:
		var tikCoinsForSec
		tikCoinsForSec = tikCoins / 10
		clik = clik + tikCoinsForSec  
		timer = 0.0  # Сбрасываем таймер
	#Тест сколько капает за секунду на глаз


# кнопки и текст на них обновления цены
	$"../ButtonUpClik".text = "Улучшение нажатия\nцена: " + str(int(costUpgrade))
	$"../ButtonUpPassiv".text = "Пассивный доход\nцена: " + str(int(costAutoCoin))
	
	

# функция тапанья
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index != MOUSE_BUTTON_WHEEL_UP and event.button_index != MOUSE_BUTTON_WHEEL_DOWN:	
		for i in range(1):
			clik = clik + clikStr
			




# Копка  апгрейда клика
func _on_button_button_down() -> void:
	if clik >= costUpgrade:
		clik = clik - costUpgrade
		# изменяем цену апгрейда

		costUpgrade = costUpgrade * 1.25
		# добавляем усиление клика 
		clikStr = clikStr * 2
		
# кнопка апгрейда пассивного дохода
func _on_button_2_button_down() -> void:
	if clik >= costAutoCoin:
		clik = clik - costAutoCoin

		costAutoCoin = costAutoCoin * 1.45
		if tikCoins == 0:
			tikCoins = tikCoins + 1
		tikCoins = tikCoins * 1.5
		
	
	

#Выход
func _on_exit_button_down() -> void:
	get_tree().quit()  
	



func _on_null_score_button_button_down() -> void:
	clik = 0
