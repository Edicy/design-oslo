<div class="tags">
  {% if editmode %}
    <div class="tags-editor">{% editable article.tags %}</div>
  {% else %}
    {% unless article.tags == empty %}
      <nav class="menu-tags">
        <ul class="menu">
          {% for tag in article.tags %}
            <li class="menu-item"><a class="menu-link" href="{{ page.url }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
          {% endfor %}
        </ul>
      </nav>
    {% endunless %}
  {% endif %}
</div>
