package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2044:String;
      
      private var var_2047:Array;
      
      private var var_2045:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2044 = param1;
         this.var_2047 = param2;
         this.var_2045 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2044;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2047;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2045;
      }
   }
}
