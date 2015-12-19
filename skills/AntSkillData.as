package ru.antkarlov.anthill.extensions.skills {
	
	/**
	 * Класс AntSkillData является контейнером для хранения информации о скиле
	 * 
	 * @author Vladimir
	 */
	public class AntSkillData {
		
		/**
		 * Идентификатор скила.
		 */
		public var key:String;
		
		/**
		 * Ступени скила.
		 */
		private var levels:Vector.<AntSkillLevelData> = new Vector.<AntSkillLevelData>();
		
		/**
		 * Текущий уровень скила.
		 */
		private var currentLevel:int = 0;
		
		/**
		 * Максимально ли прокачан скил.
		 */
		private var isMax:Boolean = false;
		
		/**
		 * Начальное значение скила.
		 */
		private var defaultValue:Number = 0;
		
		
		
		/**
		 * @constructor
		 * @param	key	Идентификатор скила.
		 */
		public function AntSkillData(key:String, defaultValue:Number) {
			this.key = key;
			this.defaultValue = defaultValue;
		}
		
		/**
		 * Добавляет новую ступень для скила.
		 * @param	price	Стоимость прокачки.
		 * @param	value	Значение скила после прокачки.
		 */
		public function add(price:Number, value:Number):void {
			levels.push(new AntSkillLevelData(price, value));
		}
		
		/**
		 * Возвращает текущее значение скила.
		 * @return	Значение скила.
		 */
		public function getCurrentValue():Number {
			var result:Number = defaultValue;
			if (currentLevel > 0) {
				result = levels[currentLevel - 1].value;
			}
			if (isMax) {
				result = levels[currentLevel].value;
			}
			return result;
		}
		
		/**
		 * Сбрасывает прогресс скила.
		 */
		public function reset():void {
			currentLevel = 0;
			isMax = false;
		}
		
		/**
		 * Возвращает текущий уровень скила.
		 * @return Уровень скила.
		 */
		public function getLevel():int {
			return currentLevel;
		}
		
		/**
		 * Устанавливает текущий уровень скила.
		 * @param	value Уровень скила.
		 */
		public function setLevel(value:int, max:Boolean = false):void {
			if (value >= levels.length) {
				throw new Error("Current level " + value.toString() + " is higher than the permissible " + (levels.length-1).toString() + "!");
			} else {
				currentLevel = value;
				this.isMax = max;
			}
		}
		
		/**
		 * Возвращает стоимость повышения скила.
		 * @return Стоимость.
		 */
		public function getSkillPrice():Number {
			return levels[currentLevel].price;
		}
		
		/**
		 * Возвращает параметр скила.
		 * @return Параметр.
		 */
		public function getSkillValue():Number {
			return levels[currentLevel].value;
		}
		
		/**
		 * Повышаем скил на один уровень.
		 */
		public function levelUp():void {
			if (!isMax && currentLevel < levels.length - 1) {
				currentLevel++;
			} else {
				isMax = true;
				currentLevel = levels.length - 1;
			}
			trace("current level " + currentLevel.toString());
		}
		
		/**
		 * Достиг ли скил максимального уровня.
		 * @return True, если скил максимального уровня.
		 */
		public function isMaxLevel():Boolean {
			return isMax;
		}
		
	}

}