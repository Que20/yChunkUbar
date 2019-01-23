command: "chunkc tiling::query --desktop windows short flag: d"

refreshFrequency: 100

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="./yChunkUbar/assets/fontawesome-all.min.css">
    <link rel="stylesheet" type="text/css" href="./yChunkUbar/assets/colors.css">

    <div class='bar'>
      <div class='left'>
        <ul class='windows'></ul>
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
    console.log(windowId)
    $(event.target).css("border", "2px solid green")
    @run "chunkc tiling::window --focus " + windowId.data
# (http://learnboost.github.io/stylus/)

style:
  """
  margin-top: -12px;
  clear: both;
  width: 100%;
  height: 36px;
  color: #a5a5a5;
  font-weight: 700;
  font: 14px "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
  background-color: rgba(76, 76, 76, 0.5);
  box-shadow: 0px 0px 10px 0px black;
  filter: blur(0px);

  .menu
    display:inline;
    padding-top: 2px;
    padding-bottom: 2px;
    padding-left: 20px;
    padding-right: 20px;
    background-color: #118eff;
    color: white;
  
  ul
    padding: 0px;

  ul.windows
    display:inline;
    padding-left: 10px;

  ul.windows li
    display:inline-block;
    margin-right: 3px;
    padding-left: 5px;
    padding-right: 5px;
    padding-top: 2px;
    padding-bottom: 1px;
    font-size: 12px;
    border: 1px solid rgba(91, 91, 91, 0.5);
    border-radius: 3px;

  ul.windows li:first-child
    font-weight: bold;

  .right
    float: right;
    width: 20%;
    margin-top: 14px;
  
  .left
    float: left;
    width: 79%;
    margin-top: 14px;
  """