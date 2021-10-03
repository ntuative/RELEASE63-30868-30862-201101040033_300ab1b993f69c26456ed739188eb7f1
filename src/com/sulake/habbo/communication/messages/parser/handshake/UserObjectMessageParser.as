package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_538:String;
      
      private var var_844:String;
      
      private var var_2607:String;
      
      private var var_1506:String;
      
      private var var_2605:int;
      
      private var var_2606:String;
      
      private var var_2603:int;
      
      private var var_2604:int;
      
      private var var_2450:int;
      
      private var _respectLeft:int;
      
      private var var_632:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_538 = param1.readString();
         this.var_844 = param1.readString();
         this.var_2607 = param1.readString();
         this.var_1506 = param1.readString();
         this.var_2605 = param1.readInteger();
         this.var_2606 = param1.readString();
         this.var_2603 = param1.readInteger();
         this.var_2604 = param1.readInteger();
         this.var_2450 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_632 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_538;
      }
      
      public function get sex() : String
      {
         return this.var_844;
      }
      
      public function get customData() : String
      {
         return this.var_2607;
      }
      
      public function get realName() : String
      {
         return this.var_1506;
      }
      
      public function get tickets() : int
      {
         return this.var_2605;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2606;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2603;
      }
      
      public function get directMail() : int
      {
         return this.var_2604;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2450;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_632;
      }
   }
}
