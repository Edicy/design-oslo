;(function($) {
  var handleElementsClick = function() {
    $('body').on('mousedown', function(event) {
      if (!$(event.target).closest('.js-prevent-sideclick').length) {
        if ($('body').hasClass('lang-menu-open')) {
          $('body').removeClass('lang-menu-open');
        }
      }
    });

    $('.js-lang-menu-btn').on('click', function() {
      if ($('body').hasClass('lang-menu-open')) {
        $('body').removeClass('lang-menu-open');
      } else {
        $('body').addClass('lang-menu-open');
      }
    });

    $('.js-tags-opener').click(function() {
      $(this).toggleClass('active');
    });
  }

  var toggleFlags = function() {
    $('.js-option-toggle-flags').on('click', function() {
      if ($(this).hasClass('js-flag-disable-btn')) {
        var flagsState = false;
      } else {
        var flagsState = true;
      }

      $(this).toggleClass('js-flag-disable-btn');
      $('.menu-lang').toggleClass('flags-enabled flags-disabled');

      siteData.set("flags_state", flagsState);
    });
  };

  var bgPickerImageSizesContains = function(sizes, url) {
    for (var i = sizes.length; i--;) {
      if (url.indexOf(sizes[i].url.trim()) > -1) {
        return true;
      }
    }
    return false;
  };

  // Checks the lightness sum of header background image and color and sets the lightness class depending on it's value.
  var bgPickerContentLightnessClass = function(bgPickerArea, lightness) {
    if (lightness >= 0.5) {
      $(bgPickerArea).find('.js-background-type').addClass('light-background').removeClass('dark-background');
    } else {
      $(bgPickerArea).find('.js-background-type').addClass('dark-background').removeClass('light-background');
    }
  };

  // Header background image and color preview logic function.
  var bgPickerPreview = function(bgPickerArea, data, bgPicker) {
    // Defines the variables used in preview logic.

    var bgPickerImagePrevious = $(bgPickerArea).find('.js-background-image').css('background-image'),
        bgPickerImage = (data.image && data.image !== '') ? 'url(' + data.image + ')' : 'none',
        bgPickerImageSizes = (data.imageSizes && data.imageSizes !== '') ? data.imageSizes : null,
        bgPickerColor = (data.color && data.color !== '') ? data.color : 'rgba(0,0,0,0)',
        bgPickerColorDataLightness = (data.colorData && data.colorData !== '') ? data.colorData.lightness : 1,
        colorExtractImage = $('<img>'),
        colorExtractCanvas = $('<canvas>'),
        colorExtractImageUrl = (data.image && data.image !== '') ? data.image : null;

    if (colorExtractImageUrl) {
      if (bgPickerImageSizesContains(bgPickerImageSizes, bgPickerImagePrevious)) {
        bgPicker.bgPickerImageColor = bgPicker.bgPickerImageColor ? bgPicker.bgPickerImageColor : 'rgba(41,42,39,1)';
        bgPicker.bgPickerCombinedLightness = getCombinedLightness(bgPicker.bgPickerImageColor, bgPickerColor);
        bgPickerContentLightnessClass(bgPickerArea, bgPicker.bgPickerCombinedLightness);
        $(bgPickerArea).find('.js-background-image').css({'background-color' : bgPicker.bgPickerImageColor});
      } else {
        colorExtractImage.attr('src', colorExtractImageUrl.replace(/.*\/(photos|voogstock)/g,'/photos'));
        colorExtractImage.load(function() {
          ColorExtract.extract(colorExtractImage[0], colorExtractCanvas[0], function(data) {
            bgPicker.bgPickerImageColor = data.bgColor ? data.bgColor : 'rgba(255,255,255,1)';
            bgPicker.bgPickerCombinedLightness = getCombinedLightness(bgPicker.bgPickerImageColor, bgPickerColor);
            bgPickerContentLightnessClass(bgPickerArea, bgPicker.bgPickerCombinedLightness);
            $(bgPickerArea).find('.js-background-image').css({'background-color' : bgPicker.bgPickerImageColor});
          });
        });
      };
    } else {
      bgPicker.bgPickerImageColor = 'rgba(255,255,255,1)';
      bgPicker.bgPickerCombinedLightness = getCombinedLightness('rgba(255,255,255,1)', bgPickerColor);
      bgPickerContentLightnessClass(bgPickerArea, bgPicker.bgPickerCombinedLightness);
      $(bgPickerArea).find('.js-background-image').css({'background-color' : bgPicker.bgPickerImageColor});
    };

    // Updates the bgPickerContent background image and background color.
    $(bgPickerArea).find('.js-background-image').css({'background-image' : bgPickerImage});
    $(bgPickerArea).find('.js-background-color').css({'background-color' : bgPickerColor});
  };

  // Header background image and color save logic function.
  var bgPickerCommit = function(dataBgKey, data, bgPicker) {
    var commitData = $.extend(true, {}, data);
    commitData.image = data.image || '';
    commitData.imageSizes = data.imageSizes || '';
    commitData.color = data.color || '';
    commitData.combinedLightness = bgPicker.bgPickerCombinedLightness;
    commitData.imageColor = bgPicker.bgPickerImageColor;

    pageData.set(dataBgKey, commitData);
  };

  var colorSum = function(bgColor, fgColor) {
    if (bgColor == 'transparent') {
      bgColor = 'rgba(0,0,0,0)';
    }

    if (fgColor == 'transparent') {
      fgColor = 'rgba(0,0,0,0)';
    }

    if (bgColor && fgColor) {
      if (typeof bgColor == 'string') {
        bgColor = bgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(bgColor, function(n, x) {bgColor[n] = +x;});
      }
      if (typeof fgColor == 'string') {
        fgColor = fgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(fgColor, function(n, x) {fgColor[n] = +x;});
      }
      if (typeof bgColor == 'object' && bgColor.hasOwnProperty('length')) {
        if (bgColor.length == 3) { bgColor.push(1.0); }
      }
      if (typeof fgColor == 'object' && fgColor.hasOwnProperty('length')) {
        if (fgColor.length == 3) { fgColor.push(1.0); }
      }
      var result = [0, 0, 0, 0];
      result[3] = 1 - (1 - fgColor[3]) * (1 - bgColor[3]);
      if (result[3] === 0) { result[3] = 1e-6; }
      result[0] = Math.min(fgColor[0] * fgColor[3] / result[3] + bgColor[0] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[1] = Math.min(fgColor[1] * fgColor[3] / result[3] + bgColor[1] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[2] = Math.min(fgColor[2] * fgColor[3] / result[3] + bgColor[2] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      return $.map(result, function(e) { return Math.floor(e); });
    }
  };

  var getCombinedColor = function(bgColor, fgColor) {
    var sum = colorSum(bgColor || [255,255,255,1], fgColor || [255,255,255,1]);
    return sum;
  };

  var getCombinedLightness = function(bgColor, fgColor) {
    var combinedColor = getCombinedColor(bgColor, fgColor);
    var color = Math.round(((+combinedColor[0]) * 0.2126 + (+combinedColor[1]) * 0.7152 + (+combinedColor[2]) * 0.0722) / 2.55) / 100;
    return color;
  };

  var bgPickerColorScheme = function(lightness) {
    if (typeof lightness != 'undefined') {
      if (lightness > 0.6) {
        $('.header-wrapper').addClass('light').removeClass('dark');
      } else {
        $('.header-wrapper').addClass('dark').removeClass('light');
      }
    }
  };

  var positionFooter = function() {
    if (window.innerWidth <= 860) {
      $('.sidebar').css('padding', '');
    } else {
      $('.sidebar').css('padding-bottom', $('.footer').outerHeight() + 70 + 'px');
    }
  };

  var bindMenuButton = function() {
    $('.menu-btn').on('click', function(event) {
      event.stopPropagation();

      $('body').toggleClass('mobile-menu-open');
    });

    $('body').on('click', function(event) {
      if($(event.target).closest('.sidebar-inner-content').length == 0 && $('body').hasClass('mobile-menu-open')) {
        event.preventDefault();

        $('body').removeClass('mobile-menu-open');
      }
    });
  };

  var tableWrapper = function() {
    $('body:not(.editmode) table').each(function() {
      $(this).wrap('<div class="table-holder" />');
    });
  };

  var expandMenu = function() {
    $('.menu-expander').on('click', function(event) {
      $(event.target).parent().toggleClass('expanded');
    });
  }

  var init = function() {
    // Add site wide functions here.
    handleElementsClick();
    positionFooter();
    bindMenuButton();
    tableWrapper();

    $(window).on('resize', function() {
      positionFooter();
    });

    $('.footer .text_partial').on('keyup', function() {
      positionFooter();
    });
  };

  // Enables the usage of the initiations outside this file.
  window.Site = $.extend(window.Site || {}, {
    bgPickerPreview: bgPickerPreview,
    bgPickerCommit: bgPickerCommit,
    bgPickerColorScheme: bgPickerColorScheme,
    toggleFlags: toggleFlags,
    expandMenu: expandMenu
  });

  window.onload = init;
})(jQuery);
