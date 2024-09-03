ad_include_contract {
    Zen Theme
} {
    name:allhtml
    dir:path
    element_id:naturalnum
    element_num:naturalnum
    link:localurl
    shadeable_p:boolean
    shaded_p:boolean
    hideable_p:boolean
    user_editable_p:boolean
    link_hideable_p:boolean
    hide_links_p:boolean
}

set configure_element_url [export_vars -base configure-element {{op shade} element_id}]

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
