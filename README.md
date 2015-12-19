# AntSkillsExtension

Расширение для **Anthill**. Позволяет реализовать в игре **скилы**.

## Установка

Необходимо скопировать папку расширения **skills** в папку ru/antkarlov/anthill/extensions/. На этом установка расширения завершена.

Вся работа со скилами происходит через статический класс AntSkills (создавать экземпляры этого класса не нужно!).

Далее необходимо зарегистрировать скил:

	AntSkills.registerSkill(key:String, defaultValue:Number),

где: 

	key:String - уникальное имя скила

	defaultValue:Number - начальное значение.

Например:

	AntSkills.registerSkill("hero_attack", 25);
