#!/bin/sh
#programa sed para convertir el manual de YAGS
# al nuevo formato.

sed -e '
  s!\beginitems!<List>!g
  s!\enditems!</List>!g
:ciclo
   /<Item>/ s!\(<Item><C>\)\([^(]*\)\((.*\)</Item>!\1\2\3 (<Ref Label="\2"/>)</Item>!g
  t fin
  N
  b ciclo
:fin
'