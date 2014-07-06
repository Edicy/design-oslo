<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "bg-picker-variables" %}
  {{ site.stats_header }}
</head>

<body class="common-page">
  <div class="container">
    {% include "sidebar" %}

    <main class="content" role="main">
      <header class="content-header content-formatted">{% content name="slogan" %}</header>
      <section class="content-body content-formatted">{% content %}</section>
    </main>

    {% include "footer" %}

  </div>

  {% include "javascripts" %}
  {% include "bg-picker" %}
  <script>
    {% unless body_image == nil or body_image == '' %}
      $.backstretch('{{ body_image }}');
    {% endunless %}

    site.initCommonPage();
  </script>
</body>
</html>
