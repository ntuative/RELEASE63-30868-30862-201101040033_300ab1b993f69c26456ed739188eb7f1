package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var _type:int = 0;
      
      private var var_844:String = "";
      
      private var var_538:String = "";
      
      private var var_2515:String = "";
      
      private var var_2283:int;
      
      private var var_2516:int = 0;
      
      private var var_2514:String = "";
      
      private var var_2513:int = 0;
      
      private var var_2517:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2283;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2283 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get sex() : String
      {
         return this.var_844;
      }
      
      public function set sex(param1:String) : void
      {
         this.var_844 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_538;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_538 = param1;
      }
      
      public function get custom() : String
      {
         return this.var_2515;
      }
      
      public function set custom(param1:String) : void
      {
         this.var_2515 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2516;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2516 = param1;
      }
      
      public function get groupID() : String
      {
         return this.var_2514;
      }
      
      public function set groupID(param1:String) : void
      {
         this.var_2514 = param1;
      }
      
      public function get groupStatus() : int
      {
         return this.var_2513;
      }
      
      public function set groupStatus(param1:int) : void
      {
         this.var_2513 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2517;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2517 = param1;
      }
   }
}
