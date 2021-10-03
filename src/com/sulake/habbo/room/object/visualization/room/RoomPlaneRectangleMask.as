package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2007:Number = 0.0;
      
      private var var_2006:Number = 0.0;
      
      private var var_2092:Number = 0.0;
      
      private var var_2091:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2007 = param1;
         this.var_2006 = param2;
         this.var_2092 = param3;
         this.var_2091 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2007;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2006;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2092;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2091;
      }
   }
}
