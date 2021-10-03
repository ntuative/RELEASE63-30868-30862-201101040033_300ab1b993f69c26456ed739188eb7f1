package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.enum.LinkTarget;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowLinkEvent;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.events.Event;
   import flash.events.TextEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.TextFieldType;
   
   public class HTMLTextController extends TextFieldController implements IHTMLTextWindow
   {
      
      private static var var_933:String = LinkTarget.const_31;
      
      private static const const_886:Array = [LinkTarget.const_31,LinkTarget.const_1289,LinkTarget.PARENT,LinkTarget.SELF,LinkTarget.TOP];
       
      
      private var var_932:String = null;
      
      public function HTMLTextController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         this.immediateClickMode = true;
         _field.type = TextFieldType.DYNAMIC;
         _field.mouseEnabled = true;
         _field.selectable = false;
      }
      
      public static function set defaultLinkTarget(param1:String) : void
      {
         var_933 = param1;
      }
      
      public static function get defaultLinkTarget() : String
      {
         return var_933;
      }
      
      private static function convertLinksToEvents(param1:String) : String
      {
         var _loc2_:* = null;
         _loc2_ = /<a[^>]+(http:\/\/[^"']+)['"][^>]*>([^<>]*)<\/a>/gi;
         param1 = param1.replace(_loc2_,"<a href=\'event:$1\'>$2</a>");
         _loc2_ = /<a[^>]+(https:\/\/[^"']+)['"][^>]*>([^<>]*)<\/a>/gi;
         return param1.replace(_loc2_,"<a href=\'event:$1\'>$2</a>");
      }
      
      private static function openWebPage(param1:String, param2:String) : void
      {
         var _loc4_:* = null;
         if(param2 == null)
         {
            param2 = var_933;
         }
         var _loc3_:URLRequest = new URLRequest(param1);
         if(true)
         {
            navigateToURL(_loc3_,param2);
         }
         else
         {
            _loc4_ = String(ExternalInterface.call("function() { return navigator.userAgent; }")).toLowerCase();
            if(_loc4_.indexOf("firefox") > -1 || _loc4_.indexOf("msie") > -1 && uint(_loc4_.substr(_loc4_.indexOf("msie") + 5,3)) >= 7)
            {
               ExternalInterface.call("window.open",_loc3_.url,param2);
            }
            else
            {
               navigateToURL(_loc3_,param2);
            }
         }
      }
      
      public function set linkTarget(param1:String) : void
      {
         if(const_886.indexOf(param1) > -1)
         {
            this.var_932 = param1;
         }
      }
      
      public function get linkTarget() : String
      {
         return this.var_932 == LinkTarget.const_31 ? defaultLinkTarget : this.var_932;
      }
      
      override public function set immediateClickMode(param1:Boolean) : void
      {
         if(param1 != var_949)
         {
            super.immediateClickMode = param1;
            if(var_949)
            {
               _field.addEventListener(TextEvent.LINK,this.immediateClickHandler);
            }
            else
            {
               _field.removeEventListener(TextEvent.LINK,this.immediateClickHandler);
            }
         }
      }
      
      override public function set text(param1:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_114)
         {
            context.removeLocalizationListener(var_37,this);
            var_114 = false;
         }
         var_37 = param1;
         if(var_37.charAt(0) == "$" && var_37.charAt(1) == "{")
         {
            context.registerLocalizationListener(var_37.slice(2,var_37.indexOf("}")),this);
            var_114 = true;
         }
         else if(_field != null)
         {
            _field.htmlText = convertLinksToEvents(var_37);
            refreshTextImage();
         }
      }
      
      override public function set localization(param1:String) : void
      {
         if(param1 != null && _field != null)
         {
            _field.htmlText = convertLinksToEvents(param1);
            refreshTextImage();
         }
      }
      
      override public function set htmlText(param1:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_114)
         {
            context.removeLocalizationListener(var_37,this);
            var_114 = false;
         }
         var_37 = param1;
         if(var_37.charAt(0) == "$" && var_37.charAt(1) == "{")
         {
            context.registerLocalizationListener(var_37.slice(2,var_37.indexOf("}")),this);
            var_114 = true;
         }
         else if(_field != null)
         {
            _field.htmlText = convertLinksToEvents(var_37);
            refreshTextImage();
         }
      }
      
      override protected function immediateClickHandler(param1:Event) : void
      {
         var _loc2_:* = null;
         if(param1 is TextEvent)
         {
            _loc2_ = new WindowLinkEvent(TextEvent(param1).text,this,null);
            dispatchEvent(_loc2_);
            if(!_loc2_.isWindowOperationPrevented())
            {
               if(procedure != null)
               {
                  procedure(_loc2_,this);
               }
            }
            if(!_loc2_.isWindowOperationPrevented())
            {
               openWebPage(TextEvent(param1).text,this.linkTarget);
            }
            param1.stopImmediatePropagation();
         }
         else
         {
            super.immediateClickHandler(param1);
         }
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         _loc1_.push(new PropertyStruct("link_target",this.var_932,PropertyStruct.const_84,this.var_932 != null,const_886));
         return _loc1_;
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            if(_loc2_.key == "link_target")
            {
               this.var_932 = _loc2_.value as String;
               break;
            }
         }
         super.properties = param1;
      }
   }
}
