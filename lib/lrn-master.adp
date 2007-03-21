<master src="/www/blank-compat">
  <property name="header_stuff">
    @header_stuff;noquote@
    @dotlrn_master__header_stuff;noquote@
  </property>
  <if @context@ not nil><property name="context">@context;noquote@</property></if>
    <else><if @context_bar@ not nil><property name="context_bar">@context_bar;noquote@</property></if></else>
  <if @focus@ not nil><property name="focus">@focus;noquote@</property></if>
  <if @doc_type@ not nil><property name="doc_type">@doc_type;noquote@</property></if>
     <if @untrusted_user_id@ ne 0>
    </if>
    <else>
    </else>

<div id="wrapper">
  <div id="skiptocontent"><a href="#content-wrapper" title="skip to main content" accesskey="k">Skip to Main Content</a></div>
  <div id="header">
    <div id="logo">
      <img src="/resources/theme-zen/images/global/dotLRN-logo.gif" alt=".LRN" width="82" height="45" />
    </div>
    <div id="header-navigation">
      <ul class="compact">
        <if @untrusted_user_id@ ne 0>
          <li>
            <!-- user greeting or login message -->
            #acs-subsite.Welcome_user# |
          </li>
          <li>
            <a href="@whos_online_url@" title="#acs-subsite.Whos_Online_link_label#">
              @num_users_online@
              <if @num_users_online@ eq 1>
                #acs-subsite.Member#
              </if>
              <else>
                #acs-subsite.Members#
              </else>
              #theme-zen.online# |
            </a>
          </li>
        </if>
		<li>
          <a href="#" onclick="setActiveStyleSheet('1col'); return false;"
             title="switch to 1col">
            1col
          </a>
        </li>
        <li>
          <a href="#" onclick="setActiveStyleSheet('highContrast'); return false;"
             title="switch to High Contrast">
            HC
          </a>
        </li> 
        <li>
          <a href="#" onclick="setActiveStyleSheet('508'); return false;"
             title="switch to 508">
            ACC
          </a> |
        </li> 
        <if @untrusted_user_id@ ne 0>
          <li>
            <a href="@logout_url@" title="#acs-subsite.Logout_from_system#" accesskey="L">
              #acs-subsite.Logout# 
            </a>
          </li>
        </if>
        <else>
          <li>
            <a href="/register/">
              #acs-subsite.Log_In#
            </a>
          </li>
        </else>
      </ul>
    </div>

    <div id="breadcrumbs">
      <ul class="compact">
        <if @context:rowcount@ not nil>
          <multiple name="context">
            <li>
              <if @context.url@ not nil>
                <a href="@context.url@">@context.label@</a> :
              </if>
              <else>
                @context.label@
              </else>
            </li>
          </multiple>
        </if>
      </ul>
    </div>
  </div> <!-- /header -->

  <div id="main-navigation">
    <div class="block-marker">Begin main navigation</div>
      <if @navbar@ not nil>@navbar;noquote@</if> 
  </div>

  <if @subnavbar@ not nil>
    <div id="sub-navigation">
      <div class="block-marker">Begin sub navigation</div>
      @subnavbar;noquote@
    </div>
  </if>

  <div id="content-wrapper">
    <div class="block-marker">Begin main content</div>
    <div id="inner-wrapper">

      <if @user_messages:rowcount@ gt 0>
        <div id="alert-message">
          <ul>
            <multiple name="user_messages">
              <div class="alert"><strong>@user_messages.message;noquote@</strong></div>
            </multiple>
          </ul>
        </div>
      </if>

      <if @portal_page_p@ nil>
        <div id="main">
          <div id="main-content">
            <div class="main-content-padding">
      </if>

      <slave>

      <if @portal_page_p@ nil>
            </div> <!-- /main-content-padding -->
          </div> <!-- /main-content -->
        </div> <!-- /main -->
      </if>

    </div> <!-- /inner-wrapper -->
  </div> <!-- /content-wrapper -->

  <div id="footer">
    <div class="block-marker">Begin footer</div>
    <div id="footer-links">
      <ul class="compact">
        <li>#dotlrn.A_dotlrn_Site#</li>
        <li>#acs-subsite.Powered_by_OpenACS#</li>
      </ul>
    </div> <!-- /footer-links -->
  </div> <!-- /footer -->
</div> <!-- /wrapper -->
