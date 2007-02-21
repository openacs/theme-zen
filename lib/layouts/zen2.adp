<%

    #
    #  Copyright (C) 2001, 2002 MIT
    #
    #  This file is part of dotLRN.
    #
    #  dotLRN is free software; you can redistribute it and/or modify it under the
    #  terms of the GNU General Public License as published by the Free Software
    #  Foundation; either version 2 of the License, or (at your option) any later
    #  version.
    #
    #  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
    #  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
    #  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
    #  details.
    #

%>
      
<div id="sidebar-1">
  <div class="sidebar-1-padding">
    <list name="element_ids_1">
      <include src="@element_src@"
        element_id="@element_ids_1:item@"
        element_num="@element_ids_1:rownum@"
        element_first_num="0"
        action_string="@action_string@"
        theme_id="@theme_id@"
        region="2"
        portal_id="@portal_id@"
        edit_p="@edit_p@"
        return_url="@return_url@"
        hide_links_p="@hide_links_p@"
        page_id="@page_id@"
        layout_id="@layout_id@">
    </list>
  </div> <!-- /sidebar-1-padding -->
</div> <!-- /sidebar-1 -->

<div id="main">
  <div id="main-content">
    <div class="main-content-padding">
      <list name="element_ids_2">
        <include src="@element_src@"
          element_id="@element_ids_2:item@"
          element_num="@element_ids_2:rownum@"
          element_first_num="@element_2_first_num@"
          action_string="@action_string@"
          theme_id="@theme_id@"
          region="1"
          portal_id="@portal_id@"
          edit_p="@edit_p@"
          return_url="@return_url@"
          hide_links_p="@hide_links_p@"
          page_id="@page_id@"
          layout_id="@layout_id@">
      </list>
    </div> <!-- /main-content-padding -->
  </div> <!-- /main-content -->
</div> <!-- /main -->