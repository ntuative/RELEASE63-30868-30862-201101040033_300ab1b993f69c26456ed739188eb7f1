package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_464:WallRasterizer;
      
      private var var_465:FloorRasterizer;
      
      private var var_697:WallAdRasterizer;
      
      private var var_466:LandscapeRasterizer;
      
      private var var_696:PlaneMaskManager;
      
      private var var_755:Boolean = false;
      
      public function RoomVisualizationData()
      {
         super();
         this.var_464 = new WallRasterizer();
         this.var_465 = new FloorRasterizer();
         this.var_697 = new WallAdRasterizer();
         this.var_466 = new LandscapeRasterizer();
         this.var_696 = new PlaneMaskManager();
      }
      
      public function get initialized() : Boolean
      {
         return this.var_755;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return this.var_465;
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return this.var_464;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return this.var_697;
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return this.var_466;
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return this.var_696;
      }
      
      public function dispose() : void
      {
         if(this.var_464 != null)
         {
            this.var_464.dispose();
            this.var_464 = null;
         }
         if(this.var_465 != null)
         {
            this.var_465.dispose();
            this.var_465 = null;
         }
         if(this.var_697 != null)
         {
            this.var_697.dispose();
            this.var_697 = null;
         }
         if(this.var_466 != null)
         {
            this.var_466.dispose();
            this.var_466 = null;
         }
         if(this.var_696 != null)
         {
            this.var_696.dispose();
            this.var_696 = null;
         }
      }
      
      public function clearCache() : void
      {
         if(this.var_464 != null)
         {
            this.var_464.clearCache();
         }
         if(this.var_465 != null)
         {
            this.var_465.clearCache();
         }
         if(this.var_466 != null)
         {
            this.var_466.clearCache();
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         this.reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            this.var_464.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            this.var_465.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            this.var_697.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            this.var_466.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            this.var_696.initialize(_loc11_);
         }
         return true;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(this.var_755)
         {
            return;
         }
         this.var_464.initializeAssetCollection(param1);
         this.var_465.initializeAssetCollection(param1);
         this.var_697.initializeAssetCollection(param1);
         this.var_466.initializeAssetCollection(param1);
         this.var_696.initializeAssetCollection(param1);
         this.var_755 = true;
      }
      
      protected function reset() : void
      {
      }
   }
}
