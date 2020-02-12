{%- set mhchem_uri = theme.vendors.mhchem or '//cdn.jsdelivr.net/npm/mathjax-mhchem@3' %}
<script type="text/x-mathjax-config">
  {%- if theme.math.mathjax.mhchem %}
    MathJax.Ajax.config.path['mhchem'] = '{{ mhchem_uri }}';
  {%- endif %}

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
        while (next && next.nodeName.toLowerCase() === '#text') {
          next = next.nextSibling;
        }
        if (next && next.nodeName.toLowerCase() === 'br') {
          next.parentNode.removeChild(next);
        }
      }
    });
  });

  MathJax.Hub.Queue(function() {
    var all = MathJax.Hub.getAllJax(), i;
    for (i = 0; i < all.length; i += 1) {
      element = document.getElementById(all[i].inputID + '-Frame').parentNode;
      if (element.nodeName.toLowerCase() == 'li') {
        element = element.parentNode;
      }
      element.classList.add('has-jax');
    }
  });
</script>
{%- set mathjax_uri = theme.vendors.mathjax or '//cdn.jsdelivr.net/npm/mathjax@2/MathJax.js?config=TeX-AMS-MML_HTMLorMML' %}
<script>
  NexT.utils.getScript('{{ mathjax_uri }}', () => {
    {%- if theme.math.mathjax.math_in_verbatim %}
    document.querySelectorAll('code').forEach(code => {
      const text = code.innerHTML;
      // is_inline_math  = /^\$(.*)\$$/.exec(text) || /^\\\((.*)\\\)$/.exec(text);
      // is_display_math = /^\$\$(.*)\$\$$/ms.exec(text) || /^\\begin\{.+\}(.*)\\end\{.+\}/ms.exec(text);
      if (/^\$\$(.*)\$\$$/ms.exec(text) || /^\\begin\{.+\}(.*)\\end\{.+\}/ms.exec(text)) {
        code.outerHTML = "<span class='yuuki_mathjax_display has-jax'>" + text + "</span>";
      } else if (/^\$(.*)\$$/.exec(text) || /^\\\((.*)\\\)$/.exec(text)) {
        code.outerHTML = "<span class='yuuki_mathjax_inline has-jax'>"  + text + "</span>";
      }
    });
    {%- endif %}
    MathJax.Hub.Typeset();
  }, window.MathJax);
</script>
