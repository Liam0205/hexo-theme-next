{% if theme.crash_title_cheat.enable %}
<script type="text/javascript">
var originalTitle = document.title;
var titleTime;
document.addEventListener('visibilitychange', function () {
    if (document.hidden) {
        document.title = '{{ theme.crash_title_cheat.crash_string }}' + originalTitle;
        clearTimeout(titleTime);
    } else {
        document.title = '{{ theme.crash_title_cheat.recover_string }}' + originalTitle;
        titleTime = setTimeout(function () {
            document.title = originalTitle;
        }, 2000);
    }
});
</script>
{% endif %}
