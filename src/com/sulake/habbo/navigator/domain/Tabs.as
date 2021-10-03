package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_339:int = 1;
      
      public static const const_242:int = 2;
      
      public static const const_278:int = 3;
      
      public static const const_327:int = 4;
      
      public static const const_243:int = 5;
      
      public static const const_329:int = 1;
      
      public static const const_683:int = 2;
      
      public static const const_722:int = 3;
      
      public static const const_614:int = 4;
      
      public static const const_237:int = 5;
      
      public static const const_718:int = 6;
      
      public static const const_762:int = 7;
      
      public static const const_212:int = 8;
      
      public static const const_350:int = 9;
      
      public static const const_1790:int = 10;
      
      public static const const_609:int = 11;
      
      public static const const_493:int = 12;
       
      
      private var var_367:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_367 = new Array();
         this.var_367.push(new Tab(this._navigator,const_339,const_493,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_428));
         this.var_367.push(new Tab(this._navigator,const_242,const_329,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_428));
         this.var_367.push(new Tab(this._navigator,const_327,const_609,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1001));
         this.var_367.push(new Tab(this._navigator,const_278,const_237,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_428));
         this.var_367.push(new Tab(this._navigator,const_243,const_212,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_756));
         this.setSelectedTab(const_339);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_327;
      }
      
      public function get tabs() : Array
      {
         return this.var_367;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_367)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_367)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_367)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
