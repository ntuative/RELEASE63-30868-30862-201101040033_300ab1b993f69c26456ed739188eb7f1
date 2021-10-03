package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var _name:String;
      
      private var var_404:IAsset;
      
      private var var_1422:Boolean;
      
      private var var_1421:Boolean;
      
      private var _offsetX:int;
      
      private var var_1137:int;
      
      private var _width:int;
      
      private var _height:int;
      
      public function GraphicAsset(param1:String, param2:IAsset, param3:Boolean, param4:Boolean, param5:int, param6:int)
      {
         var _loc8_:* = null;
         super();
         this._name = param1;
         var _loc7_:BitmapDataAsset = param2 as BitmapDataAsset;
         if(_loc7_ != null)
         {
            _loc8_ = _loc7_.content as BitmapData;
         }
         if(_loc8_ != null)
         {
            this.var_404 = param2;
            this._width = _loc8_.width;
            this._height = _loc8_.height;
         }
         else
         {
            this.var_404 = null;
            this._width = 0;
            this._height = 0;
         }
         this.var_1422 = param3;
         this.var_1421 = param4;
         this._offsetX = param5;
         this.var_1137 = param6;
      }
      
      public function dispose() : void
      {
         this.var_404 = null;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1421;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1422;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get asset() : IAsset
      {
         return this.var_404;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1422)
         {
            return this._offsetX;
         }
         return -(this._width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1421)
         {
            return this.var_1137;
         }
         return -(this._height + this.var_1137);
      }
   }
}
