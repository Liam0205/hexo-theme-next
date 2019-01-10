{% if theme.busuanzi_count.enable %}
<div class="busuanzi-count">
  <script async src="https://busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>

  {% if theme.busuanzi_count.total_visitors %}
    <span class="site-uv" id="busuanzi_container_site_uv" title="{{ __('footer.total_visitors') }}" style='display:none'>
      <i class="fa fa-{{ theme.busuanzi_count.total_visitors_icon }}"></i>
      <span class="busuanzi-value" id="busuanzi_value_site_uv"></span>
    </span>
  {% endif %}

  {% if theme.busuanzi_count.total_views %}
    <span class="site-pv" id="busuanzi_container_site_pv" title="{{ __('footer.total_views') }}" style='display:none'>
      <i class="fa fa-{{ theme.busuanzi_count.total_views_icon }}"></i>
      <span class="busuanzi-value" id="busuanzi_value_site_pv"></span>
    </span>
  {% endif %}
</div>

{% if theme.busuanzi_count.adjustment.enable %}
<script src="//cdn.jsdelivr.net/npm/jquery@2/dist/jquery.min.js"></script>
<script>
  $(document).ready(function() {
    var interval = setInterval(fixCount, 100);
    var offset_total_views    = parseInt({{ theme.busuanzi_count.adjustment.offset_total_views }});
    var offset_total_visitors = parseInt({{ theme.busuanzi_count.adjustment.offset_total_visitors }});
    function fixCount() {
      if ($("#busuanzi_container_site_pv").css("display") != "none" && $("#busuanzi_container_site_uv").css("display") != "none") {
        clearInterval(interval);
        $("#busuanzi_value_site_pv").html(parseInt($("#busuanzi_value_site_pv").html()) + offset_total_views);
        $("#busuanzi_value_site_uv").html(parseInt($("#busuanzi_value_site_uv").html()) + offset_total_visitors);
      }
    }
  });
</script>
{% endif %}
{% endif %}
