package com.sulake.habbo.communication.messages.outgoing.navigator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomTextSearchMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_30:Array;
      
      public function RoomTextSearchMessageComposer(param1:String)
      {
         this.var_30 = new Array();
         super();
         this.var_30.push(param1);
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
