package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_798:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_2163:String;
      
      private var var_2601:BitmapData;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_798,param3,param4);
         this.var_2163 = param1;
         this.var_2601 = param2;
      }
      
      public function get badgeID() : String
      {
         return this.var_2163;
      }
      
      public function get badgeImage() : BitmapData
      {
         return this.var_2601;
      }
   }
}
