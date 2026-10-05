begin
  // Инициализация переменных
	var direction : Integer = 0; // 0: направление неизвестно, 1: вверх, -1: вниз
	var changes : Cardinal = 0; // Счетчик смен направления
	var new_direction : Integer = direction; // Новое направление
	// Номер этажа, на котором остановился лифт
	var prev : Cardinal;
	var current : Cardinal;
	var b_done : boolean = false; // Флаговая переменная условие выхода из цикла
	Console.WriteLine('Введите номера этажей, где останавливался лифт.');
	Console.WriteLine('0 - Конец ввода данных');
	// Считываем первый этаж
	Cardinal.TryParse(Console.ReadLine(), prev);
	b_done := (prev = 0);
	// Цикл ввода и анализа входных данных
	// Данные вводятся до тех пор пока не будет получено число 0
	while not b_done do
  begin
	  Cardinal.TryParse(Console.ReadLine(), current); // Вводим остальные этажи
		b_done := (current = 0); // Выходим из цикла, если введен 0
		// Если этажи совпадают, направление не меняется,
		// просто пропускаем
		if (not b_done) and (current <> prev) then
    begin
			// Определяем новое текущее направление
			// между prev и current
			new_direction := 1;
			if current > prev then
      begin
				new_direction := -1;
			end;
		end;
		// Если до этого направление уже было известно (не 0)
		// и оно не совпадает с новым направлением, значит произошла смена
		if (not b_done) and (direction <> 0) and (new_direction <> direction) then
    begin
			changes += 1;
		end;
		// Обновляем историю для следующего шага
		direction := new_direction;
		prev := current;
	end;
	//--- Вывод информации на экран ----
	Console.WriteLine($'Количество смен направления лифтом: {changes}');
	Console.Read(); // Задержка вывода до нажатия клавиши "Ввод"
end.