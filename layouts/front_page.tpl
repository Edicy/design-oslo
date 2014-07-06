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
        <header class="content-header">
          {% if editmode or site.header.size > 0 %}<div class="content-title content-formatted">{% editable site.header %}</div>{% endif %}

          {% capture content_slogan_html %}{% unless editmode %}{% content name="slogan" %}{% endunless %}{% endcapture %}
          <div class="content-slogan content-formatted js-content-optional">{% content name="slogan" %}</div>
        </header>

        <section class="content-body content-formatted">{% content %}</section>
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
