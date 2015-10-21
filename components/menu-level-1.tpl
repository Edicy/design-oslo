<ul class="menu">
  {% unless site.root_item.hidden? %}
    <li class="menu-item">
      <a class="menu-link{% if site.root_item.selected? %} active{% endif %}" href="{{ site.root_item.url }}">{{ site.root_item.title }}</a>
    </li>
  {% endunless %}

  {% for item in site.visible_menuitems %}
    <li class="menu-item">
      <a class="menu-link{% if item.selected? %} active{% endif %}{% unless item.translated? %} untranslated fci-editor-menuadd{% endunless %}" href="{{ item.url }}">{{ item.title }}</a>

      {% if item.selected? %}
        {% if item.children? or editmode %}
          <div class="menu-sub">
            <ul class="menu">
              {% for subitem in item.visible_children %}
                <li class="menu-item">
                  <a class="menu-link{% if subitem.selected? %} active{% endif %}{% unless subitem.translated? %} untranslated fci-editor-menuadd{% endunless %}" href="{{ subitem.url }}">{{ subitem.title }}</a>
                  {% if subitem.selected? %}
                    {% if subitem.children? or editmode %}
                    <div class="menu-third">
                      <ul class="menu">
                        {% for thirditem in subitem.visible_children %}
                        <li class="menu-item">
                          <a class="menu-link{% if thirditem.selected? %} active{% endif %}{% unless thirditem.translated? %} untranslated fci-editor-menuadd{% endunless %}" href="{{ thirditem.url }}">{{ thirditem.title }}</a>
                        </li>
                        {% endfor %}

                        {% if subitem.hidden_children.size > 0 %}
                          <li class="edit-btn">{% menubtn subitem.hidden_children %}</li>
                        {% endif %}

                        {% if editmode %}
                          <li class="edit-btn">{% menuadd parent="subitem" %}</li>
                        {% endif %}
                      </ul>
                    </div>
                    {% endif %}
                  {% endif %}
                </li>
              {% endfor %}

              {% if item.hidden_children.size > 0 %}
                <li class="edit-btn">{% menubtn item.hidden_children %}</li>
              {% endif %}

              {% if editmode %}
                <li class="edit-btn">{% menuadd parent="item" %}</li>
              {% endif %}
            </ul>
          </div>
        {% endif %}
      {% endif %}
    </li>
  {% endfor %}

  {% if editmode %}
    {% if site.hidden_menuitems.size > 0 %}
      <li class="edit-btn">{% menubtn site.hidden_menuitems %}</li>
    {% endif %}

    <li class="edit-btn">{% menuadd %}</li>
  {% endif %}
</ul>
