define [], () ->
  class DateTime

    @getNowFormatted: (format) ->
      date = new Date()
      strDate = date.getDate() + "-" + (date.getMonth()+1) + "-" + date.getFullYear()