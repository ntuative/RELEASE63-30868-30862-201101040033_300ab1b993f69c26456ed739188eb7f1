package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_857:int = 20;
      
      private static const const_558:int = 10;
      
      private static const const_1208:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
      
      private static const ANIMATION_ID_OFF:int = 30;
       
      
      private var var_288:Array;
      
      private var var_678:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_288 = new Array();
         super();
         super.setAnimation(ANIMATION_ID_OFF);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_678)
            {
               this.var_678 = true;
               this.var_288 = new Array();
               this.var_288.push(const_1208);
               this.var_288.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_558)
         {
            if(this.var_678)
            {
               this.var_678 = false;
               this.var_288 = new Array();
               if(_direction == 2)
               {
                  this.var_288.push(const_857 + 5 - param1);
                  this.var_288.push(const_558 + 5 - param1);
               }
               else
               {
                  this.var_288.push(const_857 + param1);
                  this.var_288.push(const_558 + param1);
               }
               this.var_288.push(ANIMATION_ID_OFF);
               return;
            }
            super.setAnimation(ANIMATION_ID_OFF);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(11))
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
