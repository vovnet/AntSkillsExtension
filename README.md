# AntSkillsExtension

Расширение для **Anthill**. Позволяет реализовать в игре **скилы**.

## Установка

Необходимо скопировать папку расширения **skills** в папку ru/antkarlov/anthill/extensions/. На этом установка расширения завершена.

## Использование

Вся работа со скилами происходит через статический класс **AntSkills** (создавать экземпляры этого класса **не нужно!**).

Далее необходимо зарегистрировать скил:

	AntSkills.registerSkill(key:String, defaultValue:Number),

где: 

	key:String - уникальное имя скила

	defaultValue:Number - начальное значение.

Например:

	AntSkills.registerSkill("hero_attack", 25); 		// скил для силы атаки героя
	AntSkills.registerSkill("hero_speed_run", 30.4);	// скилл для скорости бега героя

Теперь можно добавлять уровни скилов с помощью метода **AntSkills.add**:

	AntSkills.add("hero_attack", 100, 30); // увеличивает силу до 30 за 100$
	AntSkills.add("hero_attack", 200, 50); // увеличивает силу до 50 за 200$
	AntSkills.add("hero_attack", 300, 80); // увеличивает силу до 80 за 300$
