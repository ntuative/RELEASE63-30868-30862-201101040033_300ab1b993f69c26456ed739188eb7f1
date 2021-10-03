package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_159:Number = 0;
      
      private var var_160:Number = 0;
      
      private var var_2231:Number = 0;
      
      private var var_2235:Number = 0;
      
      private var var_2232:Number = 0;
      
      private var var_2234:Number = 0;
      
      private var var_242:int = 0;
      
      private var var_2230:int = 0;
      
      private var var_292:Array;
      
      private var var_2233:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_292 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_159 = param3;
         this.var_160 = param4;
         this.var_2231 = param5;
         this.var_242 = param6;
         this.var_2230 = param7;
         this.var_2235 = param8;
         this.var_2232 = param9;
         this.var_2234 = param10;
         this.var_2233 = param11;
         this.var_292 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_159;
      }
      
      public function get z() : Number
      {
         return this.var_160;
      }
      
      public function get localZ() : Number
      {
         return this.var_2231;
      }
      
      public function get targetX() : Number
      {
         return this.var_2235;
      }
      
      public function get targetY() : Number
      {
         return this.var_2232;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2234;
      }
      
      public function get dir() : int
      {
         return this.var_242;
      }
      
      public function get dirHead() : int
      {
         return this.var_2230;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2233;
      }
      
      public function get actions() : Array
      {
         return this.var_292.slice();
      }
   }
}
