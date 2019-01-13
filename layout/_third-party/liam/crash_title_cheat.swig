{% if theme.crash_title_cheat.enable %}
<script type="text/javascript">
var crashSwitched = false;
var originalTitle = document.title;
var titleTime;
document.addEventListener('visibilitychange', function () {
  if (document.hidden) {
    if (Math.random() < parseFloat({{ theme.crash_title_cheat.probability }})) {
      crashSwitched = true;
      document.title = '{{ theme.crash_title_cheat.crash_string }}' + originalTitle;
      clearTimeout(titleTime);
    }
  } else {
    if (crashSwitched == true) {
      crashSwitched = false;
      document.title = '{{ theme.crash_title_cheat.recover_string }}' + originalTitle;
      titleTime = setTimeout(function () {
        document.title = originalTitle;
      }, 2000);
    }
  }
});
</script>
{% endif %}
