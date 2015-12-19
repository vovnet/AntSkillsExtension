package ru.antkarlov.anthill.extensions.skills {
	
	/**
	 * Класс AntSkillLevelData является контейнером для хранения необходимой
	 * информации о ступеньке скила.
	 * 
	 * @author Vladimir
	 */
	public class AntSkillLevelData {
		
		/**
		 * Стоимость прокачки скила.
		 */
		public var price:Number;
		
		/**
		 * Значение скила после прокачки.
		 */
		public var value:Number;
		
		/**
		 * @constructor
		 * @param	price	Стоимость прокачки.
		 * @param	value	Значение скила после прокачки.
		 */
		public function AntSkillLevelData(price:Number, value:Number) {
			this.price = price;
			this.value = value;
		}
		
	}

}