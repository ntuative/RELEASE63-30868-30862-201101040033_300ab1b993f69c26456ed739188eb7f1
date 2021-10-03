package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2434:String;
      
      private var var_1735:String;
      
      private var var_2433:String;
      
      private var var_1733:Boolean;
      
      private var var_1734:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2434 = String(param1["set-type"]);
         this.var_1735 = String(param1["flipped-set-type"]);
         this.var_2433 = String(param1["remove-set-type"]);
         this.var_1733 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1734 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1734;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1734 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2434;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1735;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2433;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1733;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1733 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1735 = param1;
      }
   }
}
