
<?xml version="1.0"?>

<queryset>

  <fullquery name="theme_zen::apm::after_install.insert_theme">
    <querytext>
      insert into dotlrn_site_templates
        (site_template_id, pretty_name, site_master, portal_theme_id ) 
      values 
        (:site_template_id, 'Selva Theme', '/packages/theme-selva/www/selva-master',
         :theme_id)
    </querytext>
  </fullquery>
    
</queryset>
