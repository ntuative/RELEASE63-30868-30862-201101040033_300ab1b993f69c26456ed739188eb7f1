package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1948:int;
      
      private var var_1949:int;
      
      private var var_1951:String;
      
      private var var_1947:int;
      
      private var var_1950:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_1948 = param1;
         this.var_1949 = param2;
         this.var_1951 = param3;
         this.var_1947 = param4;
         this.var_1950 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1948,this.var_1949,this.var_1951,this.var_1947,int(this.var_1950)];
      }
      
      public function dispose() : void
      {
      }
   }
}
