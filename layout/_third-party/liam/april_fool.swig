<script>
if (!yuukiReaddata(window.location.href + "fool")) {  // 如果没有触发过彩蛋
    document.body.classList.add('yuuki-fool-egg');     // 给 body 增加彩蛋 class
    window.setTimeout(function() {     // 定时退出彩蛋
        yuukiSavedata(window.location.href + "fool", window.location.href + "fool");     // 记录彩蛋已被执行
        alert("恭喜发现愚人节彩蛋，确认后页面将恢复正常。——Liam Huang (Yuuki)");     // 弹窗（这里可以自己发挥）
        document.body.classList.remove('yuuki-fool-egg');
    }, 10000);   // 这里的 10000 代表 10s，也就是经过 10s 后弹窗，并退出彩蛋
}

// 写入 Cookie
function yuukiSavedata(key, data) {
    key = 'yuuki_' + key;
    data = JSON.stringify(data);
    if (window.localStorage) {
        localStorage.setItem(key, data);
    }
}

// 读取 Cookie
function yuukiReaddata(key) {
    if (!window.localStorage) return '';
    key = 'yuuki_' + key;
    return JSON.parse(localStorage.getItem(key));
}
</script>

<style>
/* 彩蛋的样式代码 */
.yuuki-fool-egg {
    -webkit-transform: matrix(-1, 0, 0, 1, 0, 0);
    -moz-transform: matrix(-1, 0, 0, 1, 0, 0);
    transform: matrix(-1, 0, 0, 1, 0, 0);
    -o-transform: skew(0deg, 180deg) scale(-1, 1);
    filter:progid: DXImageTransform.Microsoft.BasicImage(mirror=1);
}
</style>
