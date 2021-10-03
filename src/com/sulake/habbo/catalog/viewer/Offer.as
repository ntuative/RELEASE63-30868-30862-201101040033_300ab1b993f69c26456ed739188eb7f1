package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1261:String = "pricing_model_unknown";
      
      public static const const_484:String = "pricing_model_single";
      
      public static const const_508:String = "pricing_model_multi";
      
      public static const const_504:String = "pricing_model_bundle";
      
      public static const const_1396:String = "price_type_none";
      
      public static const const_767:String = "price_type_credits";
      
      public static const const_907:String = "price_type_activitypoints";
      
      public static const const_906:String = "price_type_credits_and_activitypoints";
       
      
      private var var_653:String;
      
      private var var_988:String;
      
      private var _offerId:int;
      
      private var var_1531:String;
      
      private var var_987:int;
      
      private var var_986:int;
      
      private var var_1532:int;
      
      private var var_383:ICatalogPage;
      
      private var var_654:IProductContainer;
      
      private var var_2089:int;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         this._offerId = param1.offerId;
         this.var_1531 = param1.localizationId;
         this.var_987 = param1.priceInCredits;
         this.var_986 = param1.priceInActivityPoints;
         this.var_1532 = param1.activityPointType;
         this.var_383 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         this.analyzePricingModel(_loc3_);
         this.analyzePriceType();
         this.createProductContainer(_loc3_);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_383;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1531;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_987;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_986;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1532;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_654;
      }
      
      public function get pricingModel() : String
      {
         return this.var_653;
      }
      
      public function get priceType() : String
      {
         return this.var_988;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2089;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2089 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1531 = "";
         this.var_987 = 0;
         this.var_986 = 0;
         this.var_1532 = 0;
         this.var_383 = null;
         if(this.var_654 != null)
         {
            this.var_654.dispose();
            this.var_654 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_653)
         {
            case const_484:
               this.var_654 = new SingleProductContainer(this,param1);
               break;
            case const_508:
               this.var_654 = new MultiProductContainer(this,param1);
               break;
            case const_504:
               this.var_654 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_653);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_653 = const_484;
            }
            else
            {
               this.var_653 = const_508;
            }
         }
         else if(param1.length > 1)
         {
            this.var_653 = const_504;
         }
         else
         {
            this.var_653 = const_1261;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_987 > 0 && this.var_986 > 0)
         {
            this.var_988 = const_906;
         }
         else if(this.var_987 > 0)
         {
            this.var_988 = const_767;
         }
         else if(this.var_986 > 0)
         {
            this.var_988 = const_907;
         }
         else
         {
            this.var_988 = const_1396;
         }
      }
   }
}
