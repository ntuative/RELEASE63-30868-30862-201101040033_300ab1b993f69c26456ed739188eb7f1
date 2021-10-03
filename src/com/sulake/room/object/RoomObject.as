package com.sulake.room.object
{
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObject implements IRoomObjectController
   {
      
      private static var var_995:int = 0;
       
      
      private var _id:int;
      
      private var _type:String = "";
      
      private var var_73:Vector3d;
      
      private var var_242:Vector3d;
      
      private var var_1869:Vector3d;
      
      private var var_1870:Vector3d;
      
      private var var_622:Array;
      
      private var var_61:RoomObjectModel;
      
      private var _visualization:IRoomObjectVisualization;
      
      private var var_623:IRoomObjectEventHandler;
      
      private var _updateID:int;
      
      private var _instanceId:int = 0;
      
      public function RoomObject(param1:int, param2:int)
      {
         super();
         this._id = param1;
         this.var_73 = new Vector3d();
         this.var_242 = new Vector3d();
         this.var_1869 = new Vector3d();
         this.var_1870 = new Vector3d();
         this.var_622 = new Array(param2);
         var _loc3_:Number = param2 - 1;
         while(_loc3_ >= 0)
         {
            this.var_622[_loc3_] = 0;
            _loc3_--;
         }
         this.var_61 = new RoomObjectModel();
         this._visualization = null;
         this.var_623 = null;
         this._updateID = 0;
         this._instanceId = var_995++;
      }
      
      public function dispose() : void
      {
         this.var_73 = null;
         this.var_242 = null;
         if(this.var_61 != null)
         {
            this.var_61.dispose();
            this.var_61 = null;
         }
         this.var_622 = null;
         this.setVisualization(null);
         this.setEventHandler(null);
      }
      
      public function getId() : int
      {
         return this._id;
      }
      
      public function getType() : String
      {
         return this._type;
      }
      
      public function getInstanceId() : int
      {
         return this._instanceId;
      }
      
      public function getLocation() : IVector3d
      {
         this.var_1869.assign(this.var_73);
         return this.var_1869;
      }
      
      public function getDirection() : IVector3d
      {
         this.var_1870.assign(this.var_242);
         return this.var_1870;
      }
      
      public function getModel() : IRoomObjectModel
      {
         return this.var_61;
      }
      
      public function getModelController() : IRoomObjectModelController
      {
         return this.var_61;
      }
      
      public function getState(param1:int) : int
      {
         if(param1 >= 0 && param1 < this.var_622.length)
         {
            return this.var_622[param1];
         }
         return -1;
      }
      
      public function getVisualization() : IRoomObjectVisualization
      {
         return this._visualization;
      }
      
      public function setType(param1:String) : void
      {
         this._type = param1;
      }
      
      public function setLocation(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_73.x != param1.x || this.var_73.y != param1.y || this.var_73.z != param1.z)
         {
            this.var_73.x = param1.x;
            this.var_73.y = param1.y;
            this.var_73.z = param1.z;
            ++this._updateID;
         }
      }
      
      public function setDirection(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_242.x != param1.x || this.var_242.y != param1.y || this.var_242.z != param1.z)
         {
            this.var_242.x = (param1.x % 360 + 360) % 360;
            this.var_242.y = (param1.y % 360 + 360) % 360;
            this.var_242.z = (param1.z % 360 + 360) % 360;
            ++this._updateID;
         }
      }
      
      public function setState(param1:int, param2:int) : Boolean
      {
         if(param2 >= 0 && param2 < this.var_622.length)
         {
            if(this.var_622[param2] != param1)
            {
               this.var_622[param2] = param1;
               ++this._updateID;
            }
            return true;
         }
         return false;
      }
      
      public function setVisualization(param1:IRoomObjectVisualization) : void
      {
         if(param1 != this._visualization)
         {
            if(this._visualization != null)
            {
               this._visualization.dispose();
            }
            this._visualization = param1;
            if(this._visualization != null)
            {
               this._visualization.object = this;
            }
         }
      }
      
      public function setEventHandler(param1:IRoomObjectEventHandler) : void
      {
         if(param1 == this.var_623)
         {
            return;
         }
         var _loc2_:IRoomObjectEventHandler = this.var_623;
         if(_loc2_ != null)
         {
            this.var_623 = null;
            _loc2_.object = null;
         }
         this.var_623 = param1;
         if(this.var_623 != null)
         {
            this.var_623.object = this;
         }
      }
      
      public function getEventHandler() : IRoomObjectEventHandler
      {
         return this.var_623;
      }
      
      public function getUpdateID() : int
      {
         return this._updateID;
      }
      
      public function getMouseHandler() : IRoomObjectMouseHandler
      {
         return this.getEventHandler();
      }
   }
}
