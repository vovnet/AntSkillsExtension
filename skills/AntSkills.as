package ru.antkarlov.anthill.extensions.skills {
	import ru.antkarlov.anthill.AntCookie;
	
	/**
	 * Класс AntSkills позволяет удобно управлять системой скилов в игре.
	 * 
	 * 
	 * @author Vladimir
	 */
	public class AntSkills {
		
		/**
		 * Уникальное имя игры использующееся для сохранения прогресса скилов в SharedObject.
		 */
		public static var saveName:String = "AnthillSkills";
		
		/**
		 * Хранит все скилы.
		 */
		private static var skillsList:Vector.<AntSkillData> = new Vector.<AntSkillData>();
		
		/**
		 * @constructor
		 */
		public function AntSkills() {
			super();
			throw new Error("AntSkills is a static class.");
		}
		
		
		//---------------------------------------------------
		// PUBLIC METHODS
		//---------------------------------------------------
		
		/**
		 * Регистрирует новый скил.
		 * @param	key	Идентификатор скила.
		 */
		public static function registerSkill(key:String, defaultValue:Number):void {
			if (isExistSkill(key)) {
				throw new Error("Skill with name " + key + " already exists!");
			}
			skillsList.push(new AntSkillData(key, defaultValue));
		}
		
		/**
		 * Добавляет новую ступень (уровень) прокачки скила.
		 * @param	key		Идентификатор скила.
		 * @param	price	Стоимость прокачки скила.
		 * @param	value	Новое значение скила после прокачки.
		 */
		public static function add(key:String, price:Number, value:Number):void {
			var skill:AntSkillData = getSkill(key);
			if (!isExistSkill(key)) {
				throw new Error("Skill with name " + key + " not found!");
			}
			skill.add(price, value);
		}
		
		/**
		 * Возвращает стоимость прокачки скила.
		 * @param	key	Идентификатор скила.
		 * @return		Стоимость скила.
		 */
		public static function getSkillPrice(key:String):Number {
			return getSkill(key).getSkillPrice();
		}
		
		/**
		 * Возвращает значение скила после прокачки.
		 * @param	key	Идентификатор скила.
		 * @return		Значение скила.
		 */
		public static function getSkillValue(key:String):Number {
			return getSkill(key).getSkillValue();
		}
		
		/**
		 * Возвращает текущее значение скила.
		 * @param	key	Идентификатор скила.
		 * @return		Значение текущего скила.
		 */
		public static function getCurrentValue(key:String):Number {
			return getSkill(key).getCurrentValue();
		}
		
		/**
		 * Прокачал ли скил по максимуму.
		 * @param	key	Идентификатор скила.
		 * @return		True, если скил полностью прокачан.
		 */
		public static function isMaxLevel(key:String):Boolean {
			return getSkill(key).isMaxLevel();
		}
		
		/**
		 * Повышает скил.
		 * @param	key	Идентификатор скила.
		 */
		public static function levelUp(key:String):void {
			getSkill(key).levelUp();
		}
		
		/**
		 * Сохраняет прогресс в SharedObject.
		 */
		public static function saveData():void {
			var data:Object = { };
			for each (var skill:AntSkillData in skillsList) {
				data[skill.key] = { 
					level: skill.getLevel(), 
					max: skill.isMaxLevel() };
			}
			var cookie:AntCookie = new AntCookie();
			cookie.open(saveName);
			cookie.write("skills", data);
		}
		
		/**
		 * Загружает прогресс из SharedObject.
		 */
		public static function loadData():void {
			if (skillsList.length == 0) {
				throw new Error("You must first add skills!");
			}
			
			var cookie:AntCookie = new AntCookie();
			cookie.open(saveName);
			var data:Object = cookie.read("skills") as Object;
			
			for (var key:String in data) {
				var skill:AntSkillData = getSkill(key);
				skill.setLevel(data[key].level, data[key].max);
			}
		}
		
		/**
		 * Сбрасывает прогресс.
		 */
		public static function reset():void {
			for each (var skill:AntSkillData in skillsList) {
				skill.reset();
			}
		}
		
		/**
		 * Генерирует строку с информацией о текущем состоянии скилов.
		 * @return	Строка.
		 */
		public static function toString():String {
			var result:String = "--Skills--\n";
			for each (var skill:AntSkillData in skillsList) {
				result += "\tkey: " + skill.key + " (";
				result += "current: " + skill.getCurrentValue().toString() + "; ";
				result += "priceUp: " + skill.getSkillPrice().toString() + "$; ";
				result += "valueUp: " + skill.getSkillValue().toString() + "; ";
				result += "isMax: " + skill.isMaxLevel().toString() + ")\n";
			}
			return result;
		}
		
		/**
		 * Возвращает список всех скилов.
		 * Можно использовать для того, чтобы в цикле быстро пробежаться по скилам.
		 * @return	Список всех скилов.
		 */
		public static function getSkillsList():Vector.<AntSkillData> {
			return skillsList;
		}
		
		
		//-------------------------------------------------
		//	PRIVATE METHODS
		//-------------------------------------------------
		
		/**
		 * Ищет скилл по ключу.
		 * @param	key	Ключ.
		 * @return		Скилл.
		 */
		private static function getSkill(key:String):AntSkillData {
			for each (var skill:AntSkillData in skillsList) {
				if (skill.key == key) {
					return skill;
				}
			}
			throw new Error("Skill with name " + key + " not found!");
		}
		
		/**
		 * Проверяет существует ли данный скилл.
		 * @param	key	Идентификатор скила
		 * @return		True, если такой скил есть в списке.
		 */
		private static function isExistSkill(key:String):Boolean {
			var isExist:Boolean = false;
			for each(var skill:AntSkillData in skillsList) {
				if (skill.key == key) {
					isExist = true;
					break;
				}
			}
			return isExist;
		}
		
	}

}