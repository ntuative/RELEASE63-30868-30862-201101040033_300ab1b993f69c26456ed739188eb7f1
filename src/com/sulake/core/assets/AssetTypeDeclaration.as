package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2455:String;
      
      private var var_2457:Class;
      
      private var var_2456:Class;
      
      private var var_1748:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2455 = param1;
         this.var_2457 = param2;
         this.var_2456 = param3;
         if(rest == null)
         {
            this.var_1748 = new Array();
         }
         else
         {
            this.var_1748 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2455;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2457;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2456;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1748;
      }
   }
}
