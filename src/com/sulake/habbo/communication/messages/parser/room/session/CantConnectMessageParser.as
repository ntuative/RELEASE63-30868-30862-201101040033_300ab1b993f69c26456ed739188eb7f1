package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1290:int = 1;
      
      public static const const_1606:int = 2;
      
      public static const const_1509:int = 3;
      
      public static const const_1437:int = 4;
       
      
      private var var_1417:int = 0;
      
      private var var_1416:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1417 = 0;
         this.var_1416 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1417 = param1.readInteger();
         if(this.var_1417 == 3)
         {
            this.var_1416 = param1.readString();
         }
         else
         {
            this.var_1416 = "";
         }
         return true;
      }
      
      public function get reason() : int
      {
         return this.var_1417;
      }
      
      public function get parameter() : String
      {
         return this.var_1416;
      }
   }
}
