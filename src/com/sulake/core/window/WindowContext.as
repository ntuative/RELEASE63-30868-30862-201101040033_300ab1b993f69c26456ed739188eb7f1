package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IMouseCursor;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseCursorControl;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_536:uint = 0;
      
      public static const const_1382:uint = 1;
      
      public static const const_1738:int = 0;
      
      public static const const_1700:int = 1;
      
      public static const const_1801:int = 2;
      
      public static const const_1614:int = 3;
      
      public static const const_1414:int = 4;
      
      public static const const_334:int = 5;
      
      public static var var_1440:IMouseCursor;
      
      public static var var_352:IEventQueue;
      
      private static var var_522:IEventProcessor;
      
      private static var var_1461:uint = const_536;
      
      private static var stage:Stage;
      
      private static var var_151:IWindowRenderer;
       
      
      private var _eventProcessorState:EventProcessorState;
      
      private var var_1955:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_172:DisplayObjectContainer;
      
      protected var var_2726:Boolean = true;
      
      protected var var_1181:Error;
      
      protected var var_1919:int = -1;
      
      protected var var_1182:IInternalWindowServices;
      
      protected var var_1443:IWindowParser;
      
      protected var var_2665:IWindowFactory;
      
      protected var var_129:IDesktopWindow;
      
      protected var var_1442:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_512:Boolean = false;
      
      private var var_1956:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_151 = param2;
         this._localization = param4;
         this.var_172 = param5;
         this.var_1182 = new ServiceManager(this,param5);
         this.var_2665 = param3;
         this.var_1443 = new WindowParser(this);
         this.var_1955 = param7;
         if(!stage)
         {
            if(this.var_172 is Stage)
            {
               stage = this.var_172 as Stage;
            }
            else if(this.var_172.stage)
            {
               stage = this.var_172.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_129 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_172.addChild(this.var_129.getDisplayObject());
         this.var_172.doubleClickEnabled = true;
         this.var_172.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this._eventProcessorState = new EventProcessorState(var_151,this.var_129,this.var_129,null,this.var_1955);
         inputMode = const_536;
         this.var_1442 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1461;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_352)
         {
            if(var_352 is IDisposable)
            {
               IDisposable(var_352).dispose();
            }
         }
         if(var_522)
         {
            if(var_522 is IDisposable)
            {
               IDisposable(var_522).dispose();
            }
         }
         switch(value)
         {
            case const_536:
               var_352 = new MouseEventQueue(stage);
               var_522 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1382:
               var_352 = new TabletEventQueue(stage);
               var_522 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_536;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_172.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_172.removeChild(IGraphicContextHost(this.var_129).getGraphicContext(true) as DisplayObject);
            this.var_129.destroy();
            this.var_129 = null;
            this.var_1442.destroy();
            this.var_1442 = null;
            if(this.var_1182 is IDisposable)
            {
               IDisposable(this.var_1182).dispose();
            }
            this.var_1182 = null;
            this.var_1443.dispose();
            this.var_1443 = null;
            var_151 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1181;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_1919;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1181 = param2;
         this.var_1919 = param1;
         if(this.var_2726)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1181 = null;
         this.var_1919 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1182;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1443;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2665;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_129;
      }
      
      public function getMouseCursor() : IMouseCursor
      {
         if(var_1440 == null)
         {
            var_1440 = new MouseCursorControl(this.var_172);
         }
         return var_1440;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_129.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:Class = Classes.getWindowClassByType(param3);
         if(_loc12_ == null)
         {
            this.handleError(WindowContext.const_1414,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1442;
            }
         }
         var _loc13_:IWindow = new _loc12_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_129,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc13_.caption = param2;
         }
         return _loc13_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_129)
         {
            this.var_129 = null;
         }
         if(param1.state != WindowState.const_500)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_151.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_512 = true;
         if(this.var_1181)
         {
            throw this.var_1181;
         }
         var_522.process(this._eventProcessorState,var_352);
         this.var_512 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_1956 = true;
         var_151.update(param1);
         this.var_1956 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_129 != null && !this.var_129.disposed)
         {
            if(this.var_172 is Stage)
            {
               this.var_129.width = Stage(this.var_172).stageWidth;
               this.var_129.height = Stage(this.var_172).stageHeight;
            }
            else
            {
               this.var_129.width = this.var_172.width;
               this.var_129.height = this.var_172.height;
            }
         }
      }
   }
}
