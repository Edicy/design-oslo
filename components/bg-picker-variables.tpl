{% capture dont_render %}
  {% comment %}ASSIGN LANGUAGE MENU FLAGS STATE{% endcomment %}
  {% if site.data.flags_state == nil %}
    {% assign flags_state = false %}
  {% else %}
    {% assign flags_state = site.data.flags_state %}
  {% endif %}

  {% comment %}MAIN CONTENT AREA RELATED VARIABLES.{% endcomment %}
  {% assign main_content_bg = page.data.main_content_bg %}
  {% assign main_content_bg_image = main_content_bg.image %}
  {% assign main_content_bg_image_sizes = main_content_bg.imageSizes %}
  {% assign main_content_bg_color = main_content_bg.color %}
  {% assign main_content_bg_color_data = main_content_bg.colorData %}
  {% assign main_content_bg_combined_lightness = main_content_bg.combinedLightness %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if main_content_bg %}
    {% if main_content_bg_combined_lightness %}
      {% if main_content_bg_combined_lightness > 0.5 %}
        {% assign main_content_bg_type = "light-background" %}
      {% else %}
        {% assign main_content_bg_type = "dark-background" %}
      {% endif %}
    {% else %}
      {% if main_content_bg_color_data.a >= 0.5 %}
        {% if main_content_bg_color_data.lightness >= 0.5 %}
          {% assign main_content_bg_type = "light-background" %}
        {% else %}
          {% assign main_content_bg_type = "dark-background" %}
        {% endif %}
      {% else %}
        {% assign main_content_bg_type = "light-background" %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign main_content_bg_type = "dark-background" %}
  {% endif %}

  {% if main_content_bg_image == nil %}
    {% if front_page %}
      {% assign main_content_bg_image = images_path | append: "/front-header-bg_block.jpg" %}
    {% else %}
      {% assign main_content_bg_image = images_path | append: "/page-header-bg_block.jpg" %}
    {% endif %}
  {% endif %}

  {% if main_content_bg_image_sizes == nil %}
    {% if front_page %}
      {% assign main_content_bg_image_sizes_str = '[{"url":"' | append: images_path | append: '/front-header-bg.jpg", "width":2560, "height":1702}, {"url":"' | append: images_path | append: '/front-header-bg_huge.jpg", "width":2048, "height":1362}, {"url":"' | append: images_path | append: '/front-header-bg_large.jpg", "width":1280, "height":851}]' %}
    {% else %}
      {% assign main_content_bg_image_sizes_str = '[{"url":"' | append: images_path | append: '/page-header-bg.jpg", "width":2560, "height":1707}, {"url":"' | append: images_path | append: '/page-header-bg_huge.jpg", "width":2048, "height":1366}, {"url":"' | append: images_path | append: '/page-header-bg_large.jpg", "width":1280, "height":853}]' %}
    {% endif %}
  {% else %}
    {% assign main_content_bg_image_sizes_str = main_content_bg_image_sizes | json %}
  {% endif %}

  {% if main_content_bg_color == nil %}
    {% if front_page %}
      {% assign main_content_bg_color = "rgba(0, 0, 0, 0.1)" %}
    {% else %}
      {% assign main_content_bg_color = "rgba(0, 0, 0, 0.1)" %}
    {% endif %}
  {% endif %}

  {% if main_content_bg_color_data == nil %}
    {% if front_page %}
      {% assign main_content_bg_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0.1, "lightness": 0}' %}
    {% else %}
      {% assign main_content_bg_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0.1, "lightness": 0}' %}
    {% endif %}
  {% else %}
    {% assign main_content_bg_color_data_str = main_content_bg_color_data | json %}
  {% endif %}


  {% comment %}FIRST HALF CONTENT RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign half_content_bg_1 = page.data.half_content_bg_1 %}
  {% assign half_content_bg_1_image = half_content_bg_1.image %}
  {% assign half_content_bg_1_image_sizes = half_content_bg_1.imageSizes %}
  {% assign half_content_bg_1_color = half_content_bg_1.color %}
  {% assign half_content_bg_1_color_data = half_content_bg_1.colorData %}
  {% assign half_content_bg_1_combined_lightness = half_content_bg_1.combinedLightness %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if half_content_bg_1 %}
    {% if half_content_bg_1_combined_lightness %}
      {% if half_content_bg_1_combined_lightness > 0.5 %}
        {% assign half_content_bg_1_type = "light-background" %}
      {% else %}
        {% assign half_content_bg_1_type = "dark-background" %}
      {% endif %}
    {% else %}
      {% if half_content_bg_1_color_data.a >= 0.5 %}
        {% if half_content_bg_1_color_data.lightness >= 0.5 %}
          {% assign half_content_bg_1_type = "light-background" %}
        {% else %}
          {% assign half_content_bg_1_type = "dark-background" %}
        {% endif %}
      {% else %}
        {% assign half_content_bg_1_type = "light-background" %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign half_content_bg_1_type = "dark-background" %}
  {% endif %}

  {% if half_content_bg_1_image == nil %}
    {% if front_page %}
      {% assign half_content_bg_1_image = images_path | append: "/front-header-bg_block.jpg" %}
    {% else %}
      {% assign half_content_bg_1_image = images_path | append: "/page-header-bg_block.jpg" %}
    {% endif %}
  {% endif %}

  {% if half_content_bg_1_image_sizes == nil %}
    {% if front_page %}
      {% assign half_content_bg_1_image_sizes_str = '[{"url":"' | append: images_path | append: '/front-header-bg.jpg", "width":2560, "height":1702}, {"url":"' | append: images_path | append: '/front-header-bg_huge.jpg", "width":2048, "height":1362}, {"url":"' | append: images_path | append: '/front-header-bg_large.jpg", "width":1280, "height":851}]' %}
    {% else %}
      {% assign half_content_bg_1_image_sizes_str = '[{"url":"' | append: images_path | append: '/page-header-bg.jpg", "width":2560, "height":1707}, {"url":"' | append: images_path | append: '/page-header-bg_huge.jpg", "width":2048, "height":1366}, {"url":"' | append: images_path | append: '/page-header-bg_large.jpg", "width":1280, "height":853}]' %}
    {% endif %}
  {% else %}
    {% assign half_content_bg_1_image_sizes_str = half_content_bg_1_image_sizes | json %}
  {% endif %}

  {% if half_content_bg_1_color == nil %}
    {% if front_page %}
      {% assign half_content_bg_1_color = "rgba(0, 0, 0, 0.1)" %}
    {% else %}
      {% assign half_content_bg_1_color = "rgba(0, 0, 0, 0.1)" %}
    {% endif %}
  {% endif %}

  {% if half_content_bg_1_color_data == nil %}
    {% if front_page %}
      {% assign half_content_bg_1_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0.1, "lightness": 0}' %}
    {% else %}
      {% assign half_content_bg_1_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0.1, "lightness": 0}' %}
    {% endif %}
  {% else %}
    {% assign half_content_bg_1_color_data_str = half_content_bg_1_color_data | json %}
  {% endif %}


  {% comment %}SECOND HALF CONTENT RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign half_content_bg_2 = page.data.half_content_bg_2 %}
  {% assign half_content_bg_2_image = half_content_bg_2.image %}
  {% assign half_content_bg_2_image_sizes = half_content_bg_2.imageSizes %}
  {% assign half_content_bg_2_color = half_content_bg_2.color %}
  {% assign half_content_bg_2_color_data = half_content_bg_2.colorData %}
  {% assign half_content_bg_2_combined_lightness = half_content_bg_2.combinedLightness %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if half_content_bg_2 %}
    {% if half_content_bg_2_combined_lightness %}
      {% if half_content_bg_2_combined_lightness > 0.5 %}
        {% assign half_content_bg_2_type = "light-background" %}
      {% else %}
        {% assign half_content_bg_2_type = "dark-background" %}
      {% endif %}
    {% else %}
      {% if half_content_bg_2_color_data.a >= 0.5 %}
        {% if half_content_bg_2_color_data.lightness >= 0.5 %}
          {% assign half_content_bg_2_type = "light-background" %}
        {% else %}
          {% assign half_content_bg_2_type = "dark-background" %}
        {% endif %}
      {% else %}
        {% assign half_content_bg_2_type = "light-background" %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign half_content_bg_2_type = "dark-background" %}
  {% endif %}

  {% if half_content_bg_2_image == nil %}
    {% if front_page %}
      {% assign half_content_bg_2_image = images_path | append: "/front-header-bg_block.jpg" %}
    {% else %}
      {% assign half_content_bg_2_image = images_path | append: "/page-header-bg_block.jpg" %}
    {% endif %}
  {% endif %}

  {% if half_content_bg_2_image_sizes == nil %}
    {% if front_page %}
      {% assign half_content_bg_2_image_sizes_str = '[{"url":"' | append: images_path | append: '/front-header-bg.jpg", "width":2560, "height":1702}, {"url":"' | append: images_path | append: '/front-header-bg_huge.jpg", "width":2048, "height":1362}, {"url":"' | append: images_path | append: '/front-header-bg_large.jpg", "width":1280, "height":851}]' %}
    {% else %}
      {% assign half_content_bg_2_image_sizes_str = '[{"url":"' | append: images_path | append: '/page-header-bg.jpg", "width":2560, "height":1707}, {"url":"' | append: images_path | append: '/page-header-bg_huge.jpg", "width":2048, "height":1366}, {"url":"' | append: images_path | append: '/page-header-bg_large.jpg", "width":1280, "height":853}]' %}
    {% endif %}
  {% else %}
    {% assign half_content_bg_2_image_sizes_str = half_content_bg_2_image_sizes | json %}
  {% endif %}

  {% if half_content_bg_2_color == nil %}
    {% if front_page %}
      {% assign half_content_bg_2_color = "rgba(0, 0, 0, 0.1)" %}
    {% else %}
      {% assign half_content_bg_2_color = "rgba(0, 0, 0, 0.1)" %}
    {% endif %}
  {% endif %}

  {% if half_content_bg_2_color_data == nil %}
    {% if front_page %}
      {% assign half_content_bg_2_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0.1, "lightness": 0}' %}
    {% else %}
      {% assign half_content_bg_2_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0.1, "lightness": 0}' %}
    {% endif %}
  {% else %}
    {% assign half_content_bg_2_color_data_str = half_content_bg_2_color_data | json %}
  {% endif %}


  {% comment %}THIRD HALF CONTENT RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign half_content_bg_3 = page.data.half_content_bg_3 %}
  {% assign half_content_bg_3_image = half_content_bg_3.image %}
  {% assign half_content_bg_3_image_sizes = half_content_bg_3.imageSizes %}
  {% assign half_content_bg_3_color = half_content_bg_3.color %}
  {% assign half_content_bg_3_color_data = half_content_bg_3.colorData %}
  {% assign half_content_bg_3_combined_lightness = half_content_bg_3.combinedLightness %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if half_content_bg_3 %}
    {% if half_content_bg_3_combined_lightness %}
      {% if half_content_bg_3_combined_lightness > 0.5 %}
        {% assign half_content_bg_3_type = "light-background" %}
      {% else %}
        {% assign half_content_bg_3_type = "dark-background" %}
      {% endif %}
    {% else %}
      {% if half_content_bg_3_color_data.a >= 0.5 %}
        {% if half_content_bg_3_color_data.lightness >= 0.5 %}
          {% assign half_content_bg_3_type = "light-background" %}
        {% else %}
          {% assign half_content_bg_3_type = "dark-background" %}
        {% endif %}
      {% else %}
        {% assign half_content_bg_3_type = "light-background" %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign half_content_bg_3_type = "dark-background" %}
  {% endif %}

  {% if half_content_bg_3_image == nil %}
    {% if front_page %}
      {% assign half_content_bg_3_image = images_path | append: "/front-header-bg_block.jpg" %}
    {% else %}
      {% assign half_content_bg_3_image = images_path | append: "/page-header-bg_block.jpg" %}
    {% endif %}
  {% endif %}

  {% if half_content_bg_3_image_sizes == nil %}
    {% if front_page %}
      {% assign half_content_bg_3_image_sizes_str = '[{"url":"' | append: images_path | append: '/front-header-bg.jpg", "width":2560, "height":1702}, {"url":"' | append: images_path | append: '/front-header-bg_huge.jpg", "width":2048, "height":1362}, {"url":"' | append: images_path | append: '/front-header-bg_large.jpg", "width":1280, "height":851}]' %}
    {% else %}
      {% assign half_content_bg_3_image_sizes_str = '[{"url":"' | append: images_path | append: '/page-header-bg.jpg", "width":2560, "height":1707}, {"url":"' | append: images_path | append: '/page-header-bg_huge.jpg", "width":2048, "height":1366}, {"url":"' | append: images_path | append: '/page-header-bg_large.jpg", "width":1280, "height":853}]' %}
    {% endif %}
  {% else %}
    {% assign half_content_bg_3_image_sizes_str = half_content_bg_3_image_sizes | json %}
  {% endif %}

  {% if half_content_bg_3_color == nil %}
    {% if front_page %}
      {% assign half_content_bg_3_color = "rgba(0, 0, 0, 0.1)" %}
    {% else %}
      {% assign half_content_bg_3_color = "rgba(0, 0, 0, 0.1)" %}
    {% endif %}
  {% endif %}

  {% if half_content_bg_3_color_data == nil %}
    {% if front_page %}
      {% assign half_content_bg_3_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0.1, "lightness": 0}' %}
    {% else %}
      {% assign half_content_bg_3_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0.1, "lightness": 0}' %}
    {% endif %}
  {% else %}
    {% assign half_content_bg_3_color_data_str = half_content_bg_3_color_data | json %}
  {% endif %}


  {% comment %}FOURTH HALF CONTENT RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign half_content_bg_4 = page.data.half_content_bg_4 %}
  {% assign half_content_bg_4_image = half_content_bg_4.image %}
  {% assign half_content_bg_4_image_sizes = half_content_bg_4.imageSizes %}
  {% assign half_content_bg_4_color = half_content_bg_4.color %}
  {% assign half_content_bg_4_color_data = half_content_bg_4.colorData %}
  {% assign half_content_bg_4_combined_lightness = half_content_bg_4.combinedLightness %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if half_content_bg_4 %}
    {% if half_content_bg_4_combined_lightness %}
      {% if half_content_bg_4_combined_lightness > 0.5 %}
        {% assign half_content_bg_4_type = "light-background" %}
      {% else %}
        {% assign half_content_bg_4_type = "dark-background" %}
      {% endif %}
    {% else %}
      {% if half_content_bg_4_color_data.a >= 0.5 %}
        {% if half_content_bg_4_color_data.lightness >= 0.5 %}
          {% assign half_content_bg_4_type = "light-background" %}
        {% else %}
          {% assign half_content_bg_4_type = "dark-background" %}
        {% endif %}
      {% else %}
        {% assign half_content_bg_4_type = "light-background" %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign half_content_bg_4_type = "dark-background" %}
  {% endif %}

  {% if half_content_bg_4_image == nil %}
    {% if front_page %}
      {% assign half_content_bg_4_image = images_path | append: "/front-header-bg_block.jpg" %}
    {% else %}
      {% assign half_content_bg_4_image = images_path | append: "/page-header-bg_block.jpg" %}
    {% endif %}
  {% endif %}

  {% if half_content_bg_4_image_sizes == nil %}
    {% if front_page %}
      {% assign half_content_bg_4_image_sizes_str = '[{"url":"' | append: images_path | append: '/front-header-bg.jpg", "width":2560, "height":1702}, {"url":"' | append: images_path | append: '/front-header-bg_huge.jpg", "width":2048, "height":1362}, {"url":"' | append: images_path | append: '/front-header-bg_large.jpg", "width":1280, "height":851}]' %}
    {% else %}
      {% assign half_content_bg_4_image_sizes_str = '[{"url":"' | append: images_path | append: '/page-header-bg.jpg", "width":2560, "height":1707}, {"url":"' | append: images_path | append: '/page-header-bg_huge.jpg", "width":2048, "height":1366}, {"url":"' | append: images_path | append: '/page-header-bg_large.jpg", "width":1280, "height":853}]' %}
    {% endif %}
  {% else %}
    {% assign half_content_bg_4_image_sizes_str = half_content_bg_4_image_sizes | json %}
  {% endif %}

  {% if half_content_bg_4_color == nil %}
    {% if front_page %}
      {% assign half_content_bg_4_color = "rgba(0, 0, 0, 0.1)" %}
    {% else %}
      {% assign half_content_bg_4_color = "rgba(0, 0, 0, 0.1)" %}
    {% endif %}
  {% endif %}

  {% if half_content_bg_4_color_data == nil %}
    {% if front_page %}
      {% assign half_content_bg_4_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0.1, "lightness": 0}' %}
    {% else %}
      {% assign half_content_bg_4_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0.1, "lightness": 0}' %}
    {% endif %}
  {% else %}
    {% assign half_content_bg_4_color_data_str = half_content_bg_4_color_data | json %}
  {% endif %}
{% endcapture %}
