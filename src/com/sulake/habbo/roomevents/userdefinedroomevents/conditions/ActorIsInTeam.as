package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   
   public class ActorIsInTeam implements ConditionType
   {
       
      
      public function ActorIsInTeam()
      {
         super();
      }
      
      public function get code() : int
      {
         return ConditionCodes.var_1898;
      }
      
      public function get requiresFurni() : Boolean
      {
         return false;
      }
      
      public function get hasStateSnapshot() : Boolean
      {
         return false;
      }
      
      public function onInit(param1:IWindowContainer, param2:HabboUserDefinedRoomEvents) : void
      {
      }
      
      public function onEditStart(param1:IWindowContainer, param2:Triggerable) : void
      {
         var _loc3_:int = param2.intParams[0];
         this.getTeamSelector(param1).setSelected(this.getTeamRadio(param1,_loc3_));
      }
      
      public function readIntParamsFromForm(param1:IWindowContainer) : Array
      {
         var _loc2_:Array = new Array();
         _loc2_.push(this.getTeamSelector(param1).getSelected().id);
         return _loc2_;
      }
      
      public function readStringParamFromForm(param1:IWindowContainer) : String
      {
         return "";
      }
      
      public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getTeamRadio(param1:IWindowContainer, param2:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("team_" + param2 + "_radio"));
      }
      
      private function getTeamSelector(param1:IWindowContainer) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName("team_selector"));
      }
   }
}