package com.sulake.habbo.quest
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.quest.enum.QuestStatusEnum;
   import com.sulake.habbo.window.utils.IConfirmDialog;
   import flash.events.Event;
   
   public class QuestCampaign implements IDisposable
   {
       
      
      private var _controller:QuestController;
      
      private var _id:String;
      
      private var var_1532:int;
      
      private var var_322:Array;
      
      private var var_463:Quest;
      
      private var var_275:QuestView;
      
      private var _window:IFrameWindow;
      
      private var var_1049:IWindowContainer;
      
      private var var_1307:IWindowContainer;
      
      private var var_276:IItemListWindow;
      
      private var var_695:Array;
      
      private var var_702:Boolean = false;
      
      private var var_1048:IWindowContainer;
      
      private var var_158:QuestHelp;
      
      public function QuestCampaign(param1:QuestController, param2:String, param3:int)
      {
         this.var_322 = [];
         this.var_695 = [];
         super();
         this._controller = param1;
         this._id = param2;
         this.var_1532 = param3;
         this.var_158 = new QuestHelp(this);
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         this.reset();
         if(this.var_275)
         {
            this.var_275.dispose();
            this.var_275 = null;
         }
         for each(_loc1_ in this.var_695)
         {
            _loc1_.dispose();
         }
         this.var_695 = [];
         this._window.dispose();
         this._window = null;
         this.var_702 = true;
         if(this.var_158)
         {
            this.var_158.dispose();
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_702;
      }
      
      public function isVisible() : Boolean
      {
         return this._window != null && this._window.visible;
      }
      
      public function close() : void
      {
         if(this._window)
         {
            this._window.visible = false;
         }
      }
      
      private function reset() : void
      {
         var _loc1_:* = null;
         if(this.var_322)
         {
            for each(_loc1_ in this.var_322)
            {
               this.var_276.removeListItem(_loc1_.view);
               _loc1_.dispose();
            }
            this.var_322 = null;
            this.var_276.destroyListItems();
            this.var_276.removeListItems();
         }
         this.var_463 = null;
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            this._window.visible = true;
            return;
         }
         this._window = IFrameWindow(this._controller.questEngine.getXmlWindow("QuestEngine"));
         this._window.findChildByTag("close").procedure = this.onWindowClose;
         this._window.center();
         this.var_1049 = this._window.findChildByName("quest.container") as IWindowContainer;
         this.var_1307 = this._window.findChildByName("currency.container") as IWindowContainer;
         this.var_276 = this._window.findChildByName("quests") as IItemListWindow;
         var _loc1_:* = "icon_" + this.id + "_pixeltype";
         var _loc2_:IBitmapWrapperWindow = this.var_1307.findChildByName("currency.icon") as IBitmapWrapperWindow;
         this._controller.questEngine.setImageFromAsset(_loc2_,_loc1_,this.onPreviewImageReady);
         this.var_1307.findChildByName("currency.amount").caption = "${quest_" + this.id + ".currency}";
         var _loc3_:String = "quest_" + this.id;
         var _loc4_:* = _loc3_ + ".title";
         this._window.caption = "${" + _loc4_ + "}";
         var _loc5_:* = _loc3_ + ".currency";
         this.setText("currency.amount",_loc5_);
         this.var_1048 = this._window.findChildByName("help.button") as IWindowContainer;
         if(this.var_1048)
         {
            this.var_1048.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.helpButtonEventProc);
            this.var_1048.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.helpButtonEventProc);
            this.var_1048.addEventListener(WindowMouseEvent.const_25,this.helpButtonEventProc);
         }
      }
      
      private function helpButtonEventProc(param1:Event, param2:IWindow = null) : void
      {
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.openHelp();
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            param2.style = 0;
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            param2.style = 2;
         }
      }
      
      private function openHelp() : void
      {
         Logger.log("Open Questing Help System");
         this.var_1049.removeChildAt(0);
         if(this.var_275)
         {
            this.var_275.dispose();
            this.var_275 = null;
         }
         if(this.var_463)
         {
            this.var_463.selected = false;
         }
         if(this.var_158)
         {
            this.var_1049.addChild(this.var_158.view);
         }
      }
      
      public function updatePurse() : void
      {
         var _loc1_:int = this._controller.questEngine.getActivityPointsForType(this.var_1532);
         this._controller.questEngine.localization.registerParameter("quest_" + this.id + ".currency","amount",_loc1_.toString());
      }
      
      private function onPreviewImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc3_:* = null;
         if(this.var_702)
         {
            return;
         }
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(!this._window)
         {
            return;
         }
         if(_loc2_ != null)
         {
            _loc3_ = this.var_1307.findChildByName("currency.icon") as IBitmapWrapperWindow;
            this._controller.questEngine.setImageFromAsset(_loc3_,_loc2_.assetName,this.onPreviewImageReady);
         }
      }
      
      public function get controller() : QuestController
      {
         return this._controller;
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.close();
         }
      }
      
      public function openCampaign(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         this.prepareWindow();
         this.reset();
         this.updatePurse();
         param1.sort(this.orderByName,Array.NUMERIC);
         this.var_322 = [];
         for each(_loc2_ in param1)
         {
            this.var_322.push(new Quest(_loc2_,this));
         }
         _loc3_ = null;
         for each(_loc4_ in this.var_322)
         {
            this.var_276.addListItem(_loc4_.view);
            if(!_loc3_ && (_loc4_.status == QuestStatusEnum.const_41 || _loc4_.status == QuestStatusEnum.const_408))
            {
               _loc3_ = _loc4_;
            }
         }
         if(_loc3_)
         {
            this.activateListItem(_loc3_);
            if(this.var_276.maxScrollV > 0)
            {
               this.var_276.scrollV = _loc3_.view.y / this.var_276.maxScrollV;
            }
         }
         else if(this.var_322.length > 0)
         {
            this.activateListItem(this.var_322[0]);
         }
      }
      
      private function orderByName(param1:QuestMessageData, param2:QuestMessageData) : Number
      {
         var _loc3_:String = param1.localizationPrefix;
         var _loc4_:String = param2.localizationPrefix;
         var _loc5_:uint = param1.sortCode;
         var _loc6_:uint = param2.sortCode;
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc5_ > _loc6_)
         {
            return 1;
         }
         if(_loc5_ < _loc6_)
         {
            return -1;
         }
         return 0;
      }
      
      private function orderByDate(param1:QuestMessageData, param2:QuestMessageData) : Number
      {
         var _loc3_:String = param1.endDateTimeStamp;
         var _loc4_:String = param2.endDateTimeStamp;
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         return 0;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function updateListView() : void
      {
         var _loc1_:IItemListWindow = this._window.findChildByName("quests") as IItemListWindow;
         _loc1_.invalidate();
      }
      
      public function activateListItem(param1:Quest) : void
      {
         if(this.var_463 != null)
         {
            this.var_463.selected = false;
         }
         this.var_463 = param1;
         this.var_463.selected = true;
         this.showQuestData(this.var_463);
      }
      
      private function showQuestData(param1:Quest) : void
      {
         this.var_1049.removeChildAt(0);
         if(this.var_275)
         {
            this.var_275.dispose();
            this.var_275 = null;
         }
         this.var_275 = new QuestView(this,param1);
         this.var_1049.addChild(this.var_275.view);
         this.var_275.init();
      }
      
      public function questAccepted(param1:QuestMessageData) : void
      {
         this.modifyQuestData(param1);
      }
      
      public function questCompleted(param1:QuestMessageData) : void
      {
         this.modifyQuestData(param1);
         this.var_695.push(new QuestCompleted(this,param1));
      }
      
      public function closeQuestCompleted(param1:QuestCompleted) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         for each(_loc3_ in this.var_695)
         {
            if(_loc3_ == param1)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         if(_loc2_)
         {
            _loc2_.dispose();
            _loc4_ = this.var_695.indexOf(_loc2_);
            if(_loc4_ >= 0)
            {
               this.var_695.splice(_loc4_,1);
            }
         }
      }
      
      private function modifyQuestData(param1:QuestMessageData) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc3_:int = 0;
         for each(_loc4_ in this.var_322)
         {
            if(_loc4_.id == param1.id)
            {
               _loc2_ = _loc4_;
               break;
            }
            _loc3_++;
         }
         if(_loc2_)
         {
            _loc5_ = new Quest(param1,this);
            this.var_322[_loc3_] = _loc5_;
            _loc6_ = this.var_276.getListItemIndex(_loc2_.view);
            this.var_276.removeListItem(_loc2_.view);
            if(_loc6_ > -1)
            {
               this.var_276.addListItemAt(_loc5_.view,_loc6_);
            }
            else
            {
               this.var_276.addListItem(_loc5_.view);
            }
            if(this.var_463 == _loc2_)
            {
               this.activateListItem(_loc5_);
            }
            _loc2_.dispose();
            _loc2_ = null;
         }
      }
      
      private function onConfirm(param1:IConfirmDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function find(param1:String) : IWindow
      {
         var _loc2_:* = null;
         if(this._window is IWindowContainer)
         {
            _loc2_ = IWindowContainer(this._window).findChildByName(param1);
         }
         else if(this._window is IItemListWindow)
         {
            _loc2_ = IItemListWindow(this._window).getListItemByName(param1);
         }
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function setText(param1:String, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:IWindow = this.find(param1);
         if(_loc4_)
         {
            if(param3)
            {
               param2 = "${" + param2 + "}";
            }
            _loc4_.caption = param2;
         }
      }
   }
}
