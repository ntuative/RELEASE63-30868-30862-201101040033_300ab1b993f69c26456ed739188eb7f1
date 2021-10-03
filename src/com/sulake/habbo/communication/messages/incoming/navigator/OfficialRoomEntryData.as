package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1073:int = 1;
      
      public static const const_745:int = 2;
      
      public static const const_780:int = 3;
      
      public static const const_1366:int = 4;
       
      
      private var _index:int;
      
      private var var_2014:String;
      
      private var var_2013:String;
      
      private var var_2015:Boolean;
      
      private var var_2012:String;
      
      private var var_842:String;
      
      private var var_2010:int;
      
      private var var_2011:int;
      
      private var _type:int;
      
      private var var_2009:String;
      
      private var var_794:GuestRoomData;
      
      private var var_795:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2014 = param1.readString();
         this.var_2013 = param1.readString();
         this.var_2015 = param1.readInteger() == 1;
         this.var_2012 = param1.readString();
         this.var_842 = param1.readString();
         this.var_2010 = param1.readInteger();
         this.var_2011 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1073)
         {
            this.var_2009 = param1.readString();
         }
         else if(this._type == const_780)
         {
            this.var_795 = new PublicRoomData(param1);
         }
         else if(this._type == const_745)
         {
            this.var_794 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_794 != null)
         {
            this.var_794.dispose();
            this.var_794 = null;
         }
         if(this.var_795 != null)
         {
            this.var_795.dispose();
            this.var_795 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2014;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2013;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2015;
      }
      
      public function get picText() : String
      {
         return this.var_2012;
      }
      
      public function get picRef() : String
      {
         return this.var_842;
      }
      
      public function get folderId() : int
      {
         return this.var_2010;
      }
      
      public function get tag() : String
      {
         return this.var_2009;
      }
      
      public function get userCount() : int
      {
         return this.var_2011;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_794;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_795;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1073)
         {
            return 0;
         }
         if(this.type == const_745)
         {
            return this.var_794.maxUserCount;
         }
         if(this.type == const_780)
         {
            return this.var_795.maxUsers;
         }
         return 0;
      }
   }
}
