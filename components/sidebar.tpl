<aside class="sidebar">
  <div class="sidebar-title content-formatted">{% unless editmode %}<a href="{{ site.root_item.url }}">{% endunless %}{% editable site.header %}{% unless editmode %}</a>{% endunless %}</div>

  <nav class="menu-main js-menu-main js-popover">
    {% include "menu-level-1" %}

    {% if editmode or site.has_many_languages? %}
      <div class="menu-lang">
        {% include "menu-lang" %}
      </div>
    {% endif %}
  </nav>
</aside>
