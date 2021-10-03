package com.sulake.core.utils
{
   public class ErrorReportStorage
   {
      
      private static var var_1151:Map = new Map();
      
      private static var var_747:Map = new Map();
       
      
      public function ErrorReportStorage()
      {
         super();
      }
      
      public static function getDebugData() : String
      {
         var _loc1_:String = "";
         var _loc2_:int = 0;
         while(_loc2_ < var_747.length)
         {
            if(_loc2_ == 0)
            {
               _loc1_ = var_747.getWithIndex(_loc2_);
            }
            else
            {
               _loc1_ = _loc1_ + " ** " + var_747.getWithIndex(_loc2_);
            }
            _loc2_++;
         }
         if(_loc1_.length > 500)
         {
            _loc1_ = _loc1_.substr(_loc1_.length - 500);
         }
         return _loc1_;
      }
      
      public static function addDebugData(param1:String, param2:String) : void
      {
         var_747.remove(param1);
         var_747.add(param1,param2);
      }
      
      public static function setParameter(param1:String, param2:String) : void
      {
         var_1151[param1] = param2;
      }
      
      public static function getParameter(param1:String) : String
      {
         return var_1151[param1];
      }
      
      public static function getParameterNames() : Array
      {
         return var_1151.getKeys();
      }
   }
}
