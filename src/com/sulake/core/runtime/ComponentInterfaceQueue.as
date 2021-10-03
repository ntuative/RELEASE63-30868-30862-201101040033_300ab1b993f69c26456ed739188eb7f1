package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1581:IID;
      
      private var var_702:Boolean;
      
      private var var_1018:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1581 = param1;
         this.var_1018 = new Array();
         this.var_702 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1581;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_702;
      }
      
      public function get receivers() : Array
      {
         return this.var_1018;
      }
      
      public function dispose() : void
      {
         if(!this.var_702)
         {
            this.var_702 = true;
            this.var_1581 = null;
            while(this.var_1018.length > 0)
            {
               this.var_1018.pop();
            }
            this.var_1018 = null;
         }
      }
   }
}
