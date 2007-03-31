# $Id$

set user_id [ad_get_user_id] 
set untrusted_user_id [ad_conn untrusted_user_id]
set community_id [dotlrn_community::get_community_id]
set dotlrn_url [dotlrn::get_url]

#----------------------------------------------------------------------
# Display user messages
#----------------------------------------------------------------------

util_get_user_messages -multirow "user_messages"

# Get system name
set system_name [ad_system_name]
set system_url [ad_url]
if { [string equal [ad_conn url] "/"] } {
    set system_url ""
}

# Get user information
set sw_admin_p [acs_user::site_wide_admin_p -user_id $untrusted_user_id]
if { $untrusted_user_id != 0 } {
    set user_name [person::name -person_id $untrusted_user_id]
    set pvt_home_url [ad_pvt_home]
    set pvt_home_name [ad_pvt_home_name]
    if [empty_string_p $pvt_home_name] {
        set pvt_home_name [_ acs-subsite.Your_Account]
    }
    set logout_url [ad_get_logout_url]

    # Site-wide admin link
    set admin_url {}

    if { $sw_admin_p } {
        set admin_url "/acs-admin/"
        set devhome_url "/acs-admin/developer"
        set locale_admin_url "/acs-lang/admin"
    } else {
        set subsite_admin_p [permission::permission_p \
                                 -object_id [subsite::get_element -element object_id] \
                                 -privilege admin \
                                 -party_id $untrusted_user_id]

        if { $subsite_admin_p  } {
            set admin_url "[subsite::get_element -element url]admin/"
        }
    }
} 

# Who's Online
set num_users_online [lc_numeric [whos_online::num_users]]
set whos_online_url [subsite::get_element -element url]shared/whos-online

if {[dotlrn::user_p -user_id $user_id]} {
    set portal_id [dotlrn::get_portal_id -user_id $user_id]
}

if { ![info exists header_stuff] } {
    set header_stuff ""
}

if {![info exists link_all]} {
    set link_all 0
}

if {![info exists return_url]} {
    set link [ad_conn -get extra_url]
} else {
    set link $return_url
}

if { ![string equal [ad_conn package_key] [dotlrn::package_key]] } {
    # Peter M: We are in a package (an application) that may or may not be under a dotlrn instance 
    # (i.e. in a news instance of a class)
    # and we want all links in the navbar to be active so the user can return easily to the class homepage
    # or to the My Space page
    set link_all 1
}

set control_panel_text [_ acs-subsite.Admin]
if { $community_id ne "" } {

    set portal_id [dotlrn_community::get_portal_id -community_id $community_id]
    set link [dotlrn_community::get_community_url $community_id]
    set admin_p [dotlrn::user_can_admin_community_p -user_id $user_id -community_id $community_id]

    if {[empty_string_p $portal_id] && !$admin_p } {
        # not a member yet
        set portal_id [dotlrn_community::get_non_member_portal_id -community_id $community_id]
    }

    set comm_type [dotlrn_community::get_community_type_from_community_id $community_id]

    if {[dotlrn_community::subcommunity_p -community_id $community_id]} {
        #The colors for a subgroup are set by the parent group with a few overwritten.
        set comm_type [dotlrn_community::get_community_type_from_community_id [dotlrn_community::get_parent_id -community_id $community_id]]
    }

  
   # font hack
   set community_header_font [dotlrn_community::get_attribute \
        -community_id $community_id \
        -attribute_name header_font
    ]

    if {![empty_string_p $community_header_font]} {
        set header_font "$community_header_font,$header_font"
    }


    set header_font_size [dotlrn_community::get_attribute \
        -community_id $community_id \
        -attribute_name header_font_size
    ]

    set header_font_color [dotlrn_community::get_attribute \
        -community_id $community_id \
        -attribute_name header_font_color
    ]

    # logo hack 
    set header_logo_item_id [dotlrn_community::get_attribute \
        -community_id $community_id \
        -attribute_name header_logo_item_id
    ]

    set text [dotlrn::user_context_bar -community_id $community_id]

    if { [string equal [ad_conn package_key] [dotlrn::package_key]] } {
        set text "<span class=\"header-text\">$text</span>"
    }

} elseif {[parameter::get -parameter community_type_level_p] == 1} {
    set extra_td_html ""
    set link_all 1
    set link [dotlrn::get_url]
    # in a community type
    set text \
            [dotlrn_community::get_community_type_name [dotlrn_community::get_community_type]]
} else {
    # we could be anywhere (maybe under /dotlrn, maybe not)
    set link "[dotlrn::get_url]/"
    set community_id ""
    set text ""
}

if {[exists_and_not_null portal_page_p]} {
    if { [set page_num [ns_queryget page_num]] eq "" } {
        set page_num 0
    }
    append header_stuff [portal::get_page_header_stuff \
                            -portal_id $portal_id \
                            -page_num $page_num]
}

# Set up some basic stuff
if { [ad_conn untrusted_user_id] == 0 } {
    set user_name {}
} else {
    set user_name [acs_user::get_element -user_id [ad_conn untrusted_user_id] -element name]
}

if {![exists_and_not_null title]} {
    set title [ad_system_name]
}

if {[empty_string_p [dotlrn_community::get_parent_community_id -package_id [ad_conn package_id]]]} {
    set parent_comm_p 0
} else {
    set parent_comm_p 1
}

if { !([exists_and_not_null no_navbar_p] && $no_navbar_p) &&
     [exists_and_not_null portal_id] } {
    
    if {[exists_and_not_null community_id]} {
        set youarehere "[dotlrn_community::get_community_name $community_id]"
    } else {
        set youarehere "[_ theme-zen.MySpace]"
    }

    set extra_spaces "<img src=\"/resources/dotlrn/spacer.gif\" alt=\"\" border=0 width=15>"    
    set navbar [zen::portal_navbar]
    set subnavbar [zen::portal_subnavbar \
        -user_id $user_id \
        -control_panel_text $control_panel_text \
        -pre_html "$extra_spaces" \
        -post_html $extra_spaces \
        -link_all $link_all
    ]
} else {
    set navbar ""
    set subnavbar ""
}

# DRB: Hack to ensure that subgroups keep the same color as their ultimate club or
# class parent.  A top-level community that's not a class or club will keep the
# top-level Selva colors.

if { [string match /dotlrn/clubs/* [ad_conn url]] } {
    set css_url [parameter::get_from_package_key -package_key "theme-zen" -parameter "communityCssUrl" -default "/resources/theme-zen/css/color/purple.css"]
} elseif { [string match /dotlrn/classes/* [ad_conn url]] } {
    set css_url [parameter::get_from_package_key -package_key "theme-zen" -parameter "courseCssUrl" -default "/resources/theme-zen/css/color/green.css"]
} else {
    set css_url [parameter::get_from_package_key -package_key "theme-zen" -parameter "cssUrl" -default "/resources/theme-zen/css/color/blue.css"]
}

append header_stuff [subst {
<meta http-equiv="content-type" content="text/html; charset=[ad_conn charset]">
<meta name="robots" content="all">
<meta name="keywords" content="accessibility, portals, elearning, design">
<link rel="stylesheet" type="text/css" href="/resources/acs-subsite/default-master.css" media="screen">
<link rel="stylesheet" type="text/css" href="/resources/theme-zen/css/main.css" media="screen">
<link rel="stylesheet" type="text/css" href="/resources/theme-zen/css/print.css" media="print">
<link rel="stylesheet" type="text/css" href="/resources/theme-zen/css/handheld.css" media="handheld">
<link rel="stylesheet" type="text/css" href="$css_url" media="all">
<link rel="alternate stylesheet" type="text/css" href="/resources/theme-zen/css/highContrast.css" title="highContrast">
<link rel="alternate stylesheet" type="text/css" href="/resources/theme-zen/css/508.css" title="508">
<script type="text/javascript" src="/resources/theme-zen/js/styleswitcher.js"></script>
}]

# dotlrn toolbar : We include that here, so that master template authors don't have to worry about it

if { [llength [namespace eval :: info procs dotlrn_toolbar::show_p]] == 1 } {

    append header_stuff {
        <link rel="stylesheet" type="text/css" href="/resources/dotlrn/dotlrn-toolbar.css" media="all">
    }
    set dotlrn_toolbar_p 1
} else {
    set dotlrn_toolbar_p 0
}

if { [info exists text] } {
    set text [lang::util::localize $text]
}


# Focus
multirow create attribute key value

if { ![template::util::is_nil focus] } {
    # Handle elements wohse name contains a dot
    if { [regexp {^([^.]*)\.(.*)$} $focus match form_name element_name] } {

        # Add safety code to test that the element exists '
        append header_stuff "
          <script language=\"JavaScript\" type=\"text/javascript\">
            function acs_focus( form_name, element_name ){
                if (document.forms == null) return;
                if (document.forms\[form_name\] == null) return;
                if (document.forms\[form_name\].elements\[element_name\] == null) return;
                if (document.forms\[form_name\].elements\[element_name\].type == 'hidden') return;

                document.forms\[form_name\].elements\[element_name\].focus();
            }
          </script>
        "
        
        template::multirow append \
                attribute onload "javascript:acs_focus('${form_name}', '${element_name}')"
    }
}

# Developer-support support
set ds_enabled_p [parameter::get_from_package_key \
    -package_key acs-developer-support \
    -parameter EnabledOnStartupP \
    -default 0
]

if {$ds_enabled_p} {
    set ds_link [ds_link]
} else {
    set ds_link {}
}

set change_locale_url "/acs-lang/?[export_vars { { package_id "[ad_conn package_id]" } }]"

# Hack for title and context bar outside of dotlrn

set in_dotlrn_p [expr [string match "[dotlrn::get_url]/*" [ad_conn url]]]

# Context bar
if { [info exists context] } {
    set context_tmp $context
    unset context
} else {
    set context_tmp {}
}
ad_context_bar_multirow -- $context_tmp

set acs_lang_url [apm_package_url_from_key "acs-lang"]
set lang_admin_p [permission::permission_p \
                      -object_id [site_node::get_element -url $acs_lang_url -element object_id] \
                      -privilege admin \
                      -party_id [ad_conn untrusted_user_id]]
set toggle_translator_mode_url [export_vars -base "${acs_lang_url}admin/translator-mode-toggle" { { return_url [ad_return_url] } }]

# Curriculum bar
set curriculum_bar_p [llength [site_node::get_children -all -filters { package_key "curriculum" } -node_id $community_id]]

# Bring in header stuff from portlets, e.g. dhtml tree javascript
# from dotlrn-main-portlet.
global dotlrn_master__header_stuff
if { ![info exists dotlrn_master__header_stuff] } {
    set dotlrn_master__header_stuff ""
}
