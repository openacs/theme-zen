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

    set var_list [list \
        [list name zen] \
        [list description "Zen Theme"] \
        [list filename /packages/theme-zen/lib/themes/zen-theme] \
        [list resource_dir /packages/theme-zen/lib/themes/zen-theme]
    ]
    set theme_id [package_instantiate_object -var_list $var_list portal_element_theme]

    set site_template_id [db_nextval acs_object_id_seq]
    db_dml insert_theme {}

}

ad_proc -public theme_zen::apm::before_uninstall {} {
} {
}
