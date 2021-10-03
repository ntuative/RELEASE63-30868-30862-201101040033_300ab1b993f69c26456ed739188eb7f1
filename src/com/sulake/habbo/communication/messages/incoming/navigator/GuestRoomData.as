package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_339:int;
      
      private var var_707:Boolean;
      
      private var var_900:String;
      
      private var _ownerName:String;
      
      private var var_2080:int;
      
      private var var_2011:int;
      
      private var var_2574:int;
      
      private var var_1489:String;
      
      private var var_2576:int;
      
      private var var_2113:Boolean;
      
      private var var_759:int;
      
      private var var_1288:int;
      
      private var var_2577:String;
      
      private var var_775:Array;
      
      private var var_2575:RoomThumbnailData;
      
      private var var_2077:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_775 = new Array();
         super();
         this.var_339 = param1.readInteger();
         this.var_707 = param1.readBoolean();
         this.var_900 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2080 = param1.readInteger();
         this.var_2011 = param1.readInteger();
         this.var_2574 = param1.readInteger();
         this.var_1489 = param1.readString();
         this.var_2576 = param1.readInteger();
         this.var_2113 = param1.readBoolean();
         this.var_759 = param1.readInteger();
         this.var_1288 = param1.readInteger();
         this.var_2577 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_775.push(_loc4_);
            _loc3_++;
         }
         this.var_2575 = new RoomThumbnailData(param1);
         this.var_2077 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_775 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_339;
      }
      
      public function get event() : Boolean
      {
         return this.var_707;
      }
      
      public function get roomName() : String
      {
         return this.var_900;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2080;
      }
      
      public function get userCount() : int
      {
         return this.var_2011;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2574;
      }
      
      public function get description() : String
      {
         return this.var_1489;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2576;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2113;
      }
      
      public function get score() : int
      {
         return this.var_759;
      }
      
      public function get categoryId() : int
      {
         return this.var_1288;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2577;
      }
      
      public function get tags() : Array
      {
         return this.var_775;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2575;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2077;
      }
   }
}
