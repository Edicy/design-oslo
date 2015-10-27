<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "bg-picker-variables" %}
</head>

<body class="blog-page{% if editmode %} editmode{% endif %}">
  {% include "mobile-header" %}
  <div class="container">
    <div class="wrap">
      {% include "sidebar" %}

      <main class="content" role="main">
        {% include "tags-blog" %}

        {% addbutton %}
        {% for article in articles %}
          {% include "post-box" %}
        {% endfor %}

        {% include "voog-reference" %}
      </main>

      {% include "footer" %}
    </div>
  </div>

  {% include "javascripts" %}
  <script>
    site.initBlogPage();
  </script>
</body>
</html>
