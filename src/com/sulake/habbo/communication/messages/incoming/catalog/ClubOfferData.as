package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1651:String;
      
      private var var_1652:int;
      
      private var var_2339:Boolean;
      
      private var var_2341:Boolean;
      
      private var var_2335:int;
      
      private var var_2338:int;
      
      private var var_2340:int;
      
      private var var_2336:int;
      
      private var var_2337:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1651 = param1.readString();
         this.var_1652 = param1.readInteger();
         this.var_2339 = param1.readBoolean();
         this.var_2341 = param1.readBoolean();
         this.var_2335 = param1.readInteger();
         this.var_2338 = param1.readInteger();
         this.var_2340 = param1.readInteger();
         this.var_2336 = param1.readInteger();
         this.var_2337 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1651;
      }
      
      public function get price() : int
      {
         return this.var_1652;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2339;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2341;
      }
      
      public function get periods() : int
      {
         return this.var_2335;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2338;
      }
      
      public function get year() : int
      {
         return this.var_2340;
      }
      
      public function get month() : int
      {
         return this.var_2336;
      }
      
      public function get day() : int
      {
         return this.var_2337;
      }
   }
}
