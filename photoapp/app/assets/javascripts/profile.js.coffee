$(document).ready ->

  $.ajax '/my_collections',
    type: 'GET'
    dataType: 'json'
    success: (data) ->
      $.each(data, appendCollection)


  appendPhotosForCollection = (id) ->

    $.ajax "/collections/#{id}/photos",
      type: 'GET'
      dataType: 'json'
      success: (data) ->
        #<img id=photo_#{photo.id} class='col_photo_thumb' src=#{photo.image}>
        # $.each(data, appendCollection)
  appendCollection = (i, collection) ->
    html = "<div class='col_cont'>#{collection.title} </div>"
    $(".collections_container").append html
    appendPhotosForCollection(collection.id)

  
