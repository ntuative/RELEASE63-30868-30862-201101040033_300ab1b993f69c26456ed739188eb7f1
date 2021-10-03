package com.sulake.habbo.widget.messages
{
   import flash.display.BitmapData;
   
   public class RoomWidgetSetToolbarIconMessage extends RoomWidgetMessage
   {
      
      public static const const_1069:String = "RWCM_MESSAGE_SET_TOOLBAR_ICON";
      
      public static const const_1371:String = "me_menu";
       
      
      private var var_2139:String;
      
      private var _icon:BitmapData;
      
      public function RoomWidgetSetToolbarIconMessage(param1:String, param2:BitmapData)
      {
         super(const_1069);
         this.var_2139 = param1;
         this._icon = param2;
      }
      
      public function get widgetType() : String
      {
         return this.var_2139;
      }
      
      public function get icon() : BitmapData
      {
         return this._icon;
      }
   }
}