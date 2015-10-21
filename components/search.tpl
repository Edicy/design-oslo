{% if site.search.enabled %}
  <div class="search js-search js-modal-overlay">
    <div class="search-inner js-modal">
      <form id="search" class="search-form js-search-form" method="get" action="#">
        <input id="onpage_search" class="search-input js-search-input" type="text" placeholder="{{ "search" | lc }}">
      </form>
    </div>
  </div>
{% endif %}
