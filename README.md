# AntSkillsExtension
Расширение для Anthill. Позволяет реализовать в игре скилы.

Для начала необходимо загрузить расширение в папку ru/antkarlov/anthillextensions/. На этом установка расширения завершена.

Вся работа со скилами происходит через статический класс AntSkills (создавать экземпляры этого класса не нужно!).

Далее необходимо зарегистрировать скил:

	AntSkills.registerSkill(key:String, defaultValue:Number),

где: 

	key:String - уникальное имя скила

	defaultValue:Number - начальное значение.

Например:

	AntSkills.registerSkill("hero_attack", 25);
