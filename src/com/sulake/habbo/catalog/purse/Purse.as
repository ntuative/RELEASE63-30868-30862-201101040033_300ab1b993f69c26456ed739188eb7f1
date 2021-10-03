package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_523:int = 0;
       
      
      private var var_2345:int = 0;
      
      private var var_1324:Dictionary;
      
      private var var_1683:int = 0;
      
      private var var_1684:int = 0;
      
      private var var_2151:Boolean = false;
      
      private var var_2145:int = 0;
      
      private var var_2153:int = 0;
      
      public function Purse()
      {
         this.var_1324 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2345;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2345 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1683;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1683 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1684;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1684 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1683 > 0 || this.var_1684 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2151;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2151 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2145;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2145 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2153;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2153 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1324;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1324 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1324[param1];
      }
   }
}
