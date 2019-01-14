<div style="padding: 10px 0; margin: 20px auto; width: 90%; text-align: center;">
  <div>{{ theme.reward.comment }}</div>
  <button id="rewardButton" disable="enable" onclick="var qr = document.getElementById('QR'); if (qr.style.display === 'none') {qr.style.display='block';} else {qr.style.display='none'}">
    <span>{{ __('reward.donate') }}</span>
  </button>
  <div id="QR" style="display: none;">

    {% if theme.reward.wechatpay %}
      <div id="wechat" style="display: inline-block">
        <img id="wechat_qr" src="{{ url_for(theme.reward.wechatpay) }}" alt="{{ author }} {{ __('reward.wechatpay') }}"/>
        <p>{{ __('reward.wechatpay') }}</p>
      </div>
    {% endif %}

    {% if theme.reward.alipay %}
      <div id="alipay" style="display: inline-block">
        <img id="alipay_qr" src="{{ url_for(theme.reward.alipay) }}" alt="{{ author }} {{ __('reward.alipay') }}"/>
        <p>{{ __('reward.alipay') }}</p>
      </div>
    {% endif %}

    {% if theme.reward.paypal %}
      <div id="paypal" style="display: inline-block">
        <!-- <img id="paypal_qr" src="{{ url_for(theme.reward.paypal) }}" alt="{{ author }} {{ __('reward.paypal') }}"/> -->
        <img id="paypal_form">
          <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
          <input type="hidden" name="cmd" value="_donations" />
          <input type="hidden" name="business" value="{{ theme.reward.paypal }}" />
          <input type="hidden" name="item_name" value="If you like my blog, please consider to buy a cup of coffee for me. Thanks!" />
          <input type="hidden" name="currency_code" value="USD" />
          <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Donate with PayPal button" />
          <!-- <img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1" /> -->
          </form>
        </img>
        <p>{{ __('reward.paypal') }}</p>
      </div>
    {% endif %}

    {% if theme.reward.bitcoin %}
      <div id="bitcoin" style="display: inline-block">
        <img id="bitcoin_qr" src="{{ url_for(theme.reward.bitcoin) }}" alt="{{ author }} {{ __('reward.bitcoin') }}"/>
        <p>{{ __('reward.bitcoin') }}</p>
      </div>
    {% endif %}

  </div>
</div>
