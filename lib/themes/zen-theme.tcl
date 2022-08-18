ad_include_contract {
    Zen Theme
} {
    element_id:naturalnum
    shadeable_p:boolean
    shaded_p:boolean
    name:allhtml
}

set configure_element_url [export_vars -base configure-element {{op shade} element_id}]

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
