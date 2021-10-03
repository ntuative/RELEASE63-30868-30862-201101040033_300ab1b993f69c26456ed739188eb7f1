package com.sulake.habbo.room.events
{
   public class RoomEngineObjectEvent extends RoomEngineEvent
   {
      
      public static const const_796:String = "REOE_OBJECT_SELECTED";
      
      public static const const_539:String = "REOE_OBJECT_DESELECTED";
      
      public static const const_280:String = "REOB_OBJECT_ADDED";
      
      public static const const_652:String = "REOE_OBJECT_REMOVED";
      
      public static const const_233:String = "REOB_OBJECT_PLACED";
      
      public static const const_711:String = "REOB_OBJECT_REQUEST_MOVE";
      
      public static const const_128:String = "REOE_WIDGET_REQUEST_PLACEHOLDER";
      
      public static const const_136:String = "REOE_WIDGET_REQUEST_CREDITFURNI";
      
      public static const ROOM_OBJECT_WIDGET_REQUEST_STICKIE:String = "REOE_WIDGET_REQUEST_STICKIE";
      
      public static const const_121:String = "REOE_WIDGET_REQUEST_PRESENT";
      
      public static const const_118:String = "REOE_WIDGET_REQUEST_TROPHY";
      
      public static const const_132:String = "REOE_WIDGET_REQUEST_TEASER";
      
      public static const const_131:String = "REOE_WIDGET_REQUEST_ECOTRONBOX";
      
      public static const const_122:String = "REOE_WIDGET_REQUEST_DIMMER";
      
      public static const const_100:String = "REOR_REMOVE_DIMMER";
      
      public static const const_127:String = "REOR_REQUEST_CLOTHING_CHANGE";
      
      public static const const_417:String = "REOE_ROOM_AD_FURNI_CLICK";
      
      public static const const_412:String = "REOE_ROOM_AD_FURNI_DOUBLE_CLICK";
      
      public static const const_521:String = "REOE_ROOM_AD_TOOLTIP_SHOW";
      
      public static const const_398:String = "REOE_ROOM_AD_TOOLTIP_HIDE";
       
      
      private var var_328:int;
      
      private var _category:int;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      public function RoomEngineObjectEvent(param1:String, param2:int, param3:int, param4:int, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param2,param3,param6,param7);
         this.var_328 = param4;
         this._category = param5;
      }
      
      public function get objectId() : int
      {
         return this.var_328;
      }
      
      public function get category() : int
      {
         return this._category;
      }
   }
}
