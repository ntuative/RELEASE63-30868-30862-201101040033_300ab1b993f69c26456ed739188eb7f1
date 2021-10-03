package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1556:String = "";
      
      private var var_1524:String = "";
      
      private var var_2177:String = "";
      
      private var var_2285:Number = 0;
      
      private var var_2284:Number = 0;
      
      private var var_2289:Number = 0;
      
      private var var_2288:Number = 0;
      
      private var var_2287:Boolean = false;
      
      private var var_2290:Boolean = false;
      
      private var var_2286:Boolean = false;
      
      private var var_2291:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1556 = param2;
         this.var_1524 = param3;
         this.var_2177 = param4;
         this.var_2285 = param5;
         this.var_2284 = param6;
         this.var_2289 = param7;
         this.var_2288 = param8;
         this.var_2287 = param9;
         this.var_2290 = param10;
         this.var_2286 = param11;
         this.var_2291 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1556;
      }
      
      public function get canvasId() : String
      {
         return this.var_1524;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2177;
      }
      
      public function get screenX() : Number
      {
         return this.var_2285;
      }
      
      public function get screenY() : Number
      {
         return this.var_2284;
      }
      
      public function get localX() : Number
      {
         return this.var_2289;
      }
      
      public function get localY() : Number
      {
         return this.var_2288;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2287;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2290;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2286;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2291;
      }
   }
}
