console.log '🌈'

# clockEmojis = ["🕐","🕑","🕒","🕓","🕔","🕕","🕖","🕗","🕘","🕙","🕚","🕛","🕦","🕞","🕢","🕤"]
  
$('.cover, .name').click (event) ->
  context = $(event.target).closest('.record')
  cover = $(event.target).closest('.cover')[0]
  embed = context.data('embed')
  target = $(context[0]).find('.embed')
  target.append embed
  $(target).removeClass 'hidden'
  $(cover).addClass 'hidden'
