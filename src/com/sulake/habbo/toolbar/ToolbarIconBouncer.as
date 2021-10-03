package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2246:Number;
      
      private var var_1471:Number;
      
      private var var_836:Number;
      
      private var var_835:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2246 = param1;
         this.var_1471 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_836 = param1;
         this.var_835 = 0;
      }
      
      public function update() : void
      {
         this.var_836 += this.var_1471;
         this.var_835 += this.var_836;
         if(this.var_835 > 0)
         {
            this.var_835 = 0;
            this.var_836 = this.var_2246 * -1 * this.var_836;
         }
      }
      
      public function get location() : Number
      {
         return this.var_835;
      }
   }
}
