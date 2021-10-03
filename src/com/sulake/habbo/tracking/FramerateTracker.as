package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1477:int;
      
      private var var_2265:int;
      
      private var var_1044:int;
      
      private var var_425:Number;
      
      private var var_2264:Boolean;
      
      private var var_2266:int;
      
      private var var_1617:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2265 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2266 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2264 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++this.var_1044;
         if(this.var_1044 == 1)
         {
            this.var_425 = param1;
            this.var_1477 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_1044);
            this.var_425 = this.var_425 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2264 && param3 - this.var_1477 >= this.var_2265 && this.var_1617 < this.var_2266)
         {
            _loc5_ = 1000 / this.var_425;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++this.var_1617;
            this.var_1477 = param3;
            this.var_1044 = 0;
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
