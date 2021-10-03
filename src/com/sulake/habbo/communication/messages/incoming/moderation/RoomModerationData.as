package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_339:int;
      
      private var var_2011:int;
      
      private var var_2378:Boolean;
      
      private var var_2168:int;
      
      private var _ownerName:String;
      
      private var var_100:RoomData;
      
      private var var_707:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_339 = param1.readInteger();
         this.var_2011 = param1.readInteger();
         this.var_2378 = param1.readBoolean();
         this.var_2168 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_100 = new RoomData(param1);
         this.var_707 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_100 != null)
         {
            this.var_100.dispose();
            this.var_100 = null;
         }
         if(this.var_707 != null)
         {
            this.var_707.dispose();
            this.var_707 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_339;
      }
      
      public function get userCount() : int
      {
         return this.var_2011;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2378;
      }
      
      public function get ownerId() : int
      {
         return this.var_2168;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_100;
      }
      
      public function get event() : RoomData
      {
         return this.var_707;
      }
   }
}
