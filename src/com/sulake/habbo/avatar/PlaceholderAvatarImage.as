package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_640:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_702)
         {
            _structure = null;
            _assets = null;
            var_248 = null;
            var_257 = null;
            var_538 = null;
            var_509 = null;
            var_292 = null;
            if(!var_1183 && var_40)
            {
               var_40.dispose();
            }
            var_40 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_693 = null;
            var_702 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_640[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_640[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_330:
               switch(_loc3_)
               {
                  case AvatarAction.const_734:
                  case AvatarAction.const_452:
                  case AvatarAction.const_318:
                  case AvatarAction.const_731:
                  case AvatarAction.const_369:
                  case AvatarAction.const_608:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_291:
            case AvatarAction.const_760:
            case AvatarAction.const_202:
            case AvatarAction.const_693:
            case AvatarAction.const_774:
            case AvatarAction.const_653:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
