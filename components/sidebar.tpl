<aside class="sidebar">
  <div class="sidebar-header">
    <div class="sidebar-title content-formatted">{% unless editmode %}<a href="{{ site.root_item.url }}">{% endunless %}{% editable site.header %}{% unless editmode %}</a>{% endunless %}</div>

    {% if site.visible_menuitems.size > 0 or site.has_many_languages? or editmode %}<button class="menu-btn"></button>{% endif %}
  </div>

  <div class="sidebar-inner-content">
    <button class="menu-btn"></button>
    <nav class="menu-main">
      {% include "menu-level-1" %}
    </nav>

    {% if editmode or site.has_many_languages? %}
      {% include "menu-lang" %}
    {% endif %}

    {% if site.search.enabled %}{% include "search" %}{% endif %}
  </div>
</aside>
