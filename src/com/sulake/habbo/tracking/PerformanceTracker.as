package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var _connection:IConnection = null;
      
      private var _configuration:IHabboConfigurationManager = null;
      
      private var var_518:int = 0;
      
      private var var_425:Number = 0;
      
      private var var_2688:Array;
      
      private var var_1214:String = "";
      
      private var var_1474:String = "";
      
      private var var_1961:String = "";
      
      private var var_1959:String = "";
      
      private var var_1463:Boolean = false;
      
      private var var_1473:GarbageMonitor = null;
      
      private var var_1212:int = 0;
      
      private var var_1979:Boolean;
      
      private var var_1476:int = 1000;
      
      private var var_1213:int = 0;
      
      private var _reportInterval:int = 60;
      
      private var var_1477:int = 0;
      
      private var var_1475:int = 10;
      
      private var var_1211:int = 0;
      
      private var var_1980:Number = 0.15;
      
      private var var_1981:Boolean = true;
      
      private var var_1978:Number = 0;
      
      public function PerformanceTracker()
      {
         this.var_2688 = [];
         super();
         this.var_1474 = Capabilities.version;
         this.var_1961 = Capabilities.os;
         this.var_1463 = Capabilities.isDebugger;
         this.var_1214 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         if(this.var_1214 == null)
         {
            this.var_1214 = "unknown";
         }
         this.var_1473 = new GarbageMonitor();
         this.updateGarbageMonitor();
         this.var_1477 = getTimer();
      }
      
      public function get flashVersion() : String
      {
         return this.var_1474;
      }
      
      public function get averageUpdateInterval() : int
      {
         return this.var_425;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         this.var_1476 = param1;
      }
      
      public function set reportInterval(param1:int) : void
      {
         this._reportInterval = param1;
      }
      
      public function set reportLimit(param1:int) : void
      {
         this.var_1475 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         this._configuration = param1;
         this._reportInterval = int(this._configuration.getKey("performancetest.interval","60"));
         this.var_1476 = int(this._configuration.getKey("performancetest.slowupdatelimit","1000"));
         this.var_1475 = int(this._configuration.getKey("performancetest.reportlimit","10"));
         this.var_1980 = Number(this._configuration.getKey("performancetest.distribution.deviancelimit.percent","10"));
         this.var_1981 = Boolean(int(this._configuration.getKey("performancetest.distribution.enabled","1")));
         this.var_1979 = Boolean(this._configuration.getKey("monitor.garbage.collection","0") == "1");
      }
      
      public function dispose() : void
      {
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.var_1473.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            this.var_1473.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function update(param1:uint, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:Boolean = false;
         var _loc7_:Number = NaN;
         if(this.var_1979)
         {
            _loc4_ = this.updateGarbageMonitor();
            if(_loc4_ != null)
            {
               ++this.var_1212;
               Logger.log("Garbage collection");
            }
         }
         var _loc3_:Boolean = false;
         if(param1 > this.var_1476)
         {
            ++this.var_1213;
            _loc3_ = true;
         }
         else
         {
            ++this.var_518;
            if(this.var_518 <= 1)
            {
               this.var_425 = param1;
            }
            else
            {
               _loc5_ = Number(this.var_518);
               this.var_425 = this.var_425 * (_loc5_ - 1) / _loc5_ + Number(param1) / _loc5_;
            }
         }
         if(param2 - this.var_1477 > this._reportInterval * 1000 && this.var_1211 < this.var_1475)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / this.var_425);
            _loc6_ = true;
            if(this.var_1981 && this.var_1211 > 0)
            {
               _loc7_ = this.differenceInPercents(this.var_1978,this.var_425);
               if(_loc7_ < this.var_1980)
               {
                  _loc6_ = false;
               }
            }
            this.var_1477 = param2;
            if(_loc6_ || _loc3_)
            {
               this.var_1978 = this.var_425;
               if(this.sendReport(param2))
               {
                  ++this.var_1211;
               }
            }
         }
      }
      
      private function sendReport(param1:int) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this._connection != null)
         {
            _loc2_ = null;
            _loc3_ = param1 / 1000;
            _loc4_ = -1;
            _loc5_ = 0;
            _loc2_ = new PerformanceLogMessageComposer(_loc3_,this.var_1214,this.var_1474,this.var_1961,this.var_1959,this.var_1463,_loc5_,_loc4_,this.var_1212,this.var_425,this.var_1213);
            this._connection.send(_loc2_);
            this.var_1212 = 0;
            this.var_425 = 0;
            this.var_518 = 0;
            this.var_1213 = 0;
            return true;
         }
         return false;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
   }
}
