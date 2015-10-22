{% if site.has_language_tags? %}
  <nav class="menu-tags">
    <ul class="menu">
      <li class="menu-item">
        <a class="menu-link js-tags-all{% unless tags %} active{% endunless %}" href="{{ page.url }}">{{ 'all_posts' | lc }}</a>
      </li>
      {% for tag in site.language_tags %}
        {% assign activestr = "" %}
        {% for tmptag in tags %}
          {% if tmptag.name == tag.name %}
            {% assign activestr = " active" %}
          {% endif %}
        {% endfor %}
        <li class="menu-item">
          <a class="menu-link{{ activestr }}" href="{{ page.url }}/tagged/{{ tag.path }}">{{ tag.name }}</a>
        </li>
      {% endfor %}
    </ul>
  </nav>
{% endif %}
