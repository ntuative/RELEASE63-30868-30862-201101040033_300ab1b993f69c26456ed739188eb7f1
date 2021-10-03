package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1351:IID;
      
      private var var_1715:String;
      
      private var var_111:IUnknown;
      
      private var var_717:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1351 = param1;
         this.var_1715 = getQualifiedClassName(this.var_1351);
         this.var_111 = param2;
         this.var_717 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1351;
      }
      
      public function get iis() : String
      {
         return this.var_1715;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_111;
      }
      
      public function get references() : uint
      {
         return this.var_717;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_111 == null;
      }
      
      public function dispose() : void
      {
         this.var_1351 = null;
         this.var_1715 = null;
         this.var_111 = null;
         this.var_717 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_717;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_717) : uint(0);
      }
   }
}
