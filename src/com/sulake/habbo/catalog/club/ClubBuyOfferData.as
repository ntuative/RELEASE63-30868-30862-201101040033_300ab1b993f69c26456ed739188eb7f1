package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1651:String;
      
      private var var_1652:int;
      
      private var var_2339:Boolean;
      
      private var var_2341:Boolean;
      
      private var var_2335:int;
      
      private var var_2338:int;
      
      private var var_383:ICatalogPage;
      
      private var var_2340:int;
      
      private var var_2336:int;
      
      private var var_2337:int;
      
      private var var_2334:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1651 = param2;
         this.var_1652 = param3;
         this.var_2339 = param4;
         this.var_2341 = param5;
         this.var_2335 = param6;
         this.var_2338 = param7;
         this.var_2340 = param8;
         this.var_2336 = param9;
         this.var_2337 = param10;
      }
      
      public function dispose() : void
      {
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
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_523;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1652;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_383;
      }
      
      public function get priceType() : String
      {
         return Offer.const_767;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1651;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_383 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2334;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2334 = param1;
      }
   }
}
