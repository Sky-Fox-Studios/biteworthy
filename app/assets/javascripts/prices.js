$('.item-price-<%=@price_id%>.extra-price<%=@price_id%>').bind('ajax:success', function() {
  $(this).fadeOut();
});
