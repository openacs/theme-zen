<div class="portlet-wrapper">
  <div class="portlet-header">
    <div class="portlet-title">
      <h1>@name;noquote@</h1>
    </div>
    <div class="portlet-controls">
      <if @shadeable_p@ eq "t">		
        <a href="@configure_element_url@">
          <if @shaded_p@ eq "t">
            <img src="/resources/theme-zen/images/portlets/max.gif" alt="#theme-zen.maximize_portlet#"  width="19" height="16">
          </if>
	  <else>
            <img src="/resources/theme-zen/images/portlets/min.gif" alt="#theme-zen.minimize_portlet#" width="19" height="16">
	  </else>
        </a>
      </if>
      <else>
        <img src="/resources/theme-zen/images/global/trans.gif" alt="" width="19" height="16">
      </else>
    </div>
  </div>
  <div class="portlet">
    <slave>
  </div> <!-- /portlet -->
</div> <!-- /portlet-wrapper -->
