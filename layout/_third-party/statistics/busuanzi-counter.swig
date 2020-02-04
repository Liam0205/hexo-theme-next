{%- if theme.busuanzi_count.enable %}
<div class="busuanzi-count">
  <script{{ pjax }} async src="https://busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>

  {%- if theme.busuanzi_count.total_visitors %}
    <span class="post-meta-item" id="busuanzi_container_site_uv" style="display: none;">
      <span class="post-meta-item-icon">
        <i class="fa fa-{{ theme.busuanzi_count.total_visitors_icon }}"></i>
      </span>
      <span class="site-uv" title="{{ __('footer.total_visitors') }}">
        <span id="busuanzi_value_site_uv"></span>
      </span>
    </span>
  {%- endif %}

  {%- if theme.busuanzi_count.total_visitors and theme.busuanzi_count.total_views %}
    <span class="post-meta-divider">|</span>
  {%- endif %}

  {%- if theme.busuanzi_count.total_views %}
    <span class="post-meta-item" id="busuanzi_container_site_pv" style="display: none;">
      <span class="post-meta-item-icon">
        <i class="fa fa-{{ theme.busuanzi_count.total_views_icon }}"></i>
      </span>
      <span class="site-pv" title="{{ __('footer.total_views') }}">
        <span id="busuanzi_value_site_pv"></span>
      </span>
    </span>
  {%- endif %}
</div>

{% if theme.busuanzi_count.adjustment.enable %}
<script>
  window.addEventListener('DOMContentLoaded', function() {
    {% if theme.busuanzi_count.total_visitors %}
    var intervalTotalVisitors = setInterval(fixTotalVisitors, 100);
    var offsetTotalVisitors   = parseInt({{ theme.busuanzi_count.adjustment.offset_total_visitors }});
    function fixTotalVisitors() {
      if (document.getElementById('busuanzi_container_site_uv').style.display != "none") {
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
      if (document.getElementById('busuanzi_container_site_pv').style.display != "none") {
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
