package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1992:String;
      
      private var var_1416:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         this.var_1992 = param1;
         this.var_1416 = param2;
      }
      
      public function get postureType() : String
      {
         return this.var_1992;
      }
      
      public function get parameter() : String
      {
         return this.var_1416;
      }
   }
}
