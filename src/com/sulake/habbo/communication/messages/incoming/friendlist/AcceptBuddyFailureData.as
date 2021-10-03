package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AcceptBuddyFailureData
   {
       
      
      private var var_837:String;
      
      private var var_1502:int;
      
      public function AcceptBuddyFailureData(param1:IMessageDataWrapper)
      {
         super();
         this.var_837 = param1.readString();
         this.var_1502 = param1.readInteger();
      }
      
      public function get senderName() : String
      {
         return this.var_837;
      }
      
      public function get errorCode() : int
      {
         return this.var_1502;
      }
   }
}
