package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_570;
         param1["bitmap"] = const_596;
         param1["border"] = const_724;
         param1["border_notify"] = const_1331;
         param1["button"] = const_462;
         param1["button_thick"] = const_660;
         param1["button_icon"] = const_1319;
         param1["button_group_left"] = const_758;
         param1["button_group_center"] = const_643;
         param1["button_group_right"] = const_625;
         param1["canvas"] = const_585;
         param1["checkbox"] = const_665;
         param1["closebutton"] = const_1033;
         param1["container"] = const_373;
         param1["container_button"] = const_572;
         param1["display_object_wrapper"] = const_676;
         param1["dropmenu"] = const_520;
         param1["dropmenu_item"] = const_429;
         param1["frame"] = const_347;
         param1["frame_notify"] = const_1417;
         param1["header"] = const_563;
         param1["html"] = const_1042;
         param1["icon"] = const_964;
         param1["itemgrid"] = const_939;
         param1["itemgrid_horizontal"] = const_399;
         param1["itemgrid_vertical"] = const_704;
         param1["itemlist"] = const_1082;
         param1["itemlist_horizontal"] = const_325;
         param1["itemlist_vertical"] = const_366;
         param1["maximizebox"] = const_1436;
         param1["menu"] = const_1403;
         param1["menu_item"] = const_1416;
         param1["submenu"] = const_1114;
         param1["minimizebox"] = const_1358;
         param1["notify"] = const_1264;
         param1["null"] = const_721;
         param1["password"] = const_626;
         param1["radiobutton"] = const_727;
         param1["region"] = const_673;
         param1["restorebox"] = const_1451;
         param1["scaler"] = const_682;
         param1["scaler_horizontal"] = const_1317;
         param1["scaler_vertical"] = const_1398;
         param1["scrollbar_horizontal"] = const_499;
         param1["scrollbar_vertical"] = const_709;
         param1["scrollbar_slider_button_up"] = const_995;
         param1["scrollbar_slider_button_down"] = const_921;
         param1["scrollbar_slider_button_left"] = const_1007;
         param1["scrollbar_slider_button_right"] = const_994;
         param1["scrollbar_slider_bar_horizontal"] = const_1030;
         param1["scrollbar_slider_bar_vertical"] = const_1025;
         param1["scrollbar_slider_track_horizontal"] = const_996;
         param1["scrollbar_slider_track_vertical"] = const_1103;
         param1["scrollable_itemlist"] = const_1408;
         param1["scrollable_itemlist_vertical"] = const_448;
         param1["scrollable_itemlist_horizontal"] = const_934;
         param1["selector"] = const_639;
         param1["selector_list"] = const_669;
         param1["submenu"] = const_1114;
         param1["tab_button"] = const_707;
         param1["tab_container_button"] = const_915;
         param1["tab_context"] = const_345;
         param1["tab_content"] = const_1041;
         param1["tab_selector"] = const_649;
         param1["text"] = const_779;
         param1["input"] = const_630;
         param1["toolbar"] = const_1401;
         param1["tooltip"] = const_376;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
