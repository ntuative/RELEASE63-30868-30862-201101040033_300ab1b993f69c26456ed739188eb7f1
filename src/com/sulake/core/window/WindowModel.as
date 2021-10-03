package com.sulake.core.window
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.utils.IRectLimiter;
   import com.sulake.core.window.utils.WindowRectLimits;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowModel implements IDisposable
   {
       
      
      protected var var_11:Rectangle;
      
      protected var var_355:Rectangle;
      
      protected var var_56:Rectangle;
      
      protected var var_132:Rectangle;
      
      protected var var_133:Rectangle;
      
      protected var var_70:WindowRectLimits;
      
      protected var var_15:WindowContext;
      
      protected var var_418:Boolean = false;
      
      protected var var_220:uint = 16777215;
      
      protected var var_515:uint;
      
      protected var var_419:uint = 10;
      
      protected var var_776:Boolean = true;
      
      protected var var_356:Boolean = true;
      
      protected var var_687:Number = 1.0;
      
      protected var var_19:uint;
      
      protected var _state:uint;
      
      protected var var_78:uint;
      
      protected var _type:uint;
      
      protected var var_37:String = "";
      
      protected var _name:String;
      
      protected var _id:uint;
      
      protected var var_775:Array;
      
      protected var _disposed:Boolean = false;
      
      public function WindowModel(param1:uint, param2:String, param3:uint, param4:uint, param5:uint, param6:WindowContext, param7:Rectangle, param8:Array = null)
      {
         super();
         this._id = param1;
         this._name = param2;
         this._type = param3;
         this.var_19 = param5;
         this._state = WindowState.const_89;
         this.var_78 = param4;
         this.var_775 = param8 == null ? new Array() : param8;
         this.var_15 = param6;
         this.var_11 = param7.clone();
         this.var_355 = param7.clone();
         this.var_56 = param7.clone();
         this.var_132 = new Rectangle();
         this.var_133 = null;
         this.var_70 = new WindowRectLimits(this as IWindow);
      }
      
      public function get x() : int
      {
         return this.var_11.x;
      }
      
      public function get y() : int
      {
         return this.var_11.y;
      }
      
      public function get width() : int
      {
         return this.var_11.width;
      }
      
      public function get height() : int
      {
         return this.var_11.height;
      }
      
      public function get position() : Point
      {
         return this.var_11.topLeft;
      }
      
      public function get rectangle() : Rectangle
      {
         return this.var_11;
      }
      
      public function get limits() : IRectLimiter
      {
         return this.var_70;
      }
      
      public function get context() : IWindowContext
      {
         return this.var_15;
      }
      
      public function get mouseTreshold() : uint
      {
         return this.var_419;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get background() : Boolean
      {
         return this.var_418;
      }
      
      public function get clipping() : Boolean
      {
         return this.var_776;
      }
      
      public function get visible() : Boolean
      {
         return this.var_356;
      }
      
      public function get color() : uint
      {
         return this.var_220;
      }
      
      public function get alpha() : uint
      {
         return this.var_515 >>> 24;
      }
      
      public function get blend() : Number
      {
         return this.var_687;
      }
      
      public function get param() : uint
      {
         return this.var_19;
      }
      
      public function get state() : uint
      {
         return this._state;
      }
      
      public function get style() : uint
      {
         return this.var_78;
      }
      
      public function get type() : uint
      {
         return this._type;
      }
      
      public function get caption() : String
      {
         return this.var_37;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get id() : uint
      {
         return this._id;
      }
      
      public function get tags() : Array
      {
         return this.var_775;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_11 = null;
            this.var_15 = null;
            this._state = WindowState.const_500;
            this.var_775 = null;
         }
      }
      
      public function invalidate(param1:Rectangle = null) : void
      {
      }
      
      public function getInitialWidth() : int
      {
         return this.var_355.width;
      }
      
      public function getInitialHeight() : int
      {
         return this.var_355.height;
      }
      
      public function getPreviousWidth() : int
      {
         return this.var_56.width;
      }
      
      public function getPreviousHeight() : int
      {
         return this.var_56.height;
      }
      
      public function getMinimizedWidth() : int
      {
         return this.var_132.width;
      }
      
      public function getMinimizedHeight() : int
      {
         return this.var_132.height;
      }
      
      public function getMaximizedWidth() : int
      {
         return this.var_133.width;
      }
      
      public function getMaximizedHeight() : int
      {
         return this.var_133.height;
      }
      
      public function hasMaxWidth() : Boolean
      {
         return this.var_70.maxWidth < int.MAX_VALUE;
      }
      
      public function getMaxWidth() : int
      {
         return this.var_70.maxWidth;
      }
      
      public function setMaxWidth(param1:int) : int
      {
         var _loc2_:int = this.var_70.maxWidth;
         this.var_70.maxWidth = param1;
         return _loc2_;
      }
      
      public function hasMinWidth() : Boolean
      {
         return this.var_70.minWidth > int.MIN_VALUE;
      }
      
      public function getMinWidth() : int
      {
         return this.var_70.minWidth;
      }
      
      public function setMinWidth(param1:int) : int
      {
         var _loc2_:int = this.var_70.minWidth;
         this.var_70.minWidth = param1;
         return _loc2_;
      }
      
      public function hasMaxHeight() : Boolean
      {
         return this.var_70.maxHeight < int.MAX_VALUE;
      }
      
      public function getMaxHeight() : int
      {
         return this.var_70.maxHeight;
      }
      
      public function setMaxHeight(param1:int) : int
      {
         var _loc2_:int = this.var_70.maxHeight;
         this.var_70.maxHeight = param1;
         return _loc2_;
      }
      
      public function hasMinHeight() : Boolean
      {
         return this.var_70.minHeight > int.MIN_VALUE;
      }
      
      public function getMinHeight() : int
      {
         return this.var_70.minHeight;
      }
      
      public function method_10(param1:int) : int
      {
         var _loc2_:int = this.var_70.minHeight;
         this.var_70.minHeight = param1;
         return _loc2_;
      }
      
      public function testTypeFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this._type & param2 ^ param1) == 0;
         }
         return (this._type & param1) == param1;
      }
      
      public function testStateFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this._state & param2 ^ param1) == 0;
         }
         return (this._state & param1) == param1;
      }
      
      public function testStyleFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this.var_78 & param2 ^ param1) == 0;
         }
         return (this.var_78 & param1) == param1;
      }
      
      public function testParamFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this.var_19 & param2 ^ param1) == 0;
         }
         return (this.var_19 & param1) == param1;
      }
   }
}
