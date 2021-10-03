package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2383:XML;
      
      private var var_2380:XML;
      
      private var var_2381:XML;
      
      private var var_862:IWindowContainer;
      
      private var var_586:IButtonWindow;
      
      private var var_2741:IButtonWindow;
      
      private var var_1675:ITextWindow;
      
      private var var_1676:ITextWindow;
      
      private var var_1677:ITextWindow;
      
      private var var_2701:ITextWindow;
      
      private var var_89:Offer;
      
      private var var_2382:String = "";
      
      private var var_1322:Function;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            this.var_2383 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            this.var_2380 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            this.var_2381 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.addEventListener(WidgetEvent.const_1117,this.onSetParameter);
         events.addEventListener(WidgetEvent.CWE_PURCHASE_OVERRIDE,this.onPurchaseOverride);
      }
      
      private function onPurchaseOverride(param1:CatalogWidgetPurchaseOverrideEvent) : void
      {
         this.var_1322 = param1.callback;
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_767:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2383) as IWindowContainer;
               break;
            case Offer.const_907:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2380) as IWindowContainer;
               break;
            case Offer.const_906:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2381) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach..." + this.var_89.priceType);
         }
         if(_loc2_ != null)
         {
            if(this.var_862 != null)
            {
               _window.removeChild(this.var_862);
               this.var_862.dispose();
            }
            this.var_862 = _loc2_;
            _window.addChild(_loc2_);
            this.var_862.x = 0;
            this.var_862.y = 0;
         }
         this.var_1675 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         this.var_1676 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         this.var_1677 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         this.var_2701 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         this.var_586 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(this.var_586 != null)
         {
            if(this.var_1322 != null)
            {
               this.var_586.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1322);
            }
            else
            {
               this.var_586.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1322);
               this.var_586.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPurchase);
            }
            this.var_586.disable();
         }
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         this.var_89 = param1.offer;
         this.attachStub(this.var_89.priceType);
         if(this.var_1675 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(this.var_89.priceInCredits));
            this.var_1675.caption = "${catalog.purchase.price.credits}";
         }
         var _loc3_:String = this.var_89.activityPointType == Purse.const_523 ? "pixels" : "activitypoints";
         if(this.var_1676 != null)
         {
            _loc4_ = "catalog.purchase.price.activitypoints." + this.var_89.activityPointType;
            _loc2_.registerParameter(_loc4_,_loc3_,this.var_89.priceInActivityPoints.toString());
            this.var_1676.caption = _loc2_.getKey(_loc4_);
         }
         if(this.var_1677 != null)
         {
            _loc4_ = "catalog.purchase.price.credits+activitypoints." + this.var_89.activityPointType;
            _loc2_.registerParameter(_loc4_,"credits",String(this.var_89.priceInCredits));
            _loc2_.registerParameter(_loc4_,_loc3_,String(this.var_89.priceInActivityPoints));
            this.var_1677.caption = _loc2_.getKey(_loc4_);
         }
         var _loc5_:IWindow = _window.findChildByName("activity_points_bg");
         if(_loc5_ != null)
         {
            _loc5_.color = this.var_89.activityPointType == 0 ? 6737151 : uint(13421772);
         }
         if(this.var_586 != null)
         {
            this.var_586.enable();
         }
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         this.var_2382 = param1.parameter;
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(this.var_89 != null)
         {
            Logger.log("Init Purchase: " + this.var_89.offerId + " " + this.var_89.localizationId);
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this.var_89,page.pageId,this.var_2382);
         }
      }
   }
}
