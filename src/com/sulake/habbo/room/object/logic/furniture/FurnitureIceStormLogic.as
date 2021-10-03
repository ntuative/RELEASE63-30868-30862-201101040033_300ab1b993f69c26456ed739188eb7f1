package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class FurnitureIceStormLogic extends FurnitureMultiStateLogic
   {
       
      
      private var var_1483:int = 0;
      
      private var var_1993:Number = 0.0;
      
      private var var_971:int = 0;
      
      public function FurnitureIceStormLogic()
      {
         super();
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:RoomObjectDataUpdateMessage = param1 as RoomObjectDataUpdateMessage;
         if(_loc2_ != null)
         {
            this.handleDataUpdateMessage(_loc2_);
            return;
         }
         super.processUpdateMessage(param1);
      }
      
      private function handleDataUpdateMessage(param1:RoomObjectDataUpdateMessage) : void
      {
         var _loc2_:int = param1.state / 1000;
         var _loc3_:int = param1.state % 1000;
         if(_loc3_ == 0)
         {
            this.var_971 = 0;
            param1 = new RoomObjectDataUpdateMessage(_loc2_,String(_loc2_),param1.extra);
            super.processUpdateMessage(param1);
         }
         else
         {
            this.var_1483 = _loc2_;
            this.var_1993 = param1.extra;
            this.var_971 = lastUpdateTime + _loc3_;
         }
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:* = null;
         if(this.var_971 > 0 && param1 >= this.var_971)
         {
            this.var_971 = 0;
            _loc2_ = new RoomObjectDataUpdateMessage(this.var_1483,String(this.var_1483),this.var_1993);
            super.processUpdateMessage(_loc2_);
         }
         super.update(param1);
      }
   }
}
