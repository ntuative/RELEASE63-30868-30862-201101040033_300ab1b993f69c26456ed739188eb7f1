package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2608:int;
      
      private var var_2610:int;
      
      private var var_643:Boolean;
      
      private var var_2611:int;
      
      private var var_2609:int;
      
      private var var_2613:int;
      
      private var var_2612:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2608 = param1.readInteger();
         this.var_2610 = param1.readInteger();
         this.var_643 = param1.readBoolean();
         this.var_2611 = param1.readInteger();
         this.var_2609 = param1.readInteger();
         this.var_2613 = param1.readInteger();
         this.var_2612 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2608;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2610;
      }
      
      public function get online() : Boolean
      {
         return this.var_643;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2611;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2609;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2613;
      }
      
      public function get banCount() : int
      {
         return this.var_2612;
      }
   }
}
