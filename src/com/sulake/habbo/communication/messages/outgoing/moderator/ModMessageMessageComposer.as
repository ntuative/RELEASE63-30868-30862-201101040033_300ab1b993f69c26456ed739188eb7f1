package com.sulake.habbo.communication.messages.outgoing.moderator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class ModMessageMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_30:Array;
      
      public function ModMessageMessageComposer(param1:int, param2:String, param3:String)
      {
         this.var_30 = new Array();
         super();
         this.var_30.push(param1);
         this.var_30.push(param2);
         this.var_30.push(param3);
      }
      
      public function getMessageArray() : Array
      {
         return this.var_30;
      }
      
      public function dispose() : void
      {
         this.var_30 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
