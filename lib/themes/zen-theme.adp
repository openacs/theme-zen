<div class="portlet-wrapper">
  <div class="portlet-header">
    <div class="portlet-title">
      <h1>@name;noquote@ (h1) </h1>
    </div>
    <if @shadeable_p@ eq "t">		
      <div class="portlet-controls">
        <a href="configure-element?element_id=@element_id@&amp;op=shade">
          <if @shaded_p@ eq "t">
            <img src="/resources/theme-zen/images/portlets/max.gif" alt="maximize portlet"  width="19" height="16" />
          </if>
	  <else>
            <img src="/resources/theme-zen/images/portlets/min.gif" alt="minimize portlet" width="19" height="16" />
	  </else>
        </a>
      </div>
    </if>
  </div>
  <div class="portlet">
    <slave>
  </div> <!-- /portlet -->
</div> <!-- /portlet-wrapper -->
