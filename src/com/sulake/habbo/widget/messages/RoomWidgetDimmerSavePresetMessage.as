package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_814:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_1948:int;
      
      private var var_1949:int;
      
      private var _color:uint;
      
      private var var_1114:int;
      
      private var var_2499:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_814);
         this.var_1948 = param1;
         this.var_1949 = param2;
         this._color = param3;
         this.var_1114 = param4;
         this.var_2499 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_1948;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_1949;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1114;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2499;
      }
   }
}
