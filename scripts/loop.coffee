jQuery ($) ->

  #----------------------/
  #     /* PAGE LOADER
  #     /*---------------------

  #----------------------/
  #     /* MAIN NAVIGATION
  #     /*---------------------
  toggleNavbar = ->
    if ($(window).width() > 1024) and ($(document).scrollTop() <= 150)
      setNavbarTransparent()
    else
      setNavbarLight()
    return

  # navbar setting functions
  setNavbarLight = ->
    $(".navbar").addClass "navbar-light"
    $(".navbar-brand h1").css "color", "#646464"
    return
  setNavbarTransparent = ->
    $(".navbar").removeClass "navbar-light"
    $(".navbar-brand h1").css "color", "#fff"
    return

  # hide collapsible menu

  #----------------------/
  #     /* HERO UNIT SUPERSIZED
  #     /*---------------------

  # Functionality
  # Slideshow starts playing automatically
  # Length between transitions
  # 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
  # Speed of transition

  # Components
  # Individual links for each slide (Options: false, 'num', 'name', 'blank')
  # Individual thumb links for each slide
  # Slideshow Images

  #-----------------------------/
  #     /* HERO UNIT FULLSCREEN VIDEO
  #     /*---------------------------

  # iPhone seems provide video accesibility, so don't give poster to show the video

  # resize the wrapper as the video resized

  # video volume control

  #----------------------/
  #     /* PARALLAX
  #     /*---------------------
  setParallax = ->
    $(".full-width-parallax").parallax 0, 0.1  if $(window).width() > 1024
    return
  $("body").jpreLoader
    showSplash: false
    loaderVPos: "50%"

  $(window).on "scroll", ->
    if $(window).width() > 1024
      if $(document).scrollTop() > 150
        setNavbarLight()
      else
        setNavbarTransparent()
    return

  toggleNavbar()
  $(window).resize ->
    toggleNavbar()
    return

  $(".navbar-nav li a").click ->
    $("#main-nav").collapse "hide"  if $(this).parents(".navbar-collapse.collapse").hasClass("in")
    return

  $("#main-nav").localScroll
    duration: 1000
    easing: "easeInOutExpo"

  $(".hero-buttons").localScroll
    duration: 1000
    easing: "easeInOutExpo"

  if $(".slideshow").length > 0
    $.supersized
      autoplay: 1
      slide_interval: 5000
      transition: 1
      transition_speed: 1000
      slide_links: "blank"
      thumb_links: 0
      slides: [
        {
          image: "assets/img/sliders/slider1.jpg"
          title: "<div class=\"hero-text\"><h2 class=\"hero-heading\">VINNIE MAGRO</h2><p>Hacker</p></div>"
          thumb: ""
          url: ""
        }
        {
          image: "assets/img/sliders/slider2.jpg"
          title: "<div class=\"hero-text\"><h2 class=\"hero-heading\">VINNIE MAGRO</h2><p>Computer Engineer</p></div>"
          thumb: ""
          url: ""
        }
        {
          image: "assets/img/sliders/slider3.jpg"
          title: "<div class=\"hero-text\"><h2 class=\"hero-heading\">VINNIE MAGRO</h2><p>Tech Enthusiast</p></div>"
          thumb: ""
          url: ""
        }
      ]

    $(".fa-pause, .fa-play").click ->
      $(this).toggleClass "fa-pause fa-play"
      return

  if $(".hero-video").length > 0
    videoOptions =
      mp4: "assets/videos/motion.mp4"
      webm: "assets/videos/caramel.webm"
      ogv: "assets/videos/motion.ogv"
      opacity: 1
      zIndex: 0
      muted: "muted"

    videoOptions.poster = "assets/img/sliders/slider3.jpg"  if $(window).width() > 480
    $(".hero-video").videoBG videoOptions
    $(window).resize ->
      $(".videoBG_wrapper").width("100%").height "100%"
      $(".videoBG").width "100%"
      return

    $(".fa-volume-up, .fa-volume-off").click ->
      $(".videoBG video").toggleVolume()
      $(this).toggleClass "fa-volume-up fa-volume-off"
      return

    $.fn.toggleVolume = ->
      domVideo = $(this).get(0)
      if domVideo.muted is true
        domVideo.muted = false
      else
        domVideo.muted = true
      return
  $(".full-width-parallax").parallax 0, 0.1
  setParallax()
  $(window).resize ->
    setParallax()
    return


  #----------------------/
  #     /* SKILLS
  #     /*---------------------
  $("#skills").waypoint (->
      $(".chart").each ->
        $(this).easyPieChart
          size: 150
          barColor: "#ffae3f"
          trackColor: "#eee"
          scaleColor: false
          lineWidth: 2
          easing: "easeOutExpo"
          animate: 2000

        return

      return
    ),
    offset: "70%"


  #----------------------/
  #     /* SCROLL TO TOP
  #     /*---------------------
  if $(window).width() > 992
    $(window).scroll ->
      if $(this).scrollTop() > 300
        $(".back-to-top").fadeIn()
      else
        $(".back-to-top").fadeOut()
      return

    $(".back-to-top").click (e) ->
      e.preventDefault()
      $("body, html").animate
        scrollTop: 0
      , 800, "easeInOutExpo"
      return


  #----------------------/
  #     /* WORKS
  #     /*---------------------
  $container = $(".work-item-list")
  new imagesLoaded($container, ->
    $container.isotope itemSelector: ".work-item"
    return
  )
  $(window).smartresize ->
    $container.isotope "reLayout"
    return

  $(".work-item-filters a").click (e) ->
    selector = $(this).attr("data-filter")
    $container.isotope filter: selector
    $(".work-item-filters a").removeClass "active"
    $(this).addClass "active"
    false

  originalTitle = undefined
  currentItem = undefined
  $(".media-popup").magnificPopup
    type: "image"
    callbacks:
      beforeOpen: ->

        # modify item title to include description
        currentItem = $(@items)[@index]
        originalTitle = currentItem.title
        currentItem.title = "<h3>" + originalTitle + "</h3>" + "<p>" + $(currentItem).parents(".work-item").find("img").attr("alt") + "</p>"

        # adding animation
        @st.mainClass = "mfp-fade"
        return

      close: ->
        currentItem.title = originalTitle
        return


  #----------------------/
  #     /* SOCIAL NETWORK
  #     /*---------------------
  if $(window).width() > 1024
    wow = new WOW(animateClass: "animated")
    wow.init()
  else
    $(".wow").attr "class", ""

  #----------------------/
  #     /* TOOLTIP
  #     /*---------------------
  if $(window).width() > 1024
    $("body").tooltip
      selector: "[data-toggle=tooltip]"
      container: "body"


  #----------------------/
  #     /* AJAX CONTACT FORM
  #     /*---------------------
  $("#contact-form").parsley()
  $(".contact-form form").submit (e) ->
    e.preventDefault()
    return  unless $(this).parsley("isValid")
    $theForm = $(this)
    $btn = $(this).find("#submit-button")
    $btnText = $btn.text()
    $alert = $(this).parent().find(".alert")
    $btn.find(".loading-icon").addClass "fa-spinner fa-spin "
    $btn.prop("disabled", true).find("span").text "Sending..."
    $.ajax
      url: "//formspree.io/vm+w@vinnie.io"
      method: "POST"
      data: $(this).serialize()
      dataType: "json"
      success: formSuccess = ->
        $theForm.slideUp "medium", ->
          $alert.removeClass "alert-danger"
          $alert.addClass("alert-success").html("Message submitted").slideDown "medium"
          return

        $btn.find(".loading-icon").removeClass "fa-spinner fa-spin "
        $btn.prop("disabled", false).find("span").text $btnText
        return

      error: formErr = ->
        $alert.addClass("alert-danger").html("Failed to submit message").slideDown "medium"
        return

    return


  # init scrollspy except on Opera, it doesn't work because body has 100% height
  unless navigator.userAgent.match("Opera/")
    $("body").scrollspy target: "#main-nav"
  else
    $("#main-nav .nav li").removeClass "active"
  return
