package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1363:String = "WN_CRETAE";
      
      public static const const_1450:String = "WN_CREATED";
      
      public static const const_1071:String = "WN_DESTROY";
      
      public static const const_933:String = "WN_DESTROYED";
      
      public static const const_1050:String = "WN_OPEN";
      
      public static const const_1119:String = "WN_OPENED";
      
      public static const const_1022:String = "WN_CLOSE";
      
      public static const const_989:String = "WN_CLOSED";
      
      public static const const_1095:String = "WN_FOCUS";
      
      public static const const_982:String = "WN_FOCUSED";
      
      public static const const_1081:String = "WN_UNFOCUS";
      
      public static const const_958:String = "WN_UNFOCUSED";
      
      public static const const_1118:String = "WN_ACTIVATE";
      
      public static const const_331:String = "WN_ACTVATED";
      
      public static const const_1031:String = "WN_DEACTIVATE";
      
      public static const const_1036:String = "WN_DEACTIVATED";
      
      public static const const_486:String = "WN_SELECT";
      
      public static const const_313:String = "WN_SELECTED";
      
      public static const const_753:String = "WN_UNSELECT";
      
      public static const const_736:String = "WN_UNSELECTED";
      
      public static const const_1049:String = "WN_LOCK";
      
      public static const const_1087:String = "WN_LOCKED";
      
      public static const const_902:String = "WN_UNLOCK";
      
      public static const const_931:String = "WN_UNLOCKED";
      
      public static const const_951:String = "WN_ENABLE";
      
      public static const const_804:String = "WN_ENABLED";
      
      public static const const_908:String = "WN_DISABLE";
      
      public static const const_754:String = "WN_DISABLED";
      
      public static const const_788:String = "WN_RESIZE";
      
      public static const const_169:String = "WN_RESIZED";
      
      public static const const_1029:String = "WN_RELOCATE";
      
      public static const const_512:String = "WN_RELOCATED";
      
      public static const const_1111:String = "WN_MINIMIZE";
      
      public static const const_897:String = "WN_MINIMIZED";
      
      public static const const_973:String = "WN_MAXIMIZE";
      
      public static const const_938:String = "WN_MAXIMIZED";
      
      public static const const_1080:String = "WN_RESTORE";
      
      public static const const_1122:String = "WN_RESTORED";
      
      public static const const_1795:String = "WN_ARRANGE";
      
      public static const const_1598:String = "WN_ARRANGED";
      
      public static const const_1643:String = "WN_UPDATE";
      
      public static const const_1669:String = "WN_UPDATED";
      
      public static const const_353:String = "WN_CHILD_ADDED";
      
      public static const const_632:String = "WN_CHILD_REMOVED";
      
      public static const WINDOW_NOTIFY_CHILD_RESIZED:String = "WN_CHILD_RESIZED";
      
      public static const const_273:String = "WN_CHILD_RELOCATED";
      
      public static const const_198:String = "WN_CHILD_ACTIVATED";
      
      public static const const_416:String = "WN_PARENT_ADDED";
      
      public static const const_981:String = "WN_PARENT_REMOVED";
      
      public static const const_464:String = "WN_PARENT_RESIZED";
      
      public static const const_900:String = "WN_PARENT_RELOCATED";
      
      public static const const_684:String = "WN_PARENT_ACTIVATED";
      
      public static const const_543:String = "WN_STATE_UPDATED";
      
      public static const const_517:String = "WN_STYLE_UPDATED";
      
      public static const const_489:String = "WN_PARAM_UPDATED";
      
      public static const const_1601:String = "";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1939,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
   }
}
