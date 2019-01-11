<script>
if (!yuukiReaddata(window.location.href + "fool")) {
    document.body.classList.add('yuuki-fool-egg');
    window.setTimeout(function() {
        yuukiSavedata(window.location.href + "fool", window.location.href + "fool");
        alert("{{ theme.april_fool.string }}");
        document.body.classList.remove('yuuki-fool-egg');
    }, {{ theme.april_fool.time }});
}

function yuukiSavedata(key, data) {
    key = 'yuuki_' + key;
    data = JSON.stringify(data);
    if (window.localStorage) {
        localStorage.setItem(key, data);
    }
}

function yuukiReaddata(key) {
    if (!window.localStorage) return '';
    key = 'yuuki_' + key;
    return JSON.parse(localStorage.getItem(key));
}
</script>

<style>
.yuuki-fool-egg {
    -webkit-transform: matrix(-1, 0, 0, 1, 0, 0);
    -moz-transform: matrix(-1, 0, 0, 1, 0, 0);
    transform: matrix(-1, 0, 0, 1, 0, 0);
    -o-transform: skew(0deg, 180deg) scale(-1, 1);
    filter:progid: DXImageTransform.Microsoft.BasicImage(mirror=1);
}
</style>
