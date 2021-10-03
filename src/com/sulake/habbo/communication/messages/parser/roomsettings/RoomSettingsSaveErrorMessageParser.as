package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1742:int = 1;
      
      public static const const_1807:int = 2;
      
      public static const const_1635:int = 3;
      
      public static const const_1656:int = 4;
      
      public static const const_1314:int = 5;
      
      public static const const_1773:int = 6;
      
      public static const const_1324:int = 7;
      
      public static const const_1510:int = 8;
      
      public static const const_1792:int = 9;
      
      public static const const_1427:int = 10;
      
      public static const const_1505:int = 11;
      
      public static const const_1485:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1502:int;
      
      private var var_1262:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1502 = param1.readInteger();
         this.var_1262 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1502;
      }
      
      public function get info() : String
      {
         return this.var_1262;
      }
   }
}
