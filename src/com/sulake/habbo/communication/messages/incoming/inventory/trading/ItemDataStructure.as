package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2061:int;
      
      private var var_1425:String;
      
      private var var_2065:int;
      
      private var var_2064:int;
      
      private var _category:int;
      
      private var var_1930:String;
      
      private var var_1407:int;
      
      private var var_2059:int;
      
      private var var_2060:int;
      
      private var var_2063:int;
      
      private var var_2062:int;
      
      private var var_2058:Boolean;
      
      private var var_2733:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2061 = param1;
         this.var_1425 = param2;
         this.var_2065 = param3;
         this.var_2064 = param4;
         this._category = param5;
         this.var_1930 = param6;
         this.var_1407 = param7;
         this.var_2059 = param8;
         this.var_2060 = param9;
         this.var_2063 = param10;
         this.var_2062 = param11;
         this.var_2058 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2061;
      }
      
      public function get itemType() : String
      {
         return this.var_1425;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2065;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2064;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1930;
      }
      
      public function get extra() : int
      {
         return this.var_1407;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2059;
      }
      
      public function get creationDay() : int
      {
         return this.var_2060;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2063;
      }
      
      public function get creationYear() : int
      {
         return this.var_2062;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2058;
      }
      
      public function get songID() : int
      {
         return this.var_1407;
      }
   }
}
