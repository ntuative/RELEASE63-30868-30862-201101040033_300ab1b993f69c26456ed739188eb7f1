package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1761:int = 1;
      
      public static const const_1309:int = 2;
       
      
      private var var_944:String;
      
      private var var_2144:int;
      
      private var var_2148:int;
      
      private var var_2150:int;
      
      private var var_2143:int;
      
      private var var_2152:Boolean;
      
      private var var_2151:Boolean;
      
      private var var_2145:int;
      
      private var var_2153:int;
      
      private var var_2147:Boolean;
      
      private var var_2146:int;
      
      private var var_2149:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_944 = param1.readString();
         this.var_2144 = param1.readInteger();
         this.var_2148 = param1.readInteger();
         this.var_2150 = param1.readInteger();
         this.var_2143 = param1.readInteger();
         this.var_2152 = param1.readBoolean();
         this.var_2151 = param1.readBoolean();
         this.var_2145 = param1.readInteger();
         this.var_2153 = param1.readInteger();
         this.var_2147 = param1.readBoolean();
         this.var_2146 = param1.readInteger();
         this.var_2149 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_944;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2144;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2148;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2150;
      }
      
      public function get responseType() : int
      {
         return this.var_2143;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2152;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2151;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2145;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2153;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2147;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2146;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2149;
      }
   }
}
