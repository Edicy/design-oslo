<style>
  {% comment %}/* MAIN CONTENT BACKGROUND */{% endcomment %}
  {% comment %}/* Main content background image styles. */{% endcomment %}
  {% if main_content_bg.imageSizes != nil %}
    {% if main_content_bg.imageSizes == "" %}
      .main-content .background-image {
        background-image: none;
      }
    {% else %}
      .main-content .background-image {
        background-image: url("{{ main_content_bg.image }}");
      }
    {% endif %}

  {% else %}

    {% assign bg_image_prefix = images_path | append: "/main-content-bg" %}

    .main-content .background-image {
      background-image: url("{{ bg_image_prefix }}.jpg");
    }
  {% endif %}

  {% comment %}/* Main content background color style. */{% endcomment %}
  .main-content .background-color {
    background-color: {{ main_content_bg_color }};
  }


  {% comment %}/* FIRST HALF CONTENT BACKGROUND */{% endcomment %}
  {% comment %}/* First half content background image styles. */{% endcomment %}
  {% if half_content_bg_1.imageSizes != nil %}
    {% if half_content_bg_1.imageSizes == "" %}
      .half-content-1 .background-image {
        background-image: none;
      }
    {% else %}
      .half-content-1 .background-image {
        background-image: url("{{ half_content_bg_1.image }}");
      }
    {% endif %}

  {% else %}

    {% assign bg_image_prefix = images_path | append: "/half-content-bg-1" %}

    .half-content-1 .background-image {
      background-image: url("{{ bg_image_prefix }}.jpg");
    }
  {% endif %}

  {% comment %}/* First half content background color style. */{% endcomment %}
  .half-content-1 .background-color {
    background-color: {{ half_content_bg_1_color }};
  }


  {% comment %}/* SECOND HALF CONTENT BACKGROUND */{% endcomment %}
  {% comment %}/* Second half content background image styles. */{% endcomment %}
  {% if half_content_bg_2.imageSizes != nil %}
    {% if half_content_bg_2.imageSizes == "" %}
      .half-content-2 .background-image {
        background-image: none;
      }
    {% else %}
      .half-content-2 .background-image {
        background-image: url("{{ half_content_bg_2.image }}");
      }
    {% endif %}

  {% else %}

    {% assign bg_image_prefix = images_path | append: "/half-content-bg-2" %}

    .half-content-2 .background-image {
      background-image: url("{{ bg_image_prefix }}.jpg");
    }
  {% endif %}

  {% comment %}/* Second half content background color style. */{% endcomment %}
  .half-content-2 .background-color {
    background-color: {{ half_content_bg_2_color }};
  }


  {% comment %}/* THIRD HALF CONTENT BACKGROUND */{% endcomment %}
  {% comment %}/* Third half content background image styles. */{% endcomment %}
  {% if half_content_bg_3.imageSizes != nil %}
    {% if half_content_bg_3.imageSizes == "" %}
      .half-content-3 .background-image {
        background-image: none;
      }
    {% else %}
      .half-content-3 .background-image {
        background-image: url("{{ half_content_bg_3.image }}");
      }
    {% endif %}

  {% else %}

    {% assign bg_image_prefix = images_path | append: "/half-content-bg-3" %}

    .half-content-3 .background-image {
      background-image: url("{{ bg_image_prefix }}.jpg");
    }
  {% endif %}

  {% comment %}/* Third half content background color style. */{% endcomment %}
  .half-content-3 .background-color {
    background-color: {{ half_content_bg_3_color }};
  }


  {% comment %}/* FOURTH HALF CONTENT BACKGROUND */{% endcomment %}
  {% comment %}/* Fourth half content background image styles. */{% endcomment %}
  {% if half_content_bg_4.imageSizes != nil %}
    {% if half_content_bg_4.imageSizes == "" %}
      .half-content-4 .background-image {
        background-image: none;
      }
    {% else %}
      .half-content-4 .background-image {
        background-image: url("{{ half_content_bg_4.image }}");
      }
    {% endif %}

  {% else %}

    {% assign bg_image_prefix = images_path | append: "/half-content-bg-4" %}

    .half-content-4 .background-image {
      background-image: url("{{ bg_image_prefix }}.jpg");
    }
  {% endif %}

  {% comment %}/* Third half content background color style. */{% endcomment %}
  .half-content-4 .background-color {
    background-color: {{ half_content_bg_4_color }};
  }
</style>
