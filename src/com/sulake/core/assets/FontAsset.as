package com.sulake.core.assets
{
   import com.sulake.core.utils.FontEnum;
   import flash.text.Font;
   
   public class FontAsset implements IAsset
   {
       
      
      protected var var_1594:AssetTypeDeclaration;
      
      protected var var_162:Font;
      
      protected var _disposed:Boolean = false;
      
      public function FontAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_1594 = param1;
      }
      
      public function get url() : String
      {
         return null;
      }
      
      public function get content() : Object
      {
         return this.var_162 as Object;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_1594;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.var_1594 = null;
            this.var_162 = null;
            this._disposed = true;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         var fonts:Array = null;
         var unknown:Object = param1;
         try
         {
            if(unknown is Class)
            {
               Font.registerFont(unknown as Class);
               fonts = Font.enumerateFonts(false);
               this.var_162 = fonts.pop();
               FontEnum.embeddedFonts.add(Font(this.var_162).fontName,Font(this.var_162));
            }
         }
         catch(e:Error)
         {
            throw new Error("Failed to register font: " + unknown.toString());
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is FontAsset)
         {
            this.var_162 = FontAsset(param1).var_162;
            return;
         }
         throw new Error("Provided asset should be of type FontAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length())
         {
            _loc3_ = param1[_loc2_].attribute("key");
            _loc4_ = param1[_loc2_].attribute("value");
            _loc2_++;
         }
      }
   }
}
