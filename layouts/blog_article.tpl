<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include 'bg-picker-variables' with 'article' %}
</head>

<body class="post-page">
  <div class="container">
    <div class="wrap">
      {% include "sidebar" %}

      <main class="content" role="main">
        {% include "post-box" with "article" %}

        <section id="comments" class="comments content-formatted">
          {% if article.comments_count > 0 %}
            <h2 class="comments-title">{{ "comments_for_count" | lc }}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></h2>

            <div class="comment-messages content-formatted">
              {% for comment in article.comments reversed %}
                <div class="comment edy-site-blog-comment">
                  <span class="comment-body">{{ comment.body_html }}</span>
                  <span class="comment-author">({{ comment.author }},</span>
                  <span class="comment-date">{{ comment.created_at | format_date: "long" }})</span>
                  <span class="comment-delete">{% removebutton %}</span>
                </div>
              {% endfor %}
            </div>
          {% endif %}

          {% include "comment-form" %}
        </section>
      </main>
    </div>

    {% include "footer" %}
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
