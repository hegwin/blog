# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('pre code').each ->
    $(this).addClass $(this).closest('pre').attr('lang')

  hljs.initHighlightingOnLoad()
  
  $('.submenu').closest('li').hover (->
    submenu = $(this).find('.submenu').filter(':not(:animated)')
    submenu.fadeIn()
  ), ->
    $(this).find('.submenu').fadeOut()
