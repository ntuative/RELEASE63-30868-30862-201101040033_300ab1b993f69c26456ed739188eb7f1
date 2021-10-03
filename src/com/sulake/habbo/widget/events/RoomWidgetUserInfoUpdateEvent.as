package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_183:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_225:String = "RWUIUE_PEER";
      
      public static const const_1333:int = 0;
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const const_1016:int = 2;
      
      public static const const_954:int = 3;
      
      public static const const_1531:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1795:String = "";
      
      private var var_2283:int;
      
      private var var_2516:int = 0;
      
      private var var_2517:int = 0;
      
      private var var_538:String = "";
      
      private var var_40:BitmapData = null;
      
      private var var_249:Array;
      
      private var var_1325:int = 0;
      
      private var var_2370:String = "";
      
      private var var_2369:int = 0;
      
      private var var_2368:int = 0;
      
      private var var_1752:Boolean = false;
      
      private var var_1506:String = "";
      
      private var var_2591:Boolean = false;
      
      private var var_2590:Boolean = true;
      
      private var _respectLeft:int = 0;
      
      private var var_2588:Boolean = false;
      
      private var var_2592:Boolean = false;
      
      private var var_2595:Boolean = false;
      
      private var var_2594:Boolean = false;
      
      private var var_2593:Boolean = false;
      
      private var var_2587:Boolean = false;
      
      private var var_2589:int = 0;
      
      private var var_1750:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_249 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1795 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1795;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2283 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2283;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2516 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2516;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2517 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2517;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_538 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_538;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_40 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_40;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_249 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_249;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1325 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1325;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2370 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2370;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2591 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2591;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this._respectLeft = param1;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2588 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2588;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2592 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2592;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2595 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2595;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2594 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2594;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2593 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2593;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2587 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2587;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2589 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2589;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2590 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2590;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1750 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1750;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2369 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2369;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2368 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2368;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1752 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1752;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1506 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1506;
      }
   }
}
