package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_751:int = 1;
      
      public static const const_803:int = 2;
      
      public static const const_661:int = 3;
      
      public static const const_983:int = 4;
      
      public static const const_691:int = 5;
      
      public static const const_978:int = 6;
       
      
      private var _type:int;
      
      private var var_1038:int;
      
      private var var_2195:String;
      
      private var var_2644:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1038 = param2;
         this.var_2195 = param3;
         this.var_2644 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2195;
      }
      
      public function get time() : String
      {
         return this.var_2644;
      }
      
      public function get senderId() : int
      {
         return this.var_1038;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
