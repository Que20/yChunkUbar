command: "sh ./yChunkUbar/scripts/stats.sh"

refreshFrequency: 10000 # ms

render: (output) ->
  """
    <div class='stats'></div>
  """

style: """
  right: 0px
  bottom: 4px
  height: 13
  padding-left: 2px;
  padding-bottom: 2px;
  background-color: rgba(76, 76, 76, 0.5);
  box-shadow: rgba(0,0,0,0.8) 0 0 10px;
  
  .stats
    color: #66d9ef;
    padding-right: 10px;
    padding-left: 2px;
    padding-bottom: 2px;
"""


getCPU: (cpu) ->
  cpuNum = parseFloat(cpu)
  console.log(cpu)
  # I have four cores, so I divide my CPU percentage by four to get the proper number
  cpuNum = cpuNum/2
  cpuNum = cpuNum.toFixed(1)
  cpuString = String(cpuNum)
  if cpuNum < 10
    cpuString = '0' + cpuString
  return "<span class='icon'>&nbsp&nbsp;</span>" +
         "<span class='white'>#{cpuString}%</span>"

getMem: (mem) ->
  memNum = parseFloat(mem)
  memNum = memNum.toFixed(1)
  memString = String(memNum)
  if memNum < 10
    memString = '0' + memString
  return "<span class='icon'>&nbsp&nbsp;</span>" +
         "<span class='white'>#{memString}%</span>"

convertBytes: (bytes) ->
  kb = bytes / 1024
  return @usageFormat(kb)

usageFormat: (kb) ->
    mb = kb / 1024
    if mb < 0.01
      return "0.00mb"
    return "#{parseFloat(mb.toFixed(2))}MB"

getNetTraffic: (down, up) ->
  downString = @convertBytes(parseInt(down))
  upString = @convertBytes(parseInt(up))
  return "<span>&nbsp</span><span class='icon green'></span>&nbsp;" +
         "<span class='white'>#{downString} " +
         "<span> ⎢ </span>" +
         "<span class='icon orange'></span>&nbsp;" +
         "<span class='white'>#{upString}</span>"

getFreeSpace: (space) ->
  return "<span class='icon'></span>&nbsp;<span class='white'>#{space}gb</span>"

update: (output, domEl) ->
  values = output.split('@')
  cpu = values[0]
  mem = values[1]
  down = values[2]
  up   = values[3]
  free = values[4].replace(/[^0-9]/g,'')
  htmlString =  @getNetTraffic(down, up) + "<span>&nbsp⎢&nbsp</span>" +
                @getMem(mem) + "<span>&nbsp⎢&nbsp</span>" +
                @getCPU(cpu) + "<span>&nbsp⎢&nbsp</span>" +
                @getFreeSpace(free)

  $(domEl).find('.stats').html(htmlString)
