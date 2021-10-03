package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1718:int = 0;
      
      public static const const_1407:int = 1;
      
      public static const const_1488:int = 2;
      
      public static const const_1652:int = 3;
      
      public static const const_1686:int = 4;
      
      public static const const_1597:int = 5;
      
      public static const const_1405:int = 10;
      
      public static const const_1739:int = 11;
      
      public static const const_1702:int = 12;
      
      public static const const_1771:int = 13;
      
      public static const const_1799:int = 16;
      
      public static const const_1780:int = 17;
      
      public static const const_1685:int = 18;
      
      public static const const_1793:int = 19;
      
      public static const const_1632:int = 20;
      
      public static const const_1682:int = 22;
      
      public static const const_1645:int = 23;
      
      public static const const_1683:int = 24;
      
      public static const const_1704:int = 25;
      
      public static const const_1816:int = 26;
      
      public static const const_1621:int = 27;
      
      public static const const_1800:int = 28;
      
      public static const const_1755:int = 29;
      
      public static const const_1620:int = 100;
      
      public static const const_1737:int = 101;
      
      public static const const_1798:int = 102;
      
      public static const const_1673:int = 103;
      
      public static const const_1746:int = 104;
      
      public static const const_1812:int = 105;
      
      public static const const_1750:int = 106;
      
      public static const const_1776:int = 107;
      
      public static const const_1667:int = 108;
      
      public static const const_1754:int = 109;
      
      public static const const_1612:int = 110;
      
      public static const const_1646:int = 111;
      
      public static const const_1605:int = 112;
      
      public static const const_1734:int = 113;
      
      public static const const_1603:int = 114;
      
      public static const const_1688:int = 115;
      
      public static const const_1672:int = 116;
      
      public static const const_1706:int = 117;
      
      public static const const_1770:int = 118;
      
      public static const const_1636:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1407:
            case const_1405:
               return "banned";
            case const_1488:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
