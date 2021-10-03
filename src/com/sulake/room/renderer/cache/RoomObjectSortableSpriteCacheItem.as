package com.sulake.room.renderer.cache
{
   import com.sulake.room.renderer.utils.SortableSprite;
   
   public class RoomObjectSortableSpriteCacheItem
   {
       
      
      private var var_180:Array;
      
      private var var_2228:int = -1;
      
      private var var_2229:int = -1;
      
      private var var_1597:Boolean = false;
      
      public function RoomObjectSortableSpriteCacheItem()
      {
         this.var_180 = [];
         super();
      }
      
      public function get spriteCount() : int
      {
         return this.var_180.length;
      }
      
      public function get isEmpty() : Boolean
      {
         return this.var_1597;
      }
      
      public function dispose() : void
      {
         this.setSpriteCount(0);
      }
      
      public function addSprite(param1:SortableSprite) : void
      {
         this.var_180.push(param1);
      }
      
      public function getSprite(param1:int) : SortableSprite
      {
         return this.var_180[param1];
      }
      
      public function needsUpdate(param1:int, param2:int) : Boolean
      {
         if(param1 != this.var_2228 || param2 != this.var_2229)
         {
            this.var_2228 = param1;
            this.var_2229 = param2;
            return true;
         }
         return false;
      }
      
      public function setSpriteCount(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(param1 < this.var_180.length)
         {
            _loc2_ = param1;
            while(_loc2_ < this.var_180.length)
            {
               _loc3_ = this.getSprite(_loc2_);
               if(_loc3_)
               {
                  _loc3_.dispose();
               }
               _loc2_++;
            }
            this.var_180.splice(param1,this.var_180.length - param1);
         }
         if(this.var_180.length == 0)
         {
            this.var_1597 = true;
         }
         else
         {
            this.var_1597 = false;
         }
      }
   }
}
