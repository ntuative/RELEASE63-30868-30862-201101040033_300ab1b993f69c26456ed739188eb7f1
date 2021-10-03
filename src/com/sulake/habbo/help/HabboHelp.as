package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.register.RegistrationUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var _toolbar:IHabboToolbar;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_285:IHabboCommunicationManager;
      
      private var var_812:IHabboLocalizationManager;
      
      private var var_810:IHabboConfigurationManager;
      
      private var var_368:ISessionDataManager;
      
      private var var_989:FaqIndex;
      
      private var _incomingMessages:IncomingMessages;
      
      private var var_59:HelpUI;
      
      private var var_156:TutorialUI;
      
      private var var_656:HotelMergeUI;
      
      private var var_811:RegistrationUI;
      
      private var var_1245:CallForHelpData;
      
      private var var_2090:UserRegistry;
      
      private var var_2038:String = "";
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1245 = new CallForHelpData();
         this.var_2090 = new UserRegistry();
         super(param1,param2,param3);
         this._assetLibrary = param3;
         this.var_989 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
      }
      
      public function set ownUserName(param1:String) : void
      {
         this.var_2038 = param1;
      }
      
      public function get ownUserName() : String
      {
         return this.var_2038;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return this.var_1245;
      }
      
      public function get userRegistry() : UserRegistry
      {
         return this.var_2090;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_812;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this._toolbar;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return this.var_368;
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return this.var_156;
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return this.var_656;
      }
      
      override public function dispose() : void
      {
         if(this.var_59 != null)
         {
            this.var_59.dispose();
            this.var_59 = null;
         }
         if(this.var_156 != null)
         {
            this.var_156.dispose();
            this.var_156 = null;
         }
         if(this.var_656)
         {
            this.var_656.dispose();
            this.var_656 = null;
         }
         if(this.var_811 != null)
         {
            this.var_811.dispose();
            this.var_811 = null;
         }
         if(this.var_989 != null)
         {
            this.var_989.dispose();
            this.var_989 = null;
         }
         this._incomingMessages = null;
         if(this._toolbar)
         {
            this._toolbar.release(new IIDHabboToolbar());
            this._toolbar = null;
         }
         if(this.var_812)
         {
            this.var_812.release(new IIDHabboLocalizationManager());
            this.var_812 = null;
         }
         if(this.var_285)
         {
            this.var_285.release(new IIDHabboCommunicationManager());
            this.var_285 = null;
         }
         if(this.var_810)
         {
            this.var_810.release(new IIDHabboConfigurationManager());
            this.var_810 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_368 != null)
         {
            this.var_368.release(new IIDSessionDataManager());
            this.var_368 = null;
         }
         super.dispose();
      }
      
      public function showUI(param1:String = null) : void
      {
         if(this.var_59 != null)
         {
            this.var_59.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(this.var_59 != null)
         {
            this.var_59.hideUI();
         }
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(this.var_59 != null)
         {
            this.var_59.tellUI(param1,param2);
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(this.var_59 != null)
         {
            this.var_59.updateCallForGuideBotUI(true);
         }
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(this.var_59 != null)
         {
            this.var_59.updateCallForGuideBotUI(false);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return this.var_989;
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(this.var_285 != null && param1 != null)
         {
            this.var_285.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(this.var_810 == null)
         {
            return param1;
         }
         return this.var_810.getKey(param1,param2,param3);
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(this.var_59 != null)
         {
            this.var_59.showCallForHelpReply(param1);
         }
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(this.var_59 != null)
         {
            this.var_59.showCallForHelpResult(param1);
         }
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         this.var_1245.reportedUserId = param1;
         this.var_1245.reportedUserName = param2;
         this.var_59.showUI(HabboHelpViewEnum.const_323);
      }
      
      private function toggleHelpUI() : void
      {
         if(this.var_59 == null)
         {
            if(!this.createHelpUI())
            {
               return;
            }
         }
         this.var_59.toggleUI();
      }
      
      private function createHelpUI() : Boolean
      {
         if(this.var_59 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_59 = new HelpUI(this,this._assetLibrary,this._windowManager,this.var_812,this._toolbar);
         }
         return this.var_59 != null;
      }
      
      private function createTutorialUI() : Boolean
      {
         if(this.var_156 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_156 = new TutorialUI(this);
         }
         return this.var_156 != null;
      }
      
      public function removeTutorialUI() : void
      {
         if(this.var_156 != null)
         {
            this.var_156.dispose();
            this.var_156 = null;
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!this.var_656)
         {
            this.var_656 = new HotelMergeUI(this);
         }
         this.var_656.startNameChange();
      }
      
      public function initRegistrationUI() : void
      {
         if(!this.var_811)
         {
            this.var_811 = new RegistrationUI(this);
         }
         this.var_811.showRegistrationView();
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            this.removeTutorialUI();
            return;
         }
         if(this.var_156 == null)
         {
            if(!this.createTutorialUI())
            {
               return;
            }
         }
         this.var_156.update(param1,param2,param3);
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_285 = IHabboCommunicationManager(param2);
         this._incomingMessages = new IncomingMessages(this,this.var_285);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._toolbar = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_812 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_810 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_85,this.onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_92,this.onRoomSessionEvent);
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_70,this.onHabboToolbarEvent);
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_38,this.onHabboToolbarEvent);
         this.createHelpUI();
         this.setHabboToolbarIcon();
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_368 = param2 as ISessionDataManager;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_85:
               if(this.var_59 != null)
               {
                  this.var_59.setRoomSessionStatus(true);
               }
               if(this.var_156 != null)
               {
                  this.var_156.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_92:
               if(this.var_59 != null)
               {
                  this.var_59.setRoomSessionStatus(false);
               }
               if(this.var_156 != null)
               {
                  this.var_156.setRoomSessionStatus(false);
               }
               this.userRegistry.unregisterRoom();
         }
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(this._toolbar != null)
         {
            this._toolbar.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_114,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_70)
         {
            this.setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_38)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               this.toggleHelpUI();
               return;
            }
         }
      }
   }
}
