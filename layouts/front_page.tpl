<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "bg-picker-variables" %}
  {% include "bg-picker-styles" %}
</head>

<body class="front-page">
  <div class="container">
    <div class="wrap">
      {% include "sidebar" %}

      <main class="content" role="main">
        <div class="main-content bg-picker-area js-bg-picker-area">
          <div class="background-image js-background-image"></div>
          <div class="background-color js-background-color"></div>

          {% if editmode %}<button class="main-content-bg-picker background-settings js-background-settings" data-bg-key="main_content_bg" data-target-width="1400" data-bg-image="{{ main_content_bg_image }}" data-bg-image-sizes="{{ main_content_bg_image_sizes_str | escape }}" data-bg-color="{{ main_content_bg_color }}" data-bg-color-data="{{ main_content_bg_color_data_str | escape }}"></button>{% endif %}

          <div class="background-type js-background-type {{ main_content_bg_type }}">
            <div class="content-formatted">{% content name="slogan" %}</div>
          </div>
        </div>

        <div class="half-content-holder">
          <div class="half-content half-content-1 bg-picker-area js-bg-picker-area">
            <div class="background-image js-background-image"></div>
            <div class="background-color js-background-color"></div>

            {% if editmode %}<button class="half-content-bg-1-picker background-settings js-background-settings" data-bg-key="half_content_bg_1" data-target-width="700" data-bg-image="{{ half_content_bg_1_image }}" data-bg-image-sizes="{{ half_content_bg_1_image_sizes_str | escape }}" data-bg-color="{{ half_content_bg_1_color }}" data-bg-color-data="{{ half_content_bg_1_color_data_str | escape }}"></button>{% endif %}

            <div class="background-type js-background-type {{ half_content_bg_1_type }}">
              <div class="content-formatted">{% content name="frontpage-block-1" %}</div>
            </div>
          </div>
          <div class="half-content half-content-2 bg-picker-area js-bg-picker-area">
            <div class="background-image js-background-image"></div>
            <div class="background-color js-background-color"></div>

            {% if editmode %}<button class="half-content-bg-2-picker background-settings js-background-settings" data-bg-key="half_content_bg_2" data-target-width="700" data-bg-image="{{ half_content_bg_2_image }}" data-bg-image-sizes="{{ half_content_bg_2_image_sizes_str | escape }}" data-bg-color="{{ half_content_bg_2_color }}" data-bg-color-data="{{ half_content_bg_2_color_data_str | escape }}"></button>{% endif %}

            <div class="background-type js-background-type {{ half_content_bg_2_type }}">
              <div class="content-formatted">{% content name="frontpage-block-2" %}</div>
            </div>
          </div>
        </div>

        <div class="half-content-holder">
          <div class="half-content half-content-3 half-content--smaller bg-picker-area js-bg-picker-area">
            <div class="background-image js-background-image"></div>
            <div class="background-color js-background-color"></div>

            {% if editmode %}<button class="half-content-bg-3-picker background-settings js-background-settings" data-bg-key="half_content_bg_3" data-target-width="700" data-bg-image="{{ half_content_bg_3_image }}" data-bg-image-sizes="{{ half_content_bg_3_image_sizes_str | escape }}" data-bg-color="{{ half_content_bg_3_color }}" data-bg-color-data="{{ half_content_bg_3_color_data_str | escape }}"></button>{% endif %}

            <div class="background-type js-background-type {{ half_content_bg_3_type }}">
              <div class="content-formatted">{% content name="frontpage-block-3" %}</div>
            </div>
          </div>
          <div class="half-content half-content-4 half-content--smaller bg-picker-area js-bg-picker-area">
            <div class="background-image js-background-image"></div>
            <div class="background-color js-background-color"></div>

            {% if editmode %}<button class="half-content-bg-4-picker background-settings js-background-settings" data-bg-key="half_content_bg_4" data-target-width="700" data-bg-image="{{ half_content_bg_4_image }}" data-bg-image-sizes="{{ half_content_bg_4_image_sizes_str | escape }}" data-bg-color="{{ half_content_bg_4_color }}" data-bg-color-data="{{ half_content_bg_4_color_data_str | escape }}"></button>{% endif %}

            <div class="background-type js-background-type {{ half_content_bg_4_type }}">
              <div class="content-formatted">{% content name="frontpage-block-4" %}</div>
            </div>
          </div>
        </div>

        {% include "footer" %}
      </main>
    </div>

  </div>

  {% include "javascripts" %}
  {% editorjsblock %}
    <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
    <script>
      var pageData = new Edicy.CustomData({
        type: 'page',
        id: {{page.id}}
      });

      var siteData = new Edicy.CustomData({
        type: 'site'
      });

      $('.js-background-settings').each(function() {
        var $button = $(this);

        var picker = new Edicy.BgPicker(this, {
          picture: true,
          color: true,
          showAlpha: true,
          preview: function(data) {
            Site.bgPickerPreview($button.parent(), data, picker);
          },
          commit: function(data) {
            Site.bgPickerCommit($button.data('bg-key'), data, 'contentPage', picker);
          }
        });
      });

      Site.toggleFlags();
    </script>
  {% endeditorjsblock %}
</body>
</html>
