package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_971:String = "select_outfit";
       
      
      private var var_2625:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_971);
         this.var_2625 = param1;
      }
      
      public function get outfitId() : int
      {
         return this.var_2625;
      }
   }
}
