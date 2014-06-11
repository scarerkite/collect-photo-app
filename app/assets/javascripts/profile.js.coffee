$(document).ready ->
  


  appendPhotosForCollection = (id) ->

    $.ajax "/collections/#{id}/photos?limit=true",
      type: 'GET'
      dataType: 'json'
      success: (data) ->
        $.each data, (i, photo) ->
          $("#collection-container-#{id}").append(
            "<div class='photo_frame'><img id=photo_#{photo.id} class='col_photo_thumb' src=#{photo.image}></div>"
          )
        
  appendCollection = (i, collection) ->
    html = "<div id='collection-container-#{collection.id}' data-id='#{collection.id}' class='col_cont'><div class='container_head'><h2>#{collection.title}(<a href='/collections/#{collection.id}'>View</a>)</h2> </div></div>"
    $(".collections_container").append html 

    appendPhotosForCollection(collection.id)

  
  getCollections = (url) ->
    $.ajax url,
      type: 'GET'
      dataType: 'json'
      success: (data) ->
        $.each(data, appendCollection)
  if !!$("#my_profile").length
    getCollections("/my_collections")
  else if !!$("#user_profile").length and window.user_id?
    getCollections("/users/#{window.user_id}/collections")




