refreshFrequency: 100000

render: (output) ->
  """
    <div class='list'></div>
  """


style:
  """
  z-index: 100;
  margin-top:20px;
  margin-left:0px;
  display: none;
  .list
    width:100px;
    height:150px;
    background-color: yellow;
  """