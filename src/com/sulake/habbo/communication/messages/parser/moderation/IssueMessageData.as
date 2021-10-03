package com.sulake.habbo.communication.messages.parser.moderation
{
   public class IssueMessageData
   {
      
      public static const const_157:int = 1;
      
      public static const const_348:int = 2;
      
      public static const const_1478:int = 3;
       
      
      private var var_2522:int;
      
      private var _state:int;
      
      private var var_1288:int;
      
      private var _reportedCategoryId:int;
      
      private var var_1653:int;
      
      private var var_2531:int;
      
      private var var_2524:int = 0;
      
      private var var_2529:int;
      
      private var var_2530:String;
      
      private var var_1207:int;
      
      private var var_1464:String;
      
      private var var_1970:int;
      
      private var var_2525:String;
      
      private var _message:String;
      
      private var var_2527:int;
      
      private var var_900:String;
      
      private var var_1763:int;
      
      private var var_2526:String;
      
      private var var_339:int;
      
      private var var_2528:String;
      
      private var var_2460:String;
      
      private var var_2523:int;
      
      private var var_2072:int;
      
      public function IssueMessageData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:String, param9:int, param10:String, param11:int, param12:String, param13:String, param14:int, param15:String, param16:int, param17:String, param18:int, param19:String, param20:String, param21:int, param22:int)
      {
         super();
         this.var_2522 = param1;
         this._state = param2;
         this.var_1288 = param3;
         this._reportedCategoryId = param4;
         this.var_1653 = param5;
         this.var_2531 = param6;
         this.var_2529 = param7;
         this.var_2530 = param8;
         this.var_1207 = param9;
         this.var_1464 = param10;
         this.var_1970 = param11;
         this.var_2525 = param12;
         this._message = param13;
         this.var_2527 = param14;
         this.var_900 = param15;
         this.var_1763 = param16;
         this.var_2526 = param17;
         this.var_339 = param18;
         this.var_2528 = param19;
         this.var_2460 = param20;
         this.var_2523 = param21;
         this.var_2072 = param22;
      }
      
      public function get issueId() : int
      {
         return this.var_2522;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get categoryId() : int
      {
         return this.var_1288;
      }
      
      public function get reportedCategoryId() : int
      {
         return this._reportedCategoryId;
      }
      
      public function get timeStamp() : int
      {
         return this.var_1653;
      }
      
      public function get priority() : int
      {
         return this.var_2531 + this.var_2524;
      }
      
      public function get reporterUserId() : int
      {
         return this.var_2529;
      }
      
      public function get reporterUserName() : String
      {
         return this.var_2530;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1207;
      }
      
      public function get reportedUserName() : String
      {
         return this.var_1464;
      }
      
      public function get pickerUserId() : int
      {
         return this.var_1970;
      }
      
      public function get pickerUserName() : String
      {
         return this.var_2525;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2527;
      }
      
      public function get roomName() : String
      {
         return this.var_900;
      }
      
      public function get roomType() : int
      {
         return this.var_1763;
      }
      
      public function get flatType() : String
      {
         return this.var_2526;
      }
      
      public function get flatId() : int
      {
         return this.var_339;
      }
      
      public function get flatOwnerName() : String
      {
         return this.var_2528;
      }
      
      public function get roomResources() : String
      {
         return this.var_2460;
      }
      
      public function get unitPort() : int
      {
         return this.var_2523;
      }
      
      public function get worldId() : int
      {
         return this.var_2072;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         this.var_2524 = param1;
      }
      
      public function getOpenTime(param1:int) : String
      {
         var _loc2_:int = (param1 - this.var_1653) / 1000;
         var _loc3_:int = _loc2_ % 60;
         var _loc4_:int = _loc2_ / 60;
         var _loc5_:int = _loc4_ % 60;
         var _loc6_:int = _loc4_ / 60;
         var _loc7_:String = _loc3_ < 10 ? "0" + _loc3_ : "" + _loc3_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         var _loc9_:String = _loc6_ < 10 ? "0" + _loc6_ : "" + _loc6_;
         return _loc9_ + ":" + _loc8_ + ":" + _loc7_;
      }
   }
}
