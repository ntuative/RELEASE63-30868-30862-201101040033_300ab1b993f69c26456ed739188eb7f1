package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1284:int;
      
      private var var_1572:int;
      
      private var var_2207:int;
      
      private var var_1592:int;
      
      private var var_1283:int;
      
      private var var_2163:String = "";
      
      private var var_2480:String = "";
      
      private var var_2481:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1284 = param1.readInteger();
         this.var_2163 = param1.readString();
         this.var_1572 = param1.readInteger();
         this.var_2207 = param1.readInteger();
         this.var_1592 = param1.readInteger();
         this.var_1283 = param1.readInteger();
         this.var_2481 = param1.readInteger();
         this.var_2480 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1284;
      }
      
      public function get points() : int
      {
         return this.var_1572;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2207;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1592;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1283;
      }
      
      public function get badgeID() : String
      {
         return this.var_2163;
      }
      
      public function get achievementID() : int
      {
         return this.var_2481;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2480;
      }
   }
}
