package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_934:IAssetLoader;
      
      private var var_1856:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_1856 = param1;
         this.var_934 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_1856;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_934;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_934 != null)
            {
               if(!this.var_934.disposed)
               {
                  this.var_934.dispose();
                  this.var_934 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
