{%- if theme.busuanzi_count.enable %}
<div class="busuanzi-count">
  <script{{ pjax }} async src="https://busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>

  {%- if theme.busuanzi_count.total_visitors %}
    <span class="post-meta-item-icon">
      <i class="fa fa-{{ theme.busuanzi_count.total_visitors_icon }}"></i>
    </span>
    <span class="site-uv" id="busuanzi_container_site_uv" title="{{ __('footer.total_visitors') }}" style='display:none'>
      <span class="busuanzi-value" id="busuanzi_value_site_uv"></span>
    </span>
  {%- endif %}

  {%- if theme.busuanzi_count.total_visitors and theme.busuanzi_count.total_views %}
    <span class="post-meta-divider">|</span>
  {%- endif %}

  {%- if theme.busuanzi_count.total_views %}
    <span class="post-meta-item-icon">
      <i class="fa fa-{{ theme.busuanzi_count.total_views_icon }}"></i>
    </span>
    <span class="site-pv" id="busuanzi_container_site_pv" title="{{ __('footer.total_views') }}" style='display:none'>
      <span class="busuanzi-value" id="busuanzi_value_site_pv"></span>
    </span>
  {%- endif %}
</div>

{% if theme.busuanzi_count.adjustment.enable %}
<script src="{{ url_for(theme.js) }}/liam/tools.js"></script>
<script>
  ready(function() {
    {% if theme.busuanzi_count.total_visitors %}
    var intervalTotalVisitors = setInterval(fixTotalVisitors, 100);
    var offsetTotalVisitors   = parseInt({{ theme.busuanzi_count.adjustment.offset_total_visitors }});
    function fixTotalVisitors() {
      if (getStyleByID("busuanzi_container_site_uv", "display") != "none") {
        clearInterval(intervalTotalVisitors);
        var el = document.getElementById("busuanzi_value_site_uv");
        var value = parseInt(el.innerHTML) + offsetTotalVisitors;
        el.innerHTML = '' + value;
      }
    }
    {% endif %}
    {% if theme.busuanzi_count.total_views %}
    var intervalTotalViews = setInterval(fixTotalViews, 100);
    var offsetTotalViews   = parseInt({{ theme.busuanzi_count.adjustment.offset_total_views }});
    function fixTotalViews() {
      if (getStyleByID("busuanzi_container_site_pv", "display") != "none") {
        clearInterval(intervalTotalViews);
        var el = document.getElementById("busuanzi_value_site_pv");
        var value = parseInt(el.innerHTML) + offsetTotalViews;
        el.innerHTML = '' + value;
      }
    }
    {% endif %}
  });
</script>
{% endif %}
{% endif %}
