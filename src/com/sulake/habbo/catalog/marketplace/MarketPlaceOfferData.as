package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData implements IMarketPlaceOfferData
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2364:int;
      
      private var var_1930:String;
      
      private var var_1652:int;
      
      private var var_2318:int;
      
      private var var_2363:int;
      
      private var _status:int;
      
      private var var_2365:int = -1;
      
      private var var_1662:int;
      
      private var var_40:BitmapData;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2364 = param3;
         this.var_1930 = param4;
         this.var_1652 = param5;
         this._status = param6;
         this.var_2318 = param7;
         this.var_1662 = param8;
      }
      
      public function dispose() : void
      {
         if(this.var_40)
         {
            this.var_40.dispose();
            this.var_40 = null;
         }
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2364;
      }
      
      public function get stuffData() : String
      {
         return this.var_1930;
      }
      
      public function get price() : int
      {
         return this.var_1652;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2318;
      }
      
      public function get image() : BitmapData
      {
         return this.var_40;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(this.var_40 != null)
         {
            this.var_40.dispose();
         }
         this.var_40 = param1;
      }
      
      public function set imageCallback(param1:int) : void
      {
         this.var_2363 = param1;
      }
      
      public function get imageCallback() : int
      {
         return this.var_2363;
      }
      
      public function get status() : int
      {
         return this._status;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2365;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         this.var_2365 = param1;
      }
      
      public function set price(param1:int) : void
      {
         this.var_1652 = param1;
      }
      
      public function set offerId(param1:int) : void
      {
         this._offerId = param1;
      }
      
      public function get offerCount() : int
      {
         return this.var_1662;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_1662 = param1;
      }
   }
}
