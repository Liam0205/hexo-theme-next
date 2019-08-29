{%- set mhchem_uri = theme.vendors.mhchem | default('//cdn.jsdelivr.net/npm/mathjax-mhchem@3') %}
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
{%- set mathjax_uri = theme.vendors.mathjax | default('//cdn.jsdelivr.net/npm/mathjax@2/MathJax.js?config=TeX-AMS-MML_HTMLorMML') %}
<script>
  NexT.utils.getScript('{{ mathjax_uri }}', () => {
    MathJax.Hub.Typeset();
  }, window.MathJax);
</script>

<script type="text/javascript">
function yuuki_query_all_nodes_as_array(selector) {
  return Array.prototype.slice.call(document.querySelectorAll(selector), 0);
}

function replace_code_to_span(node) {
  is_inline_math = /^\$(.*)\$$/.exec(node.textContent);
  is_display_math = /^\$\$(.*)\$\$$/ms.exec(node.textContent) ||
          /^\\begin\{.+\}(.*)\\end\{.+\}/ms.exec(node.textContent);
  if (is_inline_math || is_display_math) {
    var parent = node.parentNode;
    var replacement = document.createElement('span');
    if (is_display_math) {
      replacement.class = "yuuki_mathjax_inline"
    } else {
      replacement.class = "yuuki_mathjax_display"
    }
    replacement.textContent = node.textContent;
    parent.replaceChild(replacement, node);
  }
}

document.addEventListener('DOMContentLoaded', function() {
  yuuki_query_all_nodes_as_array("code").map(replace_code_to_span);
});
</script>
