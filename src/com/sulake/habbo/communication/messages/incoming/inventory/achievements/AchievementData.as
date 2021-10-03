package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1284:int;
      
      private var var_270:String;
      
      private var var_2344:int;
      
      private var var_2207:int;
      
      private var var_1592:int;
      
      private var var_2343:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1284 = param1.readInteger();
         this.var_270 = param1.readString();
         this.var_2344 = param1.readInteger();
         this.var_2207 = param1.readInteger();
         this.var_1592 = param1.readInteger();
         this.var_2343 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_270;
      }
      
      public function get level() : int
      {
         return this.var_1284;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2344;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2207;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1592;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2343;
      }
   }
}
