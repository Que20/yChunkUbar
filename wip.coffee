
command: "chunkc tiling::query --desktop windows short flag: d"

refreshFrequency: 1000

render: (output) ->
  """
    <div class='bar'>
      <div class='left'>
        <div class='menu'>Menu</div>
        <ul class='windows'></ul>
      </div>
      <div class='right'>
        <div class='time'>13:37</div>
      </div>
    </div>
  """

update: (output, domEl) ->
  windowArray = output.split('\n')
  windowUL = $(domEl).find('.windows')
  htmlData = ''
  for window in windowArray
    w = window.split(', ')
    if w.length > 1
      if w[2] != " (invalid)"
        htmlData += '<li>'+w[1]+'<span class="wId" style="display:none;">'+w[0]+'</span></li>'

  windowUL.html(htmlData)
  

afterRender: (domEl) ->
  $(domEl).on 'click', 'li', (event) =>
    windowId = (event.target.firstElementChild.firstChild)
    $(event.target).css("border", "2px solid green")
    @run "chunkc tiling::window --focus " + windowId.data
  $(domEl).on 'click', '.menu', (event) =>
    display = $('#menu-coffee').css("display")
    if display == "none"
      $('#menu-coffee').css("display", "block")
    else
      $('#menu-coffee').css("display", "none")
# (http://learnboost.github.io/stylus/)

style:
  """
  background-color: #4c4c4c;
  margin-top: -12px;
  clear: both;
  width: 100%;
  height: 34px;
  font: 14px "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif

  .menu
    display:inline;
    padding-top: 2px;
    padding-bottom: 2px;
    padding-left: 20px;
    padding-right: 20px;
    background-color: #118eff;
    color: white
  
  ul
    padding: 0px;

  ul.windows
    display:inline;

  ul.windows li
    display:inline;
    margin-right: 10px;
    padding-left: 3px;
    padding-right: 3px;
    color: white;

  ul.windows li:first-child
    font-weight: bold;

  
  .time
    background-color: yellow;
    margin-right: 10px;

  .right
    float: right;
    width: 20%;
    margin-top: 14px;
  
  .left
    float: left;
    width: 79%;
    margin-top: 14px;
  """