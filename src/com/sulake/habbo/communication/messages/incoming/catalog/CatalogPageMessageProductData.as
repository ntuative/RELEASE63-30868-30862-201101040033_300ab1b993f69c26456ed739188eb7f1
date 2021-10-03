package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_76:String = "i";
      
      public static const const_81:String = "s";
      
      public static const const_218:String = "e";
       
      
      private var var_1879:String;
      
      private var var_2428:int;
      
      private var var_1435:String;
      
      private var var_1434:int;
      
      private var var_1880:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1879 = param1.readString();
         this.var_2428 = param1.readInteger();
         this.var_1435 = param1.readString();
         this.var_1434 = param1.readInteger();
         this.var_1880 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1879;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2428;
      }
      
      public function get extraParam() : String
      {
         return this.var_1435;
      }
      
      public function get productCount() : int
      {
         return this.var_1434;
      }
      
      public function get expiration() : int
      {
         return this.var_1880;
      }
   }
}
