package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2071:String;
      
      private var var_2523:int;
      
      private var var_2072:int;
      
      private var var_2545:String;
      
      private var var_2628:int;
      
      private var var_1645:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2071 = param1.readString();
         this.var_2523 = param1.readInteger();
         this.var_2072 = param1.readInteger();
         this.var_2545 = param1.readString();
         this.var_2628 = param1.readInteger();
         this.var_1645 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2071;
      }
      
      public function get unitPort() : int
      {
         return this.var_2523;
      }
      
      public function get worldId() : int
      {
         return this.var_2072;
      }
      
      public function get castLibs() : String
      {
         return this.var_2545;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2628;
      }
      
      public function get nodeId() : int
      {
         return this.var_1645;
      }
   }
}
