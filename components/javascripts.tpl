{% comment %}SITE WIDE JAVASCRIPTS{% endcomment %}
<script src="{{ javascripts_path }}/application.min.js"></script>
{% sitejs_include %}

{% if site.search.enabled %}
<script src="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.js"></script>
<script>
  var search = new VoogSearch($('.js-search-form').get(0), {
    lang: '{{ page.language_code }}'
  });

  $('.js-search-form').on('sitesearch:showmodal', function() {
    var $modal = $('.voog-search-modal');

    if(!$modal.find('.close-btn').length) {
      $modal.find('.voog-search-modal-inner').prepend('<button class="close-btn" />');
    }

    $modal.one('click', '.close-btn', function(event) {
      search.hideModal();

      return false;
    })
  });

  $('.js-search-form').on('sitesearch:hidemodal', function() {
    $('.voog-search-modal').off('click', '.close-btn');
  });
</script>
{% endif %}

{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script type="text/javascript">
    window.edy = window.edy || [];
    edy.push(['texteditorStyles', {name: '{{ "button" | lc: editor_locale }}', tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);

    var pageData = new Edicy.CustomData({
      type: 'page',
      id: {{page.id}}
    });

    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    Site.toggleFlags();
  </script>
{% endeditorjsblock %}
<script>
  Site.expandMenu();
</script>

{% comment %}GOOGLE ANALYTICS INITIATION{% endcomment %}
{% unless editmode %}{{ site.analytics }}{% endunless %}
