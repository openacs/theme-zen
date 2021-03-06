
set order_id 1

template::list::create -name order_lines \
    -multirow order_lines \
    -key item_id \
    -actions [list "Add item" [export_vars -base . {order_id}] "Add item to this order"] \
    -html [list summary "List of delicious fruits"] \
    -caption "Some delicious fruits?" \
    -bulk_actions {
	"Remove" "#" "Remove checked items" 
	"Copy" "#" "Copy checked items to clipboard" 
    }  -bulk_action_method post -bulk_action_export_vars {
	order_id
    } -row_pretty_plural "order items" -elements {
	quantity {
	    label "Quantity"
	}
	item_id {
	    label "Item"
	    display_col item_name
	    link_url_col item_url
	    link_html { title "View this item" }
	}
	item_price {
	    label "Price"
	    display_eval {[lc_sepfmt $item_price]}
	}
	extended_price {
	    label "Extended Price"
	    display_eval {[lc_sepfmt $item_price]}
	}
    }

template::multirow create order_lines item_id quantity item_name item_price item_url
template::multirow append order_lines 123     70        raspberry       100       .
template::multirow append order_lines 124     5         banana           55       .

# db_multirow -extend { item_url } order_lines select_order_lines {
#         select l.item_id,
#                l.quantity,
#                l.name as item_name,
#                l.price as item_price
#         from   order_lines l
#         where  l.order_id = :order_id
# } {
#     set item_url [export_vars -base "item" { item_id }]
# }

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
