package com.sulake.core.window.services
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IToolTipAgentService
   {
       
      
      protected var var_1190:String;
      
      protected var var_258:IToolTipWindow;
      
      protected var var_353:Timer;
      
      protected var var_1189:Point;
      
      protected var var_1188:Point;
      
      protected var var_1448:uint;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         this.var_1188 = new Point();
         this.var_1189 = new Point(20,20);
         this.var_1448 = 500;
         super(param1);
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               this.var_1190 = IInteractiveWindow(param1).toolTipCaption;
               this.var_1448 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               this.var_1190 = param1.caption;
               this.var_1448 = 500;
            }
            _mouse.x = var_131.mouseX;
            _mouse.y = var_131.mouseY;
            getMousePositionRelativeTo(param1,_mouse,this.var_1188);
            if(this.var_1190 != null && this.var_1190 != "")
            {
               if(this.var_353 == null)
               {
                  this.var_353 = new Timer(this.var_1448,1);
                  this.var_353.addEventListener(TimerEvent.TIMER,this.showToolTip);
               }
               this.var_353.reset();
               this.var_353.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(this.var_353 != null)
         {
            this.var_353.stop();
            this.var_353.removeEventListener(TimerEvent.TIMER,this.showToolTip);
            this.var_353 = null;
         }
         this.hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,this.var_1188);
            if(this.var_258 != null && !this.var_258.disposed)
            {
               this.var_258.x = param1 + this.var_1189.x;
               this.var_258.y = param2 + this.var_1189.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(this.var_353 != null)
         {
            this.var_353.reset();
         }
         if(_window && true)
         {
            if(this.var_258 == null || this.var_258.disposed)
            {
               this.var_258 = _window.context.create("undefined::ToolTip",this.var_1190,WindowType.const_376,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            this.var_258.x = _loc2_.x + this.var_1188.x + this.var_1189.x;
            this.var_258.y = _loc2_.y + this.var_1188.y + this.var_1189.y;
         }
      }
      
      protected function hideToolTip() : void
      {
         if(this.var_258 != null && !this.var_258.disposed)
         {
            this.var_258.destroy();
            this.var_258 = null;
         }
      }
   }
}
