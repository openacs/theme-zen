ad_library {

    Update an existing .LRN site by installing theme-zen and updating all existing
    portal pages by using the Theme Zen's dotLRNToZenMap parameter.

    @author Don Baccus (dhogaza@pacifier.com)
    @creation-date 2007/2/25
    @version $Id$

}

namespace eval zen::update_dotlrn {}

ad_proc zen::update_dotlrn::update {
} {
    Update an existing .LRN site by installing theme-zen and updating all existing
    portal pages by using the Theme Zen's dotLRNToZenMap parameter.
} {

    # This code is not forgiving of errors in the old and new name values given in
    # the dotLRNToZenMap parameter.  Justified by the fact that I'm probably the
    # only person who will define it.

    db_transaction {
        foreach {old_name new_name} [parameter::get_from_package_key \
                              -package_key theme-zen \
                              -parameter dotLRNToZenMap] {
            db_1row get_old_layout_id {}
            db_1row get_new_layout_id {}
            db_dml update {}
        }
    }
}

