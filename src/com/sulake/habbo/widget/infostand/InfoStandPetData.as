package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1284:int;
      
      private var var_2170:int;
      
      private var var_1952:int;
      
      private var var_2171:int;
      
      private var _energy:int;
      
      private var var_2174:int;
      
      private var _nutrition:int;
      
      private var var_2169:int;
      
      private var _petRespect:int;
      
      private var _name:String = "";
      
      private var var_1584:int = -1;
      
      private var _type:int;
      
      private var var_2155:int;
      
      private var var_40:BitmapData;
      
      private var var_2173:Boolean;
      
      private var var_2168:int;
      
      private var _ownerName:String;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var var_2172:int;
      
      private var var_491:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get id() : int
      {
         return this.var_1584;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get race() : int
      {
         return this.var_2155;
      }
      
      public function get image() : BitmapData
      {
         return this.var_40;
      }
      
      public function get isOwnPet() : Boolean
      {
         return this.var_2173;
      }
      
      public function get ownerId() : int
      {
         return this.var_2168;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return this._canOwnerBeKicked;
      }
      
      public function get age() : int
      {
         return this.var_491;
      }
      
      public function get level() : int
      {
         return this.var_1284;
      }
      
      public function get levelMax() : int
      {
         return this.var_2170;
      }
      
      public function get experience() : int
      {
         return this.var_1952;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2171;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2174;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2169;
      }
      
      public function get petRespect() : int
      {
         return this._petRespect;
      }
      
      public function get roomIndex() : int
      {
         return this.var_2172;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         this._name = param1.name;
         this.var_1584 = param1.id;
         this._type = param1.petType;
         this.var_2155 = param1.petRace;
         this.var_40 = param1.image;
         this.var_2173 = param1.isOwnPet;
         this.var_2168 = param1.ownerId;
         this._ownerName = param1.ownerName;
         this._canOwnerBeKicked = param1.canOwnerBeKicked;
         this.var_1284 = param1.level;
         this.var_2170 = param1.levelMax;
         this.var_1952 = param1.experience;
         this.var_2171 = param1.experienceMax;
         this._energy = param1.energy;
         this.var_2174 = param1.energyMax;
         this._nutrition = param1.nutrition;
         this.var_2169 = param1.nutritionMax;
         this._petRespect = param1.petRespect;
         this.var_2172 = param1.roomIndex;
         this.var_491 = param1.age;
      }
   }
}
