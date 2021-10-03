package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1788:int;
      
      private var var_2533:int;
      
      private var var_1207:int;
      
      private var var_2527:int;
      
      private var var_100:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1788 = param1.readInteger();
         this.var_2533 = param1.readInteger();
         this.var_1207 = param1.readInteger();
         this.var_2527 = param1.readInteger();
         this.var_100 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1788);
      }
      
      public function get callId() : int
      {
         return this.var_1788;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2533;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1207;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2527;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_100;
      }
   }
}
