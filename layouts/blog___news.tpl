<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "bg-picker-variables" %}
  {{ blog.rss_link }}
  {{ site.stats_header }}
</head>

<body class="blog-page">
  <div class="container">
    <div class="wrap">
      {% include "sidebar" %}

      <main class="content" role="main">
        {% addbutton %}
        {% for article in articles %}
          {% include "post-box" %}
        {% endfor %}
      </main>
    </div>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "bg-picker" %}
  <script>
    $(document).ready(function() {
      currentUrl = window.location.href;
      blogUrl = "{{ site.url }}{{ page.path }}";
      if (currentUrl === blogUrl) {
        $(".js-tags-all").addClass("active");
      };
    });

    {% unless body_image == nil or body_image == '' %}
      $.backstretch('{{ body_image }}');
    {% endunless %}

    site.initBlogPage();
  </script>
</body>
</html>
