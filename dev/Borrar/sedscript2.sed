#!/bin/sh
#programa sed para convertir el manual de YAGS
# al nuevo formato.

sed -e '
  s!\\beginitems!<List>!g
  s!\\enditems!</List>!g
  /^ *$/s!^ *$!--!g
  t ll
  b cont
:ll
  N
  s!`!<Item><C>!g
:cont
'