package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1504:int;
      
      private var var_1946:String;
      
      private var var_797:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1504 = param1.readInteger();
         this.var_1946 = param1.readString();
         this.var_797 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1504;
      }
      
      public function get figureString() : String
      {
         return this.var_1946;
      }
      
      public function get gender() : String
      {
         return this.var_797;
      }
   }
}
