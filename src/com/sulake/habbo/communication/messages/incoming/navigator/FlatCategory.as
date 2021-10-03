package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1645:int;
      
      private var var_2548:String;
      
      private var var_356:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1645 = param1.readInteger();
         this.var_2548 = param1.readString();
         this.var_356 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1645;
      }
      
      public function get nodeName() : String
      {
         return this.var_2548;
      }
      
      public function get visible() : Boolean
      {
         return this.var_356;
      }
   }
}
