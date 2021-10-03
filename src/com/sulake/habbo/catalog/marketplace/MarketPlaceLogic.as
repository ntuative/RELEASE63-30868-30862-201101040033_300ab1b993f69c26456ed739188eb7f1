package com.sulake.habbo.catalog.marketplace
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOffer;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOffersEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOwnOffersEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceBuyOfferResultEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceCancelOfferResultEvent;
   import com.sulake.habbo.communication.messages.outgoing.marketplace.GetMarketplaceConfigurationMessageComposer;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketPlaceOffersParser;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketPlaceOwnOffersParser;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceBuyOfferResultParser;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceCancelOfferResultParser;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class MarketPlaceLogic implements IMarketPlace
   {
      
      private static const const_1160:String = "poster";
       
      
      public const const_1823:int = 1;
      
      public const const_1693:int = 2;
      
      public const const_1878:int = 3;
      
      private var _catalog:IHabboCatalog;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _roomEngine:IRoomEngine;
      
      private var _visualization:IMarketPlaceVisualization;
      
      private var var_189:MarketplaceConfirmationDialog;
      
      private var var_157:Map;
      
      private var var_193:Map;
      
      private var var_2130:int;
      
      private var var_2135:int = -1;
      
      private var var_2132:MarketplaceItemStats;
      
      private var var_2131:int;
      
      private var var_2134:int;
      
      private var var_2137:int = 0;
      
      private var var_2138:int = 0;
      
      private var var_2136:String = "";
      
      private var var_2133:int = -1;
      
      public function MarketPlaceLogic(param1:IHabboCatalog, param2:IHabboWindowManager, param3:IRoomEngine)
      {
         super();
         this._catalog = param1;
         this._windowManager = param2;
         this._roomEngine = param3;
         this.getConfiguration();
      }
      
      public function dispose() : void
      {
         this._catalog = null;
         this._windowManager = null;
         var _loc1_:* = null;
         if(this.var_157)
         {
            for each(_loc1_ in this.var_157)
            {
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
            }
            this.var_157.dispose();
            this.var_157 = null;
         }
         if(this.var_193)
         {
            for each(_loc1_ in this.var_193)
            {
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
            }
            this.var_193.dispose();
            this.var_193 = null;
         }
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get localization() : ICoreLocalizationManager
      {
         return this._catalog.localization;
      }
      
      public function registerVisualization(param1:IMarketPlaceVisualization = null) : void
      {
         if(param1 == null)
         {
            return;
         }
         this._visualization = param1;
      }
      
      private function getConfiguration() : void
      {
         if(!this._catalog || !this._catalog.connection)
         {
            return;
         }
         this._catalog.connection.send(new GetMarketplaceConfigurationMessageComposer());
      }
      
      private function showConfirmation(param1:int, param2:MarketPlaceOfferData) : void
      {
         if(!this.var_189)
         {
            this.var_189 = new MarketplaceConfirmationDialog(this,this._catalog,this._roomEngine);
         }
         this.var_189.showConfirmation(param1,param2);
      }
      
      public function requestOffersByName(param1:String) : void
      {
         this._catalog.getPublicMarketPlaceOffers(-1,-1,param1,-1);
      }
      
      public function requestOffersByPrice(param1:int) : void
      {
         this._catalog.getPublicMarketPlaceOffers(param1,-1,"",-1);
      }
      
      public function requestOffers(param1:int, param2:int, param3:String, param4:int) : void
      {
         this.var_2137 = param1;
         this.var_2138 = param2;
         this.var_2136 = param3;
         this.var_2133 = param4;
         if(this._catalog)
         {
            this._catalog.getPublicMarketPlaceOffers(param1,param2,param3,param4);
         }
      }
      
      public function refreshOffers() : void
      {
         this.requestOffers(this.var_2137,this.var_2138,this.var_2136,this.var_2133);
      }
      
      public function requestOwnItems() : void
      {
         this._catalog.getOwnMarketPlaceOffers();
      }
      
      public function requestItemStats(param1:int, param2:int) : void
      {
         if(this._catalog)
         {
            this.var_2134 = param2;
            this.var_2131 = param1;
            this._catalog.getMarketplaceItemStats(param1,param2);
         }
      }
      
      public function buyOffer(param1:int) : void
      {
         if(!this.var_157 || !this._catalog || !this._catalog.getPurse())
         {
            return;
         }
         var _loc2_:MarketPlaceOfferData = this.var_157.getValue(param1) as MarketPlaceOfferData;
         if(!_loc2_)
         {
            return;
         }
         if(this._catalog.getPurse().credits < _loc2_.price)
         {
            this._catalog.showNotEnoughCreditsAlert();
            return;
         }
         this.showConfirmation(this.const_1823,_loc2_);
      }
      
      public function redeemExpiredOffer(param1:int) : void
      {
         this._catalog.redeemExpiredMarketPlaceOffer(param1);
      }
      
      public function redeemSoldOffers() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc1_:Array = this.var_193.getKeys();
         for each(_loc2_ in _loc1_)
         {
            _loc3_ = this.var_193.getValue(_loc2_);
            if(_loc3_.status == MarketPlaceOfferState.const_425)
            {
               this.var_193.remove(_loc2_);
               _loc3_.dispose();
            }
         }
         this._catalog.redeemSoldMarketPlaceOffers();
         this._visualization.listUpdatedNotify();
      }
      
      public function onOffers(param1:IMessageEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:MarketPlaceOffersEvent = param1 as MarketPlaceOffersEvent;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:MarketPlaceOffersParser = _loc2_.getParser() as MarketPlaceOffersParser;
         if(_loc3_ == null)
         {
            return;
         }
         if(this.var_157)
         {
            for each(_loc5_ in this.var_157)
            {
               if(_loc5_ != null)
               {
                  _loc5_.dispose();
               }
            }
            this.var_157.dispose();
         }
         this.var_157 = new Map();
         for each(_loc4_ in _loc3_.offers)
         {
            _loc6_ = new MarketPlaceOfferData(_loc4_.offerId,_loc4_.furniId,_loc4_.furniType,_loc4_.stuffData,_loc4_.price,_loc4_.status,_loc4_.averagePrice,_loc4_.offerCount);
            _loc6_.timeLeftMinutes = _loc4_.timeLeftMinutes;
            this.var_157.add(_loc4_.offerId,_loc6_);
         }
         if(this._visualization == null)
         {
            return;
         }
         this._visualization.listUpdatedNotify();
      }
      
      public function onOwnOffers(param1:IMessageEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:MarketPlaceOwnOffersEvent = param1 as MarketPlaceOwnOffersEvent;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:MarketPlaceOwnOffersParser = _loc2_.getParser() as MarketPlaceOwnOffersParser;
         if(_loc3_ == null)
         {
            return;
         }
         if(this.var_193)
         {
            for each(_loc5_ in this.var_193)
            {
               if(_loc5_ != null)
               {
                  _loc5_.dispose();
               }
            }
            this.var_193.dispose();
         }
         this.var_2130 = _loc3_.creditsWaiting;
         this.var_193 = new Map();
         for each(_loc4_ in _loc3_.offers)
         {
            _loc6_ = new MarketPlaceOfferData(_loc4_.offerId,_loc4_.furniId,_loc4_.furniType,_loc4_.stuffData,_loc4_.price,_loc4_.status,_loc4_.averagePrice);
            _loc6_.timeLeftMinutes = _loc4_.timeLeftMinutes;
            this.var_193.add(_loc4_.offerId,_loc6_);
         }
         if(this._visualization == null)
         {
            return;
         }
         this._visualization.listUpdatedNotify();
      }
      
      public function onBuyResult(param1:IMessageEvent) : void
      {
         var item:MarketPlaceOfferData = null;
         var updateItem:MarketPlaceOfferData = null;
         var event:IMessageEvent = param1;
         var buyEvent:MarketplaceBuyOfferResultEvent = event as MarketplaceBuyOfferResultEvent;
         var parser:MarketplaceBuyOfferResultParser = buyEvent.getParser() as MarketplaceBuyOfferResultParser;
         if(parser.result == 1)
         {
            this.refreshOffers();
         }
         else if(parser.result == 2)
         {
            item = this.var_157.remove(parser.requestedOfferId);
            if(item != null)
            {
               item.dispose();
            }
            this._visualization.listUpdatedNotify();
            if(this._windowManager != null)
            {
               this._windowManager.alert("${catalog.marketplace.not_available_title}","${catalog.marketplace.not_available_header}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
            }
         }
         else if(parser.result == 3)
         {
            updateItem = this.var_157.getValue(parser.requestedOfferId) as MarketPlaceOfferData;
            if(updateItem)
            {
               updateItem.offerId = parser.offerId;
               updateItem.price = parser.newPrice;
               --updateItem.offerCount;
               this.var_157.add(parser.offerId,updateItem);
            }
            this.var_157.remove(parser.requestedOfferId);
            this.showConfirmation(this.const_1693,updateItem);
            this._visualization.listUpdatedNotify();
         }
         else if(parser.result == 4)
         {
            if(this._windowManager != null)
            {
               this._windowManager.alert("${catalog.alert.notenough.title}","${catalog.alert.notenough.credits.description}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
            }
         }
      }
      
      public function onCancelResult(param1:IMessageEvent) : void
      {
         var item:MarketPlaceOfferData = null;
         var event:IMessageEvent = param1;
         var cancelEvent:MarketplaceCancelOfferResultEvent = event as MarketplaceCancelOfferResultEvent;
         var parser:MarketplaceCancelOfferResultParser = cancelEvent.getParser() as MarketplaceCancelOfferResultParser;
         if(parser.result == 1)
         {
            item = this.var_193.remove(parser.offerId);
            if(item != null)
            {
               item.dispose();
            }
            this._visualization.listUpdatedNotify();
         }
         else if(parser.result == 0)
         {
            if(this._windowManager != null)
            {
               this._windowManager.alert("${catalog.marketplace.operation_failed.topic}","{{catalog.marketplace.cancel_failed}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
            }
         }
      }
      
      public function latestOffers() : Map
      {
         return this.var_157;
      }
      
      public function latestOwnOffers() : Map
      {
         return this.var_193;
      }
      
      public function set itemStats(param1:MarketplaceItemStats) : void
      {
         if(param1.furniCategoryId != this.var_2131 || param1.furniTypeId != this.var_2134)
         {
            return;
         }
         this.var_2132 = param1;
         if(this._visualization)
         {
            this._visualization.updateStats();
         }
      }
      
      public function get itemStats() : MarketplaceItemStats
      {
         return this.var_2132;
      }
      
      public function get creditsWaiting() : int
      {
         return this.var_2130;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2135;
      }
      
      public function set averagePricePeriod(param1:int) : void
      {
         this.var_2135 = param1;
      }
      
      private function isPosterItem(param1:IMarketPlaceOfferData) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:Boolean = false;
         if(param1.furniType == 2 && param1.stuffData != null)
         {
            _loc3_ = this._catalog.getFurnitureData(param1.furniId,ProductTypeEnum.const_76);
            if(_loc3_)
            {
               _loc4_ = _loc3_.name;
               if(_loc4_ != null && _loc4_ == const_1160)
               {
                  _loc2_ = true;
               }
            }
         }
         return _loc2_;
      }
      
      public function getNameLocalizationKey(param1:IMarketPlaceOfferData) : String
      {
         var _loc2_:* = "";
         if(param1 != null)
         {
            if(this.isPosterItem(param1))
            {
               _loc2_ = "poster_" + param1.stuffData + "_name";
            }
            else
            {
               _loc2_ = "roomItem.name." + param1.furniId;
            }
         }
         return _loc2_;
      }
      
      public function getDescriptionLocalizationKey(param1:IMarketPlaceOfferData) : String
      {
         var _loc2_:* = "";
         if(param1 != null)
         {
            if(this.isPosterItem(param1))
            {
               _loc2_ = "poster_" + param1.stuffData + "_desc";
            }
            else
            {
               _loc2_ = "roomItem.desc." + param1.furniId;
            }
         }
         return _loc2_;
      }
   }
}
