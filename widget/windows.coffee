command: "chunkc tiling::query --desktop windows short flag: d"

refreshFrequency: 1000

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="./yChunkUbar/assets/fontawesome-all.min.css">
    <link rel="stylesheet" type="text/css" href="./yChunkUbar/assets/colors.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

    <div class='bar'>
      <div class='left'>
        <ul class='actions'>
        <li><i class="fas fa-window-close"></i></li>
        <li><i class="fas fa-expand"></i></i></li>
        <li><i class="far fa-window-maximize"></i></li>
        </ul>
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
        htmlData += '<li>'+w[1]+'<span class="wId">'+w[0]+'</span></li>'
  windowUL.html(htmlData)

afterRender: (domEl) ->
  $(domEl).on 'click', 'li', (event) =>
    windowId = (event.target.firstElementChild.firstChild)
    $(event.target).css("background-color", "rgba(76, 76, 76, 0.2)")
    # $(event.target).find('.wId').css("display", "inline")
    @run "chunkc tiling::window --focus " + windowId.data

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
  box-shadow: rgba(0,0,0,0.8) 0 0 2px;

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
    display:inline;
    padding-left: 10px;

  ul li
    display:inline-block;
    margin-right: 3px;
    padding-left: 5px;
    padding-right: 5px;
    padding-top: 2px;
    margin-top: 1px;
    padding-bottom: 1px;
    font-size: 12px;
    border-radius: 4px;

  ul.windows li:first-child
    font-weight: bold;
    background-color: rgba(76, 76, 76, 0.2);

  ul.actions
    display: none;
    background-color: red;

  ul.actions li
    text-align: center;
    background-color: rgba(76, 76, 76, 0.2);
    font: 12px FontAwesome;
    width: 15px;
    height: 12px;

  .right
    float: right;
    width: 20%;
    margin-top: 14px;
  
  .left
    float: left;
    width: 79%;
    margin-top: 14px;

  .wId
    display: none;
  """