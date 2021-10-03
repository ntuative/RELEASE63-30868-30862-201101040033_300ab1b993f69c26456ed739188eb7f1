package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2054:int;
      
      private var var_1505:String;
      
      private var var_2032:String;
      
      private var var_2055:Boolean;
      
      private var var_2053:Boolean;
      
      private var var_2056:int;
      
      private var var_2033:String;
      
      private var var_2057:String;
      
      private var var_1506:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2054 = param1.readInteger();
         this.var_1505 = param1.readString();
         this.var_2032 = param1.readString();
         this.var_2055 = param1.readBoolean();
         this.var_2053 = param1.readBoolean();
         param1.readString();
         this.var_2056 = param1.readInteger();
         this.var_2033 = param1.readString();
         this.var_2057 = param1.readString();
         this.var_1506 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2054;
      }
      
      public function get avatarName() : String
      {
         return this.var_1505;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2032;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2055;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2053;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2056;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2033;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2057;
      }
      
      public function get realName() : String
      {
         return this.var_1506;
      }
   }
}
