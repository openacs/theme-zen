ad_library {

     Theme Zen Package APM callbacks library

     Procedures that deal with installing.

     @creation-date May 2006
     @author  Don Baccus (dhogaza@pacifier.com)
     @cvs-id $Id$

}

namespace eval theme_zen {}
namespace eval theme_zen::apm {}

ad_proc -public theme_zen::apm::after_install {} {

    Create the Zen Theme for the new-portals and dotlrn packages.

    Done here as a Tcl callback because ...

    1. It's simpler than writing SQL
    2. It works for both Oracle and PostgreSQL

} {

    # DRB: Localize!!!!

    set var_list [list \
        [list name "Zen 1 column"] \
        [list description "Zen 1 column"] \
        [list resource_dir /resources/theme-zen/css/zen1] \
        [list filename ../../theme-zen/lib/layouts/zen1]
    ]
    set layout_id [package_instantiate_object -var_list $var_list portal_layout]
    set var_list [list \
        [list layout_id $layout_id] \
        [list region 1]
    ]
    package_exec_plsql -var_list $var_list portal_layout add_region

    set var_list [list \
        [list name "Zen 2 column"] \
        [list description "Zen 2 column"] \
        [list resource_dir /resources/theme-zen/css/zen2] \
        [list filename ../../theme-zen/lib/layouts/zen2]
    ]
    set layout_id [package_instantiate_object -var_list $var_list portal_layout]
    set var_list [list \
        [list layout_id $layout_id] \
        [list region 1]
    ]
    package_exec_plsql -var_list $var_list portal_layout add_region
    set var_list [list \
        [list layout_id $layout_id] \
        [list region 2]
    ]
    package_exec_plsql -var_list $var_list portal_layout add_region

    set var_list [list \
        [list name "Zen 3 column"] \
        [list description "Zen 3 column"] \
        [list resource_dir /resources/theme-zen/css/zen3] \
        [list filename ../../theme-zen/lib/layouts/zen3]
    ]
    set layout_id [package_instantiate_object -var_list $var_list portal_layout]
    set var_list [list \
        [list layout_id $layout_id] \
        [list region 1]
    ]
    package_exec_plsql -var_list $var_list portal_layout add_region
    set var_list [list \
        [list layout_id $layout_id] \
        [list region 2]
    ]
    package_exec_plsql -var_list $var_list portal_layout add_region
    set var_list [list \
        [list layout_id $layout_id] \
        [list region 3]
    ]
    package_exec_plsql -var_list $var_list portal_layout add_region

    set var_list [list \
        [list name "Zen Thin-Thick"] \
        [list description "Zen Thin-Thick"] \
        [list resource_dir /resources/theme-zen/css/zen-thin-thick] \
        [list filename ../../theme-zen/lib/layouts/zen2]
    ]
    set layout_id [package_instantiate_object -var_list $var_list portal_layout]
    set var_list [list \
        [list layout_id $layout_id] \
        [list region 1]
    ]
    package_exec_plsql -var_list $var_list portal_layout add_region
    set var_list [list \
        [list layout_id $layout_id] \
        [list region 2]
    ]
    package_exec_plsql -var_list $var_list portal_layout add_region

    set var_list [list \
        [list name "Zen Thin-Thick_Thin"] \
        [list description "Zen Thin-Thick_thin"] \
        [list resource_dir /resources/theme-zen/css/zen-thin-thick] \
        [list filename ../../theme-zen/lib/layouts/zen3]
    ]
    set layout_id [package_instantiate_object -var_list $var_list portal_layout]
    set var_list [list \
        [list layout_id $layout_id] \
        [list region 1]
    ]
    package_exec_plsql -var_list $var_list portal_layout add_region
    set var_list [list \
        [list layout_id $layout_id] \
        [list region 2]
    ]
    package_exec_plsql -var_list $var_list portal_layout add_region
    set var_list [list \
        [list layout_id $layout_id] \
        [list region 3]
    ]
    package_exec_plsql -var_list $var_list portal_layout add_region
       
    set var_list [list \
        [list name zen] \
        [list description "Zen Theme"] \
        [list filename ../../theme-zen/lib/themes/zen-theme]
    ]

    set theme_id [package_instantiate_object -var_list $var_list portal_element_theme]

    set site_template_id [db_nextval acs_object_id_seq]
    db_dml insert_theme {}

}

ad_proc -public theme_zen::apm::before_uninstall {} {
} {
}
