package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_857:int = 20;
      
      private static const const_558:int = 9;
      
      private static const ANIMATION_ID_ROLL:int = -1;
       
      
      private var var_288:Array;
      
      private var var_678:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         this.var_288 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_678)
            {
               this.var_678 = true;
               this.var_288 = new Array();
               this.var_288.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_678)
            {
               this.var_678 = false;
               this.var_288 = new Array();
               this.var_288.push(const_857);
               this.var_288.push(const_558 + param1);
               this.var_288.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(0))
         {
            if(this.var_288.length > 0)
            {
               super.setAnimation(this.var_288.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
