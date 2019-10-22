<div class="reward-container">
  <div>{{ theme.reward_settings.comment }}</div>
  <button disable="enable" onclick="var qr = document.getElementById(&quot;qr&quot;); qr.style.display = (qr.style.display === 'none') ? 'block' : 'none';">
    {{ __('reward.donate') }}
  </button>
  <div id="qr" style="display: none;">

    {% for name, image in theme.reward %}
      {% set paypal_exclude = ['paypal_id', 'paypal_img'] %}
      {% if !paypal_exclude.includes(name) %}
        {% set builtin = ['wechatpay', 'alipay', 'bitcoin'] %}
        {% if builtin.includes(name) %}
          {% set translation = __('reward.' + name) %}
        {% else %}
          {% set translation = name %}
        {% endif %}
        <div style="display: inline-block;">
          <img src="{{ url_for(image) }}" alt="{{ author }} {{ translation }}">
          <p>{{ translation }}</p>
        </div>
      {% endif %}
    {% endfor %}

    {% if theme.reward.paypal_id %}
      <div id="paypal" style="display: inline-block;">
        <img id="paypal_form">
          <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
          <input type="hidden" name="cmd" value="_donations" />
          <input type="hidden" name="business" value="{{ theme.reward.paypal_id }}" />
          <input type="hidden" name="item_name" value="If you like my blog, please consider to buy a cup of coffee for me. Thanks!" />
          <input type="hidden" name="currency_code" value="USD" />
          <input type="image" src="{{ url_for(theme.reward.paypal_img) }}" border="0" name="submit" />
          </form>
        </img>
        <p>{{ __('reward.paypal') }}</p>
      </div>
    {% endif %}

  </div>
</div>
