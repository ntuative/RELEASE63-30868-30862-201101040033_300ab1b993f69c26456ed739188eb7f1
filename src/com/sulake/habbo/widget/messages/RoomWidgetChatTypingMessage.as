package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_766:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_549:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_766);
         this.var_549 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_549;
      }
   }
}