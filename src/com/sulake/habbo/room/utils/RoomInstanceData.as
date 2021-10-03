package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_733:TileHeightMap = null;
      
      private var var_1102:LegacyWallGeometry = null;
      
      private var var_1103:RoomCamera = null;
      
      private var var_731:SelectedRoomObjectData = null;
      
      private var var_732:SelectedRoomObjectData = null;
      
      private var var_2476:String = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1102 = new LegacyWallGeometry();
         this.var_1103 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_733;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_733 != null)
         {
            this.var_733.dispose();
         }
         this.var_733 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1102;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1103;
      }
      
      public function get worldType() : String
      {
         return this.var_2476;
      }
      
      public function set worldType(param1:String) : void
      {
         this.var_2476 = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_731;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_731 != null)
         {
            this.var_731.dispose();
         }
         this.var_731 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_732;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_732 != null)
         {
            this.var_732.dispose();
         }
         this.var_732 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_733 != null)
         {
            this.var_733.dispose();
            this.var_733 = null;
         }
         if(this.var_1102 != null)
         {
            this.var_1102.dispose();
            this.var_1102 = null;
         }
         if(this.var_1103 != null)
         {
            this.var_1103.dispose();
            this.var_1103 = null;
         }
         if(this.var_731 != null)
         {
            this.var_731.dispose();
            this.var_731 = null;
         }
         if(this.var_732 != null)
         {
            this.var_732.dispose();
            this.var_732 = null;
         }
      }
   }
}
