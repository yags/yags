#!/bin/sh
#programa sed para convertir el manual de YAGS
# al nuevo formato.

sed -e '
 s!{[\]\([A-Za-z]*\)}!\&\1;!g
 /^##  /s!<\([^>]*\)>!<A>\1\</A>!g
 /^##  /s!\\beginexample|unstableoutput!<Example>!g
 /^##  /s!\\beginexample!<Example>!g
 /^##  /s!\\endexample!</Example>!g
 s!#[O] *\([^ (]*\)( *\(\([^ ]*, *\)*[^ )]*\)\(.*\)!&\
##  \
##  <#GAPDoc Label="\1">\
##  <ManSection>\
##  <Oper Name="\1" Arg="\2"/>\
##  <Description>!g
 s!#[A] *\([^ (]*\)( *\(\([^ ]*, *\)*[^ )]*\)\(.*\)!&\
##  \
##  <#GAPDoc Label="\1">\
##  <ManSection>\
##  <Attr Name="\1" Arg="\2"/>\
##  <Description>!g
 s!#[P] *\([^ (]*\)( *\(\([^ ]*, *\)*[^ )]*\)\(.*\)!&\
##  \
##  <#GAPDoc Label="\1">\
##  <ManSection>\
##  <Prop Name="\1" Arg="\2"/>\
##  <Description>!g
 s!#[F] *\([^ (]*\)( *\(\([^ ]*, *\)*[^ )]*\)\(.*\)!&\
##  \
##  <#GAPDoc Label="\1">\
##  <ManSection>\
##  <Func Name="\1" Arg="\2"/>\
##  <Description>!g
 s!#[C] *\([^ (]*\)( *\(\([^ ]*, *\)*[^ )]*\)\(.*\)!&\
##  \
##  <#GAPDoc Label="\1">\
##  <ManSection>\
##  <Func Name="\1"/>\
##  <Description>!g
 s!#[M] *\([^ (]*\)( *\(\([^ ]*, *\)*[^ )]*\)\(.*\)!&\
##  \
##  <#GAPDoc Label="\1">\
##  <ManSection>\
##  <Meth Name="\1" Arg="\2"/>\
##  <Description>!g
 s!#[V] *\([^ (]*\).*!&\
##  \
##  <#GAPDoc Label="\1">\
##  <ManSection>\
##  <Var Name="\1"/>\
##  <Description>!g
 /^Declare/s!^D!##  </Description>\
##  </ManSection>\
##  <#/GAPDoc>\
D!g
:ciclo
 s!\(.*Arg="[^<#]*\)<!\1!
 s!\(.*Arg="[^>#]*\)>"!\1"!
 s!\(.*Arg="[^>#]*\)>,!\1,!
 t ciclo
 s![`]!<C>!g
'


