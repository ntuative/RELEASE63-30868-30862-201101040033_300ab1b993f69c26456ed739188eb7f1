package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1960:int = 0;
      
      private var var_1214:String = "";
      
      private var var_1474:String = "";
      
      private var var_1961:String = "";
      
      private var var_1959:String = "";
      
      private var var_1463:int = 0;
      
      private var var_1962:int = 0;
      
      private var var_1963:int = 0;
      
      private var var_1212:int = 0;
      
      private var var_1964:int = 0;
      
      private var var_1213:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_1960 = param1;
         this.var_1214 = param2;
         this.var_1474 = param3;
         this.var_1961 = param4;
         this.var_1959 = param5;
         if(param6)
         {
            this.var_1463 = 1;
         }
         else
         {
            this.var_1463 = 0;
         }
         this.var_1962 = param7;
         this.var_1963 = param8;
         this.var_1212 = param9;
         this.var_1964 = param10;
         this.var_1213 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1960,this.var_1214,this.var_1474,this.var_1961,this.var_1959,this.var_1463,this.var_1962,this.var_1963,this.var_1212,this.var_1964,this.var_1213];
      }
   }
}
