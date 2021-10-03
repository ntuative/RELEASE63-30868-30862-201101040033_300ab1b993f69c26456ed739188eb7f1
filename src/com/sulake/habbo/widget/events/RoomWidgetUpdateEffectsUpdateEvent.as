package com.sulake.habbo.widget.events
{
   public class RoomWidgetUpdateEffectsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_743:String = "RWUEUE_UPDATE_EFFECTS";
       
      
      private var var_256:Array;
      
      public function RoomWidgetUpdateEffectsUpdateEvent(param1:Array = null, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_743,param2,param3);
         this.var_256 = param1;
      }
      
      public function get effects() : Array
      {
         return this.var_256;
      }
   }
}
