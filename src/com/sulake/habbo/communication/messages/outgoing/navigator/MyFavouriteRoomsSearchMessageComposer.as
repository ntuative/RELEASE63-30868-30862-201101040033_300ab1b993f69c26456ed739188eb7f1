package com.sulake.habbo.communication.messages.outgoing.navigator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class MyFavouriteRoomsSearchMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_30:Array;
      
      public function MyFavouriteRoomsSearchMessageComposer()
      {
         this.var_30 = new Array();
         super();
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
