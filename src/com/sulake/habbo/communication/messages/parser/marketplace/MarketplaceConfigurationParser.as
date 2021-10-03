package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1231:Boolean;
      
      private var var_2581:int;
      
      private var var_1871:int;
      
      private var var_1872:int;
      
      private var var_2578:int;
      
      private var var_2579:int;
      
      private var var_2580:int;
      
      private var var_2135:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1231;
      }
      
      public function get commission() : int
      {
         return this.var_2581;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1871;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1872;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2579;
      }
      
      public function get method_2() : int
      {
         return this.var_2578;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2580;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2135;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1231 = param1.readBoolean();
         this.var_2581 = param1.readInteger();
         this.var_1871 = param1.readInteger();
         this.var_1872 = param1.readInteger();
         this.var_2579 = param1.readInteger();
         this.var_2578 = param1.readInteger();
         this.var_2580 = param1.readInteger();
         this.var_2135 = param1.readInteger();
         return true;
      }
   }
}
