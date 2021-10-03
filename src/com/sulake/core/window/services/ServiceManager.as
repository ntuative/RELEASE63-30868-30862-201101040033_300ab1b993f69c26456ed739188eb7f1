package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2695:uint;
      
      private var var_131:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_237:IWindowContext;
      
      private var var_1013:IMouseDraggingService;
      
      private var var_1008:IMouseScalingService;
      
      private var var_1011:IMouseListenerService;
      
      private var var_1012:IFocusManagerService;
      
      private var var_1009:IToolTipAgentService;
      
      private var var_1010:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2695 = 0;
         this.var_131 = param2;
         this.var_237 = param1;
         this.var_1013 = new WindowMouseDragger(param2);
         this.var_1008 = new WindowMouseScaler(param2);
         this.var_1011 = new WindowMouseListener(param2);
         this.var_1012 = new FocusManager(param2);
         this.var_1009 = new WindowToolTipAgent(param2);
         this.var_1010 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1013 != null)
         {
            this.var_1013.dispose();
            this.var_1013 = null;
         }
         if(this.var_1008 != null)
         {
            this.var_1008.dispose();
            this.var_1008 = null;
         }
         if(this.var_1011 != null)
         {
            this.var_1011.dispose();
            this.var_1011 = null;
         }
         if(this.var_1012 != null)
         {
            this.var_1012.dispose();
            this.var_1012 = null;
         }
         if(this.var_1009 != null)
         {
            this.var_1009.dispose();
            this.var_1009 = null;
         }
         if(this.var_1010 != null)
         {
            this.var_1010.dispose();
            this.var_1010 = null;
         }
         this.var_131 = null;
         this.var_237 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1013;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1008;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1011;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1012;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1009;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1010;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
