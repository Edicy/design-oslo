<article class="post">
  <header class="post-header content-formatted">
    <div class="post-meta">
      <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | format_date : "%b %-d, %Y" }}</time>
      {% if post-box != "article" and article.comments_count > 0 %}
        <a href="{{ article.url }}#comments" class="post-comments-count">{{ "comments_for_count" | lc}}: {{ article.comments_count }}</a>
      {% endif %}
      <span class="post-author">{{ article.author.name }}</span>
    </div>
    <h1 class="post-title">{% if post-box == "article" %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h1>
  </header>

  <div class="post-content content-formatted">
    <div class="post-excerpt">{% if post-box == "article" %}{% editable article.excerpt %}{% else %}{{ article.excerpt }}{% endif %}</div>
    {% if post-box == "article" %}
      <div class="post-body">{% editable article.body %}</div>
      {% include "tags-post" %}
    {% else %}
      <a href="{{ article.url }}" class="post-read-more">{{ "read_more" | lc }}</a>
    {% endif %}
  </div>
</article>
