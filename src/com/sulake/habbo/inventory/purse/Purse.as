package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1683:int = 0;
      
      private var var_1684:int = 0;
      
      private var var_2375:int = 0;
      
      private var var_2374:Boolean = false;
      
      private var var_2151:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1683 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1684 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2375 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2374 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2151 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1683;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1684;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2375;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2374;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2151;
      }
   }
}
