<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "bg-picker-variables" %}
  {{ site.stats_header }}
</head>

<body class="front-page">
  <div class="container">
    <div class="wrap">
      {% include "sidebar" %}

      <main class="content" role="main">
        <div class="wrap">
          <div class="content-box large-content-box">
            <div class="content-box-inner">
              <div class="content-box-content">
              <div class="content-box-content-inner">
                Small bites for gold night
              </div>
              </div>
            </div>
          </div>
        </div>

        <div class="wrap">
          <div class="content-box medium-content-box">
            <div class="content-box-inner">
              <div>Small bites for gold night</div>
            </div>
          </div>

          <div class="content-box medium-content-box">
            <div class="content-box-inner">
              <div>Small bites for gold night</div>
            </div>
          </div>
        </div>

        <div class="wrap">
          <div class="content-box small-content-box">
            <div class="content-box-inner">
              <div>Small bites for gold night</div>
            </div>
          </div>

          <div class="content-box small-content-box">
            <div class="content-box-inner">
              <div>Small bites for gold night</div>
            </div>
          </div>
        </div>
      </main>
    </div>

    {% include "footer" %}

  </div>

  {% include "javascripts" %}
  {% include "bg-picker" %}
  <script>
    {% unless body_image == nil or body_image == '' %}
      $.backstretch('{{ body_image }}');
    {% endunless %}

    site.initFrontPage();
  </script>
</body>
</html>
