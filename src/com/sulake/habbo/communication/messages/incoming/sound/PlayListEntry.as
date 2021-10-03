package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_2333:int;
      
      private var var_2405:int;
      
      private var var_2403:String;
      
      private var var_2402:String;
      
      private var var_2404:int = 0;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this.var_2333 = param1;
         this.var_2405 = param2;
         this.var_2403 = param3;
         this.var_2402 = param4;
      }
      
      public function get id() : int
      {
         return this.var_2333;
      }
      
      public function get length() : int
      {
         return this.var_2405;
      }
      
      public function get name() : String
      {
         return this.var_2403;
      }
      
      public function get creator() : String
      {
         return this.var_2402;
      }
      
      public function get startPlayHeadPos() : int
      {
         return this.var_2404;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         this.var_2404 = param1;
      }
   }
}
