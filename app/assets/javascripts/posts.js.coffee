# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('pre code').each ->
    $(this).addClass $(this).closest('pre').attr('lang')

  highlightCodeTimer = setInterval((
    if typeof hljs == 'object'
      hljs.initHighlightingOnLoad()
      clearInterval(highlightCodeTimer)
  ), 100)

  renderKetaxTimer = setInterval((->
    if renderMathInElement
      renderMathInElement document.body,
        delimiters: [
          {left: '$$$', right: '$$$', display: true},
          {left: '$', right: '$', display: false},
          {left: "\\begin{align}", right: "\\end{align}", display: true},
          {left: "\\begin{align*}", right: "\\end{align*}", display: true},
          {left: "\\begin{bmatrix}", right: "\\end{bmatrix}", display: true},
          {left: "\\begin{smallmatrix}", right: "\\end{smallmatrix}", display: false},
        ],
        throwOnError: false
      clearInterval renderKetaxTimer
  ), 100)

  $('.submenu').closest('li').hover (->
    submenu = $(this).find('.submenu').filter(':not(:animated)')
    submenu.fadeIn()
  ), ->
    $(this).find('.submenu').fadeOut()

  if !window.navigator.userAgent.match /Android|iPhone|webOS|BlackBerry/i
    $('.post-entry').on('mouseenter', ->
      $(this).find('h2 a').addClass('hover');
    )
    $('.post-entry').on('mouseleave', ->
      $(this).find('h2 a').removeClass('hover');
    )
