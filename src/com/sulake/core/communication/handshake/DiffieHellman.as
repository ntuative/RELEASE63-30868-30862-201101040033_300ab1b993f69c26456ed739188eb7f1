package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_850:BigInteger;
      
      private var var_2031:BigInteger;
      
      private var var_1741:BigInteger;
      
      private var var_2445:BigInteger;
      
      private var var_1361:BigInteger;
      
      private var var_1742:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1361 = param1;
         this.var_1742 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1361.toString() + ",generator: " + this.var_1742.toString() + ",secret: " + param1);
         this.var_850 = new BigInteger();
         this.var_850.fromRadix(param1,param2);
         this.var_2031 = this.var_1742.modPow(this.var_850,this.var_1361);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1741 = new BigInteger();
         this.var_1741.fromRadix(param1,param2);
         this.var_2445 = this.var_1741.modPow(this.var_850,this.var_1361);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2031.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2445.toRadix(param1);
      }
   }
}
