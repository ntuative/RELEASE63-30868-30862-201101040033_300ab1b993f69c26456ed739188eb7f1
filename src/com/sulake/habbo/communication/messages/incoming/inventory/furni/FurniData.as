package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2240:int;
      
      private var var_1425:String;
      
      private var _objId:int;
      
      private var var_1865:int;
      
      private var _category:int;
      
      private var var_1930:String;
      
      private var var_2236:Boolean;
      
      private var var_2239:Boolean;
      
      private var var_2238:Boolean;
      
      private var var_2241:Boolean;
      
      private var var_2237:int;
      
      private var var_1407:int;
      
      private var var_1504:String = "";
      
      private var var_2333:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2240 = param1;
         this.var_1425 = param2;
         this._objId = param3;
         this.var_1865 = param4;
         this._category = param5;
         this.var_1930 = param6;
         this.var_2236 = param7;
         this.var_2239 = param8;
         this.var_2238 = param9;
         this.var_2241 = param10;
         this.var_2237 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1504 = param1;
         this.var_1407 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2240;
      }
      
      public function get itemType() : String
      {
         return this.var_1425;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1865;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1930;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2236;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2239;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2238;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2241;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2237;
      }
      
      public function get slotId() : String
      {
         return this.var_1504;
      }
      
      public function get songId() : int
      {
         return this.var_2333;
      }
      
      public function get extra() : int
      {
         return this.var_1407;
      }
   }
}
