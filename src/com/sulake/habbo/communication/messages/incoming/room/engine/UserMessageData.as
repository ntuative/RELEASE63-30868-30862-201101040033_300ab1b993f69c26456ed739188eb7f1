package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1078:String = "M";
      
      public static const const_1291:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_159:Number = 0;
      
      private var var_160:Number = 0;
      
      private var var_242:int = 0;
      
      private var _name:String = "";
      
      private var var_2512:int = 0;
      
      private var var_844:String = "";
      
      private var var_538:String = "";
      
      private var var_2515:String = "";
      
      private var var_2283:int;
      
      private var var_2516:int = 0;
      
      private var var_2514:String = "";
      
      private var var_2513:int = 0;
      
      private var var_2517:int = 0;
      
      private var var_2518:String = "";
      
      private var var_167:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_167 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_167)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_159;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_167)
         {
            this.var_159 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_160;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_167)
         {
            this.var_160 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_242;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_167)
         {
            this.var_242 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_167)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_2512;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_167)
         {
            this.var_2512 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_844;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_167)
         {
            this.var_844 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_538;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_167)
         {
            this.var_538 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2515;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_167)
         {
            this.var_2515 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2283;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_167)
         {
            this.var_2283 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2516;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_167)
         {
            this.var_2516 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2514;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_167)
         {
            this.var_2514 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2513;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_167)
         {
            this.var_2513 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2517;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_167)
         {
            this.var_2517 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2518;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_167)
         {
            this.var_2518 = param1;
         }
      }
   }
}
