
<?xml version="1.0"?>

<queryset>

  <fullquery name="zen::update_dotlrn::update.get_old_layout_id">
    <querytext>
      select o.layout_id as old_layout_id
      from portal_layouts o
      where o.name = :old_name
    </querytext>
  </fullquery>

  <fullquery name="zen::update_dotlrn::update.get_new_layout_id">
    <querytext>
      select n.layout_id as new_layout_id
      from portal_layouts n
      where n.name = :new_name
    </querytext>
  </fullquery>

    
  <fullquery name="zen::update_dotlrn::update.update">
    <querytext>
      update portal_pages
      set layout_id = :new_layout_id
      where layout_id = :old_layout_id
    </querytext>
  </fullquery>
    
</queryset>
