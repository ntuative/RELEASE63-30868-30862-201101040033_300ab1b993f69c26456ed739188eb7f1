package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1072:String;
      
      private var var_1227:Array;
      
      private var var_1155:Array;
      
      private var var_1501:int;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get question() : String
      {
         return this.var_1072;
      }
      
      public function get choices() : Array
      {
         return this.var_1227.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1155.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1501;
      }
      
      public function flush() : Boolean
      {
         this.var_1072 = "";
         this.var_1227 = [];
         this.var_1155 = [];
         this.var_1501 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1072 = param1.readString();
         this.var_1227 = [];
         this.var_1155 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1227.push(param1.readString());
            this.var_1155.push(param1.readInteger());
            _loc3_++;
         }
         this.var_1501 = param1.readInteger();
         return true;
      }
   }
}
