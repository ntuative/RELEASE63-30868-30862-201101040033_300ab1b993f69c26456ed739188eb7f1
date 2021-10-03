package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_119:String = "RSPE_VOTE_QUESTION";
      
      public static const const_129:String = "RSPE_VOTE_RESULT";
       
      
      private var var_1072:String = "";
      
      private var var_1227:Array;
      
      private var var_1155:Array;
      
      private var var_1501:int = 0;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         this.var_1227 = [];
         this.var_1155 = [];
         super(param1,param2,param7,param8);
         this.var_1072 = param3;
         this.var_1227 = param4;
         this.var_1155 = param5;
         if(this.var_1155 == null)
         {
            this.var_1155 = [];
         }
         this.var_1501 = param6;
      }
      
      public function get question() : String
      {
         return this.var_1072;
      }
      
      public function get choices() : Array
      {
         return this.var_1227.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1155.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1501;
      }
   }
}
