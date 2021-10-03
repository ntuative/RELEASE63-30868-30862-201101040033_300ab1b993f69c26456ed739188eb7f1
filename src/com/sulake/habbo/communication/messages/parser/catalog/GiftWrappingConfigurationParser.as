package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2314:Boolean;
      
      private var var_2315:int;
      
      private var var_1466:Array;
      
      private var var_635:Array;
      
      private var var_636:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2314;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2315;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1466;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_635;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_636;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1466 = [];
         this.var_635 = [];
         this.var_636 = [];
         this.var_2314 = param1.readBoolean();
         this.var_2315 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1466.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_635.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_636.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
