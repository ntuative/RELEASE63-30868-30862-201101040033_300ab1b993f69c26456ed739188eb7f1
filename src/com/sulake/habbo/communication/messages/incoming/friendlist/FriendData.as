package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_797:int;
      
      private var var_643:Boolean;
      
      private var var_1712:Boolean;
      
      private var var_538:String;
      
      private var var_1288:int;
      
      private var var_1795:String;
      
      private var var_1507:String;
      
      private var var_1506:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_797 = param1.readInteger();
         this.var_643 = param1.readBoolean();
         this.var_1712 = param1.readBoolean();
         this.var_538 = param1.readString();
         this.var_1288 = param1.readInteger();
         this.var_1795 = param1.readString();
         this.var_1507 = param1.readString();
         this.var_1506 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_797;
      }
      
      public function get online() : Boolean
      {
         return this.var_643;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1712;
      }
      
      public function get figure() : String
      {
         return this.var_538;
      }
      
      public function get categoryId() : int
      {
         return this.var_1288;
      }
      
      public function get motto() : String
      {
         return this.var_1795;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1507;
      }
      
      public function get realName() : String
      {
         return this.var_1506;
      }
   }
}
