command: "/usr/local/bin/kwmc query window focused name"

refreshFrequency: 2000 # ms

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="/nerdbar.widget/colors.css" />
    <div class='kwmmode'></div>
  """

style: """
  -webkit-font-smoothing: antialiased
  color: #66d9ef
  left: 25em
  top: 5px
  width:850px
  white-space: nowrap
  text-overflow: ellipsis
  overflow: ellipsis
  """

update: (output, domEl) ->


  file = "";
  screenhtml = "";
  wins = output;
  win = "";
  i = 0;
  winseg = wins.split('/');
  file = winseg[winseg.length - 1]
  j = winseg.length - 1
  flag = 0
  
  if j > 1
    while j >= 1
      j -= 1;
      if (win + file).length >= 65
        win = '…/' + win
        break;
      else
        win = winseg[j] + '/' + win;

   while file.length >= 65
    file = file.slice(0, -1)
    flag = 1

   if flag >= 1
     file = file + '…';

  if output == ""
    win = "<span class='white'>…</span>"


  $(domEl).find('.kwmmode').html("<span class='icon'></span></span> <span>#{win}</span><span class='white'>#{file}</span>")

  
