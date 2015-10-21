<style>
  {% comment %}/* MAIN CONTENT BACKGROUND */{% endcomment %}
  {% comment %}/* Main content background image styles. */{% endcomment %}
  {% if main_content_bg.image == "" %}
    .main-content .background-image {
      background-image: none;
    }
  {% else %}
    .main-content .background-image {
      background-image: url("{{ main_content_bg_image }}");
    }
  {% endif %}

  {% comment %}/* Main content background color style. */{% endcomment %}
  .main-content .background-color {
    background-color: {{ main_content_bg_color }};
  }


  {% comment %}/* FIRST HALF CONTENT BACKGROUND */{% endcomment %}
  {% comment %}/* First half content background image styles. */{% endcomment %}
  {% if half_content_bg_1.image == "" %}
    .half-content-1 .background-image {
      background-image: none;
    }
  {% else %}
    .half-content-1 .background-image {
      background-image: url("{{ half_content_bg_1_image }}");
    }
  {% endif %}

  {% comment %}/* First half content background color style. */{% endcomment %}
  .half-content-1 .background-color {
    background-color: {{ half_content_bg_1_color }};
  }


  {% comment %}/* SECOND HALF CONTENT BACKGROUND */{% endcomment %}
  {% comment %}/* Second half content background image styles. */{% endcomment %}
  {% if half_content_bg_2.image == "" %}
    .half-content-2 .background-image {
      background-image: none;
    }
  {% else %}
    .half-content-2 .background-image {
      background-image: url("{{ half_content_bg_2_image }}");
    }
  {% endif %}

  {% comment %}/* Second half content background color style. */{% endcomment %}
  .half-content-2 .background-color {
    background-color: {{ half_content_bg_2_color }};
  }


  {% comment %}/* THIRD HALF CONTENT BACKGROUND */{% endcomment %}
  {% comment %}/* Third half content background image styles. */{% endcomment %}
  {% if half_content_bg_3.image == "" %}
    .half-content-3 .background-image {
      background-image: none;
    }
  {% else %}
    .half-content-3 .background-image {
      background-image: url("{{ half_content_bg_3_image }}");
    }
  {% endif %}

  {% comment %}/* Third half content background color style. */{% endcomment %}
  .half-content-3 .background-color {
    background-color: {{ half_content_bg_3_color }};
  }


  {% comment %}/* FOURTH HALF CONTENT BACKGROUND */{% endcomment %}
  {% comment %}/* Fourth half content background image styles. */{% endcomment %}
  {% if half_content_bg_4.image == "" %}
    .half-content-4 .background-image {
      background-image: none;
    }
  {% else %}
    .half-content-4 .background-image {
      background-image: url("{{ half_content_bg_4_image }}");
    }
  {% endif %}

  {% comment %}/* Third half content background color style. */{% endcomment %}
  .half-content-4 .background-color {
    background-color: {{ half_content_bg_4_color }};
  }
</style>
