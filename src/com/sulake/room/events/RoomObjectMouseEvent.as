package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_200:String = "ROE_MOUSE_CLICK";
      
      public static const const_1604:String = "ROE_MOUSE_ENTER";
      
      public static const const_457:String = "ROE_MOUSE_MOVE";
      
      public static const const_1825:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1684:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_413:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1556:String = "";
      
      private var var_2290:Boolean;
      
      private var var_2287:Boolean;
      
      private var var_2286:Boolean;
      
      private var var_2291:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1556 = param2;
         this.var_2290 = param5;
         this.var_2287 = param6;
         this.var_2286 = param7;
         this.var_2291 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1556;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2290;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2287;
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
