package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2277:int;
      
      private var var_2282:int;
      
      private var var_2278:int;
      
      private var var_2279:int;
      
      private var var_2280:int;
      
      private var var_2281:int;
      
      private var var_92:Array;
      
      private var var_214:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_92 = new Array();
         this.var_214 = new Array();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2277 = param1.readInteger();
         this.var_2282 = param1.readInteger();
         this.var_2278 = param1.readInteger();
         this.var_2279 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_92.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_214.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2280 = param1.readInteger();
         this.var_2281 = param1.readInteger();
         return true;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2277;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2282;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2278;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2280;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2281;
      }
      
      public function get categories() : Array
      {
         return this.var_92;
      }
      
      public function get friends() : Array
      {
         return this.var_214;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2279;
      }
   }
}
