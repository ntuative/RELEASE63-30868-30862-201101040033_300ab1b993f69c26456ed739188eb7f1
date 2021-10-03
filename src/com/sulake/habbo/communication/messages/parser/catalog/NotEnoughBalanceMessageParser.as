package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1658:int = 0;
      
      private var var_1659:int = 0;
      
      private var var_1532:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1658;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1659;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1532;
      }
      
      public function flush() : Boolean
      {
         this.var_1658 = 0;
         this.var_1659 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1658 = param1.readInteger();
         this.var_1659 = param1.readInteger();
         this.var_1532 = param1.readInteger();
         return true;
      }
   }
}
