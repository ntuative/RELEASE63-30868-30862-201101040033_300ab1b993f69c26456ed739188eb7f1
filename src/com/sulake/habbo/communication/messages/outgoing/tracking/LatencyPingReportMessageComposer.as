package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2510:int;
      
      private var var_2509:int;
      
      private var var_2511:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2510 = param1;
         this.var_2509 = param2;
         this.var_2511 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2510,this.var_2509,this.var_2511];
      }
      
      public function dispose() : void
      {
      }
   }
}
