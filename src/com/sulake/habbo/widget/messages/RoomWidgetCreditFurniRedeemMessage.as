package com.sulake.habbo.widget.messages
{
   public class RoomWidgetCreditFurniRedeemMessage extends RoomWidgetMessage
   {
      
      public static const const_675:String = "RWFCRM_REDEEM";
       
      
      private var var_328:int;
      
      public function RoomWidgetCreditFurniRedeemMessage(param1:String, param2:int)
      {
         super(param1);
         this.var_328 = param2;
      }
      
      public function get objectId() : int
      {
         return this.var_328;
      }
   }
}
