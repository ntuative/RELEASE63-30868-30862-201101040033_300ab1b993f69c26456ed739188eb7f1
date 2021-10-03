package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1584:int;
      
      private var var_2659:String;
      
      private var var_1284:int;
      
      private var var_538:String;
      
      private var var_1333:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1584 = param1.readInteger();
         this.var_2659 = param1.readString();
         this.var_1284 = param1.readInteger();
         this.var_538 = param1.readString();
         this.var_1333 = param1.readInteger();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1584;
      }
      
      public function get petName() : String
      {
         return this.var_2659;
      }
      
      public function get level() : int
      {
         return this.var_1284;
      }
      
      public function get figure() : String
      {
         return this.var_538;
      }
      
      public function get petType() : int
      {
         return this.var_1333;
      }
   }
}
