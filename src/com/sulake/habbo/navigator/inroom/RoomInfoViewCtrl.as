package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_2704:int;
      
      private var var_327:RoomEventViewCtrl;
      
      private var var_239:Timer;
      
      private var var_164:RoomSettingsCtrl;
      
      private var var_241:RoomThumbnailCtrl;
      
      private var var_1153:TagRenderer;
      
      private var var_279:IWindowContainer;
      
      private var var_381:IWindowContainer;
      
      private var var_713:IWindowContainer;
      
      private var var_2399:IWindowContainer;
      
      private var var_2395:IWindowContainer;
      
      private var var_1335:IWindowContainer;
      
      private var var_900:ITextWindow;
      
      private var var_1080:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_872:ITextWindow;
      
      private var var_1337:ITextWindow;
      
      private var var_1078:ITextWindow;
      
      private var var_871:ITextWindow;
      
      private var var_1696:ITextWindow;
      
      private var var_240:IWindowContainer;
      
      private var var_873:IWindowContainer;
      
      private var var_1695:IWindowContainer;
      
      private var var_2397:ITextWindow;
      
      private var var_712:ITextWindow;
      
      private var var_2398:IWindow;
      
      private var var_1340:IContainerButtonWindow;
      
      private var var_1338:IContainerButtonWindow;
      
      private var var_1336:IContainerButtonWindow;
      
      private var var_1341:IContainerButtonWindow;
      
      private var var_1343:IContainerButtonWindow;
      
      private var var_1342:IContainerButtonWindow;
      
      private var var_1698:IButtonWindow;
      
      private var var_1697:IButtonWindow;
      
      private var var_1694:IButtonWindow;
      
      private var var_870:IWindowContainer;
      
      private var var_1339:ITextWindow;
      
      private var var_1079:ITextFieldWindow;
      
      private var var_62:IWindowContainer;
      
      private var var_1081:IButtonWindow;
      
      private var var_874:IButtonWindow;
      
      private var var_2400:String;
      
      private var var_2396:String;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_327 = new RoomEventViewCtrl(this._navigator);
         this.var_164 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_241 = new RoomThumbnailCtrl(this._navigator);
         this.var_1153 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_164);
         this.var_239 = new Timer(6000,1);
         this.var_239.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.removeEventListener(HabboToolbarSetIconEvent.const_98,this.onToolbarIconState);
         }
         if(this.var_239)
         {
            this.var_239.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_239.reset();
            this.var_239 = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_239.reset();
         this.var_327.active = true;
         this.var_164.active = false;
         this.var_241.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_239.reset();
         this.var_164.load(param1);
         this.var_164.active = true;
         this.var_327.active = false;
         this.var_241.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_164.active = true;
         this.var_327.active = false;
         this.var_241.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_239.reset();
         this.var_164.active = false;
         this.var_327.active = false;
         this.var_241.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_975,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_239.reset();
         this.var_327.active = false;
         this.var_164.active = false;
         this.var_241.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(this._navigator.data.enteredGuestRoom.flatId);
         }
         this.refresh();
         this._window.visible = true;
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_47,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         this._window.parent.activate();
         this._window.activate();
         if(!param1)
         {
            this.var_239.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_239.reset();
         this.var_327.active = false;
         this.var_164.active = false;
         this.var_241.active = false;
         this.refresh();
         if(!this._window.visible)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_47,HabboToolbarIconEnum.ROOMINFO,this._window,false));
            this._window.parent.activate();
         }
         else
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_479,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info","buttons_container"],0,2);
         this._window.height = Util.getLowestPoint(this._window);
         this._window.y = this._window.desktop.height - this._window.height - 5;
         Logger.log("MAIN: " + this.var_279.rectangle + ", " + this.var_240.rectangle + ", " + this._window.rectangle);
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_279);
         this.var_279.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_164.refresh(this.var_279);
         this.var_241.refresh(this.var_279);
         Util.moveChildrenToColumn(this.var_279,["room_details","room_buttons"],0,2);
         this.var_279.height = Util.getLowestPoint(this.var_279);
         this.var_279.visible = true;
         Logger.log("XORP: " + this.var_381.visible + ", " + this.var_1335.visible + ", " + this.var_713.visible + ", " + this.var_713.rectangle + ", " + this.var_279.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_240);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_327.refresh(this.var_240);
         if(Util.hasVisibleChildren(this.var_240) && !(this.var_164.active || this.var_241.active))
         {
            Util.moveChildrenToColumn(this.var_240,["event_details","event_buttons"],0,2);
            this.var_240.height = Util.getLowestPoint(this.var_240);
            this.var_240.visible = true;
         }
         else
         {
            this.var_240.visible = false;
         }
         Logger.log("EVENT: " + this.var_240.visible + ", " + this.var_240.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","TradingYouAreNotAllowedParser") == "ObjectMouseData";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_164.active && !this.var_241.active && !this.var_327.active)
         {
            this.var_870.visible = true;
            this.var_1079.text = this.getEmbedData();
         }
         else
         {
            this.var_870.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this.var_62)
         {
            return;
         }
         if(this.var_164.active)
         {
            this.var_62.visible = false;
            return;
         }
         this.var_62.visible = true;
         if(this.var_1081)
         {
            if(this.var_2400 == "exit_homeroom")
            {
               this.var_1081.caption = "${navigator.homeroom}";
            }
            else
            {
               this.var_1081.caption = "${navigator.hotelview}";
            }
         }
         if(this.var_874)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_874.visible = _loc1_;
            if(this.var_2396 == "0")
            {
               this.var_874.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_874.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_164.active || this.var_241.active)
         {
            return;
         }
         this.var_900.text = param1.roomName;
         this.var_900.height = this.var_900.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_872.text = param1.description;
         this.var_1153.refreshTags(this.var_381,param1.tags);
         this.var_872.visible = false;
         if(param1.description != "")
         {
            this.var_872.height = this.var_872.textHeight + 5;
            this.var_872.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1338,"facebook_logo_small",_loc3_,null,0);
         this.var_1338.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1340,"thumb_up",_loc4_,null,0);
         this.var_1340.visible = _loc4_;
         this.var_871.visible = !_loc4_;
         this.var_1696.visible = !_loc4_;
         this.var_1696.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_381,"home",param2,null,0);
         this._navigator.refreshButton(this.var_381,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_381,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_900.y,0);
         this.var_381.visible = true;
         this.var_381.height = Util.getLowestPoint(this.var_381);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_381.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_164.active || this.var_241.active)
         {
            return;
         }
         this.var_1080.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1080.height = this.var_1080.textHeight + 5;
         this.var_1337.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1337.height = this.var_1337.textHeight + 5;
         Util.moveChildrenToColumn(this.var_713,["public_space_name","public_space_desc"],this.var_1080.y,0);
         this.var_713.visible = true;
         this.var_713.height = Math.max(86,Util.getLowestPoint(this.var_713));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_327.active)
         {
            return;
         }
         this.var_2397.text = param1.eventName;
         this.var_712.text = param1.eventDescription;
         this.var_1153.refreshTags(this.var_873,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_712.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_712.height = this.var_712.textHeight + 5;
            this.var_712.y = Util.getLowestPoint(this.var_873) + 2;
            this.var_712.visible = true;
         }
         this.var_873.visible = true;
         this.var_873.height = Util.getLowestPoint(this.var_873);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_164.active || this.var_241.active)
         {
            return;
         }
         this.var_1698.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1336.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this.var_1341.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1343.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1342.visible = this._navigator.data.canEditRoomSettings && param1;
         this.var_1335.visible = Util.hasVisibleChildren(this.var_1335);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_327.active)
         {
            return;
         }
         this.var_1697.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1694.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1695.visible = Util.hasVisibleChildren(this.var_1695);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details"));
         this._window.setParamFlag(HabboWindowParam.const_58,false);
         this._window.setParamFlag(HabboWindowParam.const_1303,true);
         this._window.visible = false;
         this.var_279 = IWindowContainer(this.find("room_info"));
         this.var_381 = IWindowContainer(this.find("room_details"));
         this.var_713 = IWindowContainer(this.find("public_space_details"));
         this.var_2399 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2395 = IWindowContainer(this.find("rating_cont"));
         this.var_1335 = IWindowContainer(this.find("room_buttons"));
         this.var_900 = ITextWindow(this.find("room_name"));
         this.var_1080 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_872 = ITextWindow(this.find("room_desc"));
         this.var_1337 = ITextWindow(this.find("public_space_desc"));
         this.var_1078 = ITextWindow(this.find("owner_caption"));
         this.var_871 = ITextWindow(this.find("rating_caption"));
         this.var_1696 = ITextWindow(this.find("rating_txt"));
         this.var_240 = IWindowContainer(this.find("event_info"));
         this.var_873 = IWindowContainer(this.find("event_details"));
         this.var_1695 = IWindowContainer(this.find("event_buttons"));
         this.var_2397 = ITextWindow(this.find("event_name"));
         this.var_712 = ITextWindow(this.find("event_desc"));
         this.var_1338 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1340 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_2398 = this.find("staff_pick_button");
         this.var_1336 = IContainerButtonWindow(this.find("add_favourite_button"));
         this.var_1341 = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1343 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1342 = IContainerButtonWindow(this.find("unmake_home_button"));
         this.var_1698 = IButtonWindow(this.find("room_settings_button"));
         this.var_1697 = IButtonWindow(this.find("create_event_button"));
         this.var_1694 = IButtonWindow(this.find("edit_event_button"));
         this.var_870 = IWindowContainer(this.find("embed_info"));
         this.var_1339 = ITextWindow(this.find("embed_info_txt"));
         this.var_1079 = ITextFieldWindow(this.find("embed_src_txt"));
         this.var_62 = IWindowContainer(this.find("buttons_container"));
         this.var_1081 = IButtonWindow(this.find("exit_room_button"));
         this.var_874 = IButtonWindow(this.find("zoom_button"));
         Util.setProcDirectly(this.var_1336,this.onAddFavouriteClick);
         Util.setProcDirectly(this.var_1341,this.onRemoveFavouriteClick);
         Util.setProcDirectly(this.var_1698,this.onRoomSettingsClick);
         Util.setProcDirectly(this.var_1343,this.onMakeHomeClick);
         Util.setProcDirectly(this.var_1342,this.onUnmakeHomeClick);
         Util.setProcDirectly(this.var_1697,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1694,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1079,this.onEmbedSrcClick);
         Util.setProcDirectly(this.var_1340,this.onThumbUp);
         Util.setProcDirectly(this.var_2398,this.onStaffPick);
         Util.setProcDirectly(this.var_1338,this.onFacebookLike);
         Util.setProcDirectly(this.var_874,this.onZoomClick);
         Util.setProcDirectly(this.var_1081,this.onExitRoomClick);
         this._navigator.refreshButton(this.var_1336,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1341,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1343,"home",true,null,0);
         this._navigator.refreshButton(this.var_1342,"home",true,null,0);
         this._window.findChildByName("close").procedure = this.onCloseButtonClick;
         Util.setProcDirectly(this.var_279,this.onHover);
         Util.setProcDirectly(this.var_240,this.onHover);
         this.var_1078.width = this.var_1078.textWidth;
         Util.moveChildrenToRow(this.var_2399,["owner_caption","owner_name"],this.var_1078.x,this.var_1078.y,3);
         this.var_871.width = this.var_871.textWidth;
         Util.moveChildrenToRow(this.var_2395,["rating_caption","rating_txt"],this.var_871.x,this.var_871.y,3);
         this.var_1339.height = this.var_1339.textHeight + 5;
         Util.moveChildrenToColumn(this.var_870,["embed_info_txt","embed_src_txt"],this.var_1339.y,2);
         this.var_870.height = Util.getLowestPoint(this.var_870) + 5;
         this.var_2704 = this._window.y + this._window.height;
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!this._navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function onFacebookLike(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_1079.setSelection(0,this.var_1079.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_38);
         _loc3_.iconId = HabboToolbarIconEnum.ZOOM;
         _loc3_.iconName = "ZOOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onExitRoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_38);
         _loc3_.iconId = HabboToolbarIconEnum.EXITROOM;
         _loc3_.iconName = "EXITROOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onToolbarIconState(param1:HabboToolbarSetIconEvent) : void
      {
         if(param1.type != HabboToolbarSetIconEvent.const_98)
         {
            return;
         }
         switch(param1.iconId)
         {
            case HabboToolbarIconEnum.ZOOM:
               this.var_2396 = param1.iconState;
               this.refreshButtons();
               break;
            case HabboToolbarIconEnum.EXITROOM:
               this.var_2400 = param1.iconState;
               this.refreshButtons();
         }
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         this.var_239.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_479,HabboToolbarIconEnum.ROOMINFO,this._window,false));
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
      
      public function registerToolbarEvents() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.addEventListener(HabboToolbarSetIconEvent.const_98,this.onToolbarIconState);
         }
      }
   }
}
