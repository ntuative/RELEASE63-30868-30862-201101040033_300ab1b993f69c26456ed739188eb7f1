package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDataProvider;
   
   public class EffectListProxy implements IThumbListDataProvider
   {
       
      
      private var var_61:EffectsModel;
      
      private var var_332:int;
      
      public function EffectListProxy(param1:EffectsModel, param2:int)
      {
         super();
         this.var_61 = param1;
         this.var_332 = param2;
      }
      
      public function dispose() : void
      {
         this.var_61 = null;
      }
      
      public function getDrawableList() : Array
      {
         return this.var_61.getEffects(this.var_332);
      }
   }
}
