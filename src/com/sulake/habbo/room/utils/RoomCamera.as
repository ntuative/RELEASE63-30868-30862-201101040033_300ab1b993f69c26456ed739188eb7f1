package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_829:int = 3;
       
      
      private var var_2025:int = -1;
      
      private var var_2023:int = -2;
      
      private var var_303:Vector3d = null;
      
      private var var_360:Vector3d = null;
      
      private var var_2024:Boolean = false;
      
      private var var_2021:Boolean = false;
      
      private var var_2022:Boolean = false;
      
      private var var_2029:Boolean = false;
      
      private var var_2026:int = 0;
      
      private var var_2027:int = 0;
      
      private var var_2028:int = 0;
      
      private var var_2020:int = 0;
      
      private var var_1229:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_360;
      }
      
      public function get targetId() : int
      {
         return this.var_2025;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2023;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2024;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2021;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2022;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2029;
      }
      
      public function get screenWd() : int
      {
         return this.var_2026;
      }
      
      public function get screenHt() : int
      {
         return this.var_2027;
      }
      
      public function get roomWd() : int
      {
         return this.var_2028;
      }
      
      public function get roomHt() : int
      {
         return this.var_2020;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2025 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2023 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2024 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2021 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2022 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2029 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2026 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2027 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2028 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2020 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_303 == null)
         {
            this.var_303 = new Vector3d();
         }
         if(this.var_303.x != param1.x || this.var_303.y != param1.y || this.var_303.z != param1.z)
         {
            this.var_303.assign(param1);
            this.var_1229 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_303 = null;
         this.var_360 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_360 != null)
         {
            return;
         }
         this.var_360 = new Vector3d();
         this.var_360.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_303 != null && this.var_360 != null)
         {
            ++this.var_1229;
            _loc4_ = Vector3d.dif(this.var_303,this.var_360);
            if(_loc4_.length <= param2)
            {
               this.var_360 = this.var_303;
               this.var_303 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_829 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1229 <= const_829)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_360 = Vector3d.sum(this.var_360,_loc4_);
            }
         }
      }
   }
}
