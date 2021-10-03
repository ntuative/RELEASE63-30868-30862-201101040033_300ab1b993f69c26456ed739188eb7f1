package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionViralFurniStatusEvent extends RoomSessionEvent
   {
      
      public static const const_403:String = "RSVFS_STATUS";
      
      public static const const_492:String = "RSVFS_RECEIVED";
       
      
      private var var_328:int;
      
      private var _status:int = -1;
      
      private var var_1409:String;
      
      private var var_2017:String;
      
      public function RoomSessionViralFurniStatusEvent(param1:String, param2:IRoomSession, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param2,param3,param4);
         this._status = this.status;
         this.var_1409 = this.shareId;
      }
      
      public function get objectId() : int
      {
         return this.var_328;
      }
      
      public function get status() : int
      {
         return this._status;
      }
      
      public function get shareId() : String
      {
         return this.var_1409;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2017;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_328 = param1;
      }
      
      public function set status(param1:int) : void
      {
         this._status = param1;
      }
      
      public function set shareId(param1:String) : void
      {
         this.var_1409 = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2017 = param1;
      }
   }
}
