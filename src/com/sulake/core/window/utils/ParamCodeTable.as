package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_172;
         param1["bound_to_parent_rect"] = const_88;
         param1["child_window"] = const_1012;
         param1["embedded_controller"] = const_913;
         param1["resize_to_accommodate_children"] = const_64;
         param1["input_event_processor"] = const_28;
         param1["internal_event_handling"] = const_569;
         param1["mouse_dragging_target"] = const_213;
         param1["mouse_dragging_trigger"] = const_332;
         param1["mouse_scaling_target"] = const_262;
         param1["mouse_scaling_trigger"] = const_488;
         param1["horizontal_mouse_scaling_trigger"] = const_256;
         param1["vertical_mouse_scaling_trigger"] = const_253;
         param1["observe_parent_input_events"] = const_943;
         param1["optimize_region_to_layout_size"] = const_432;
         param1["parent_window"] = const_1028;
         param1["relative_horizontal_scale_center"] = const_188;
         param1["relative_horizontal_scale_fixed"] = const_135;
         param1["relative_horizontal_scale_move"] = const_338;
         param1["relative_horizontal_scale_strech"] = WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRECH;
         param1["relative_scale_center"] = const_970;
         param1["relative_scale_fixed"] = const_797;
         param1["relative_scale_move"] = const_968;
         param1["relative_scale_strech"] = const_991;
         param1["relative_vertical_scale_center"] = const_173;
         param1["relative_vertical_scale_fixed"] = const_133;
         param1["relative_vertical_scale_move"] = const_358;
         param1["relative_vertical_scale_strech"] = const_314;
         param1["on_resize_align_left"] = const_668;
         param1["on_resize_align_right"] = const_423;
         param1["on_resize_align_center"] = const_480;
         param1["on_resize_align_top"] = const_593;
         param1["on_resize_align_bottom"] = const_438;
         param1["on_resize_align_middle"] = const_445;
         param1["on_accommodate_align_left"] = const_1046;
         param1["on_accommodate_align_right"] = const_513;
         param1["on_accommodate_align_center"] = const_726;
         param1["on_accommodate_align_top"] = const_1100;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_730;
         param1["route_input_events_to_parent"] = const_469;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_919;
         param1["scalable_with_mouse"] = const_914;
         param1["reflect_horizontal_resize_to_parent"] = const_494;
         param1["reflect_vertical_resize_to_parent"] = const_460;
         param1["reflect_resize_to_parent"] = const_301;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
