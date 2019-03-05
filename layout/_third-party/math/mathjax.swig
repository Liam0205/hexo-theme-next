<script type="text/x-mathjax-config">
  {% if theme.math.mathjax.mhchem %}
    MathJax.Ajax.config.path['mhchem'] = '{{ theme.math.mathjax.mhchem }}';
  {% endif %}

  MathJax.Hub.Config({
    tex2jax: {
      inlineMath: [ ['$', '$'], ['\\(', '\\)'] ],
      processEscapes: true,
      skipTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code']
    },
    TeX: {
      {% if theme.math.mathjax.mhchem %}
        extensions: ["AMSmath.js", "AMSsymbols.js", "autobold.js", "[mhchem]/mhchem.js"],
      {% else %}
        extensions: ["AMSmath.js", "AMSsymbols.js", "autobold.js"],
      {% endif %}
      equationNumbers: {
        autoNumber: 'AMS'
      }
    }
  });
  MathJax.Hub.Register.StartupHook('TeX Jax Ready', function() {
    MathJax.InputJax.TeX.prefilterHooks.Add(function(data) {
      if (data.display) {
        var next = data.script.nextSibling;
        while (next && next.nodeName.toLowerCase() === '#text') { next = next.nextSibling }
        if (next && next.nodeName.toLowerCase() === 'br') { next.parentNode.removeChild(next) }
      }
    });
  });
</script>

<script type="text/x-mathjax-config">
  MathJax.Hub.Queue(function() {
    var all = MathJax.Hub.getAllJax(), i;
      for (i = 0; i < all.length; i += 1) {
        all[i].SourceElement().parentNode.className += ' has-jax';
      }
  });
</script>

<script type="text/javascript">
$(document).ready(function(){
  $("code").map(function(){
    match = /^\$(.*)\$$/.exec($(this).html());
    if (match) {
      $(this).replaceWith("<span class=hpl_mathjax_inline>" + $(this).html() + "</span>");
      MathJax.Hub.Queue(["Typeset",MathJax.Hub,$(this).get(0)]);
    }
    match = /^\$\$/.exec($(this).html());
    if (match) {
      $(this).replaceWith("<span class=hpl_mathjax_inline>" + $(this).html() + "</span>");
      MathJax.Hub.Queue(["Typeset",MathJax.Hub,$(this).get(0)]);
    }
    match = /^\\begin/.exec($(this).html());
    if (match) {
      $(this).replaceWith("<span class=hpl_mathjax_inline>" + $(this).html() + "</span>");
      MathJax.Hub.Queue(["Typeset",MathJax.Hub,$(this).get(0)]);
    }
  });
});
</script>

<script src="{{ theme.math.mathjax.cdn }}"></script>

<style>
.MathJax_Display {
  overflow-x: scroll;
  overflow-y: hidden;
}
</style>
