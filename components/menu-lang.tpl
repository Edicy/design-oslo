<nav class="menu-lang js-prevent-sideclick{% if flags_state == true %} flags-enabled{% else %} flags-disabled{% endif %}">
  <button class="lang-menu-btn js-lang-menu-btn js-popup-menu-btn lang-flag {% for language in site.languages %}{% if language.selected? %}lang-flag-{{ language.code }}{% endif %}{% endfor %}"></button>
  <ol class="menu">
    {% for language in site.languages %}
      <li{% if language.selected? %} class="active"{% endif %}>
        <a href="{{ language.url }}" class="lang-flag lang-flag-{{ language.code }}">{{ language.title }}</a>
      </li>
    {% endfor %}
    {% if editmode %}
      <li class="edit-btn">{% languageadd %}</li>
      <li class="lang-options">
        <button class="option-btn js-option-toggle-flags{% if flags_state == true %} js-flag-disable-btn{% endif %}">
          <span class="disable-text">{{ "disable_lang_flags" | lc: editor_locale }}</span>
          <span class="enable-text">{{ "enable_lang_flags" | lc: editor_locale }}</span>
        </button>
      </li>
    {% endif %}
  </ol>
</nav>
