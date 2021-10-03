package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_580:String = "RWUAM_WHISPER_USER";
      
      public static const const_578:String = "RWUAM_IGNORE_USER";
      
      public static const const_607:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_466:String = "RWUAM_KICK_USER";
      
      public static const const_597:String = "RWUAM_BAN_USER";
      
      public static const const_659:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_695:String = "RWUAM_RESPECT_USER";
      
      public static const const_605:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_818:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_746:String = "RWUAM_START_TRADING";
      
      public static const const_752:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_446:String = "RWUAM_KICK_BOT";
      
      public static const const_656:String = "RWUAM_REPORT";
      
      public static const const_532:String = "RWUAM_PICKUP_PET";
      
      public static const const_1347:String = "RWUAM_TRAIN_PET";
      
      public static const const_528:String = " RWUAM_RESPECT_PET";
      
      public static const const_371:String = "RWUAM_REQUEST_PET_UPDATE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
