package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_1406:Array;
      
      private var var_2274:String;
      
      private var var_2275:String;
      
      private var var_2276:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         this.var_1406 = param1;
         this.var_2274 = param2;
         this.var_2275 = param3;
         this.var_2276 = param4;
      }
      
      public function get colours() : Array
      {
         return this.var_1406;
      }
      
      public function get backgroundAssetName() : String
      {
         return this.var_2274;
      }
      
      public function get colourAssetName() : String
      {
         return this.var_2275;
      }
      
      public function get chosenColourAssetName() : String
      {
         return this.var_2276;
      }
   }
}
