package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_1323:String = "WE_CREATE";
      
      public static const const_1507:String = "WE_CREATED";
      
      public static const const_1304:String = "WE_DESTROY";
      
      public static const const_296:String = "WE_DESTROYED";
      
      public static const const_1493:String = "WE_OPEN";
      
      public static const const_1263:String = "WE_OPENED";
      
      public static const const_1282:String = "WE_CLOSE";
      
      public static const const_1294:String = "WE_CLOSED";
      
      public static const const_1390:String = "WE_FOCUS";
      
      public static const const_186:String = "WE_FOCUSED";
      
      public static const const_1281:String = "WE_UNFOCUS";
      
      public static const const_1338:String = "WE_UNFOCUSED";
      
      public static const const_1412:String = "WE_ACTIVATE";
      
      public static const const_1316:String = "WE_ACTIVATED";
      
      public static const const_1502:String = "WE_DEACTIVATE";
      
      public static const const_755:String = "WE_DEACTIVATED";
      
      public static const const_424:String = "WE_SELECT";
      
      public static const const_57:String = "WE_SELECTED";
      
      public static const const_741:String = "WE_UNSELECT";
      
      public static const const_564:String = "WE_UNSELECTED";
      
      public static const const_1659:String = "WE_ATTACH";
      
      public static const const_1663:String = "WE_ATTACHED";
      
      public static const const_1714:String = "WE_DETACH";
      
      public static const const_1752:String = "WE_DETACHED";
      
      public static const const_1461:String = "WE_LOCK";
      
      public static const const_1368:String = "WE_LOCKED";
      
      public static const const_1430:String = "WE_UNLOCK";
      
      public static const const_1312:String = "WE_UNLOCKED";
      
      public static const const_577:String = "WE_ENABLE";
      
      public static const const_272:String = "WE_ENABLED";
      
      public static const const_720:String = "WE_DISABLE";
      
      public static const const_235:String = "WE_DISABLED";
      
      public static const const_1532:String = "WE_RELOCATE";
      
      public static const const_364:String = "WE_RELOCATED";
      
      public static const const_1455:String = "WE_RESIZE";
      
      public static const const_44:String = "WE_RESIZED";
      
      public static const const_1356:String = "WE_MINIMIZE";
      
      public static const const_1364:String = "WE_MINIMIZED";
      
      public static const const_1379:String = "WE_MAXIMIZE";
      
      public static const const_1469:String = "WE_MAXIMIZED";
      
      public static const const_1454:String = "WE_RESTORE";
      
      public static const const_1500:String = "WE_RESTORED";
      
      public static const const_1757:String = "WE_ARRANGE";
      
      public static const const_1609:String = "WE_ARRANGED";
      
      public static const const_96:String = "WE_UPDATE";
      
      public static const const_1611:String = "WE_UPDATED";
      
      public static const const_1689:String = "WE_CHILD_RELOCATE";
      
      public static const const_442:String = "WE_CHILD_RELOCATED";
      
      public static const const_1758:String = "WE_CHILD_RESIZE";
      
      public static const const_285:String = "WE_CHILD_RESIZED";
      
      public static const const_1625:String = "WE_CHILD_REMOVE";
      
      public static const const_530:String = "WE_CHILD_REMOVED";
      
      public static const const_1774:String = "WE_PARENT_RELOCATE";
      
      public static const const_1691:String = "WE_PARENT_RELOCATED";
      
      public static const const_1607:String = "WE_PARENT_RESIZE";
      
      public static const const_1516:String = "WE_PARENT_RESIZED";
      
      public static const const_162:String = "WE_OK";
      
      public static const const_640:String = "WE_CANCEL";
      
      public static const const_109:String = "WE_CHANGE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_510:String = "WE_SCROLL";
      
      public static const const_152:String = "";
       
      
      protected var _type:String = "";
      
      protected var _window:IWindow;
      
      protected var var_1939:IWindow;
      
      protected var var_1940:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_1939 = param3;
         this.var_1940 = false;
         super(param1,param4,param5);
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_1939;
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(this._type,this.window,this.related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            this.var_1940 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1940;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
   }
}
