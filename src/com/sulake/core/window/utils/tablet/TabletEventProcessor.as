package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2750:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         var_129 = param1.desktop;
         var_77 = param1.var_1180 as WindowController;
         _lastClickTarget = param1.var_1177 as WindowController;
         var_151 = param1.renderer;
         var_773 = param1.var_1179;
         param2.begin();
         param2.end();
         param1.desktop = var_129;
         param1.var_1180 = var_77;
         param1.var_1177 = _lastClickTarget;
         param1.renderer = var_151;
         param1.var_1179 = var_773;
      }
   }
}
