<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include 'bg-picker-variables' with 'article' %}
</head>

<body class="post-page{% if editmode %} editmode{% endif %}">
  {% include "mobile-header" %}
  <div class="container">
    <div class="wrap">
      {% include "sidebar" %}

      <main class="content" role="main">
        {% include "post-box" with "article" %}

        {% unless article.new_record? %}
        <section id="comments" class="comments content-formatted">
          {% if article.comments_count > 0 %}
            <h2 class="comments-title">{{ "comments_for_count" | lc }} <span class="edy-site-blog-comments-count">({{ article.comments_count }})</span></h2>

            <div class="comment-messages content-formatted">
              {% for comment in article.comments reversed %}
                <div class="comment edy-site-blog-comment">
                  <strong class="comment-author">{{ comment.author }}</strong>
                  ·
                  <span class="comment-date">{{ comment.created_at | format_date: "long" }}</span>
                  <p class="comment-body">{{ comment.body_html }}</p>
                  {% if editmode %}<span class="comment-delete">{% removebutton %}</span>{% endif %}
                </div>
              {% endfor %}
            </div>
          {% else %}
            <h2 class="comments-title">{{ "no_comments" | lc }}</h2>
          {% endif %}

          {% include "comment-form" %}
          {% endunless %}
        </section>

        {% include "voog-reference" %}
      </main>

      {% include "footer" %}
    </div>
  </div>

  {% include "javascripts" %}
  {% include "bg-picker" with 'article' %}
  <script>
    {% unless body_image == nil or body_image == '' %}
      $.backstretch('{{ body_image }}');
    {% endunless %}

    site.initPostPage();
  </script>


</body>
</html>
