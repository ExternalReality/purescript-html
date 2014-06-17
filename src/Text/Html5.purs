{-# LANGUAGE OverloadedStrings #-}
module Text.Html5 (
      docType
    , docTypeHtml
    , a
    , abbr
    , address
    , area
    , article
    , aside
    , audio
    , b
    , base
    , bdo
    , blockquote
    , body
    , br
    , button
    , canvas
    , caption
    , cite
    , code
    , col
    , colgroup
    , command
    , datalist
    , dd
    , del
    , details
    , dfn
    , div
    , dl
    , dt
    , em
    , embed
    , fieldset
    , figcaption
    , figure
    , footer
    , form
    , h1
    , h2
    , h3
    , h4
    , h5
    , h6
    , head
    , header
    , hgroup
    , hr
    , html
    , i
    , iframe
    , img
    , input
    , ins
    , kbd
    , keygen
    , label
    , legend
    , li
    , link
    , map
    , mark
    , menu
    , menuitem
    , meta
    , meter
    , nav
    , noscript
    , object
    , ol
    , optgroup
    , option
    , output
    , p
    , param
    , pre
    , progress
    , q
    , rp
    , rt
    , ruby
    , samp
    , script
    , section
    , select
    , small
    , source
    , span
    , strong
    , style
    , sub
    , summary
    , sup
    , table
    , tbody
    , td
    , textarea
    , tfoot
    , th
    , thead
    , time
    , title
    , tr
    , track
    , ul
    , var
    , video
    , wbr
    ) where

import Text.Html
import Text.Markup

docType :: Html  -- ^ The document type HTML.
docType = Content "<!DOCTYPE HTML>\n"

docTypeHtml :: Html  -- ^ Inner HTML.
            -> Html  -- ^ Resulting HTML.
docTypeHtml inner = docType >>= (\ _ -> html inner)

a :: Html  -- ^ Inner HTML.
  -> Html  -- ^ Resulting HTML.
a = Parent "a" "<a" "</a>"

abbr :: Html  -- ^ Inner HTML.
     -> Html  -- ^ Resulting HTML.
abbr = Parent "abbr" "<abbr" "</abbr>"

address :: Html  -- ^ Inner HTML.
        -> Html  -- ^ Resulting HTML.
address = Parent "address" "<address" "</address>"

area :: Html  -- ^ Resulting HTML.
area = Leaf "area" "<area" ">"

article :: Html  -- ^ Inner HTML.
        -> Html  -- ^ Resulting HTML.
article = Parent "article" "<article" "</article>"

aside :: Html  -- ^ Inner HTML.
      -> Html  -- ^ Resulting HTML.
aside = Parent "aside" "<aside" "</aside>"

audio :: Html  -- ^ Inner HTML.
      -> Html  -- ^ Resulting HTML.
audio = Parent "audio" "<audio" "</audio>"

b :: Html  -- ^ Inner HTML.
  -> Html  -- ^ Resulting HTML.
b = Parent "b" "<b" "</b>"

base :: Html  -- ^ Resulting HTML.
base = Leaf "base" "<base" ">"

bdo :: Html  -- ^ Inner HTML.
    -> Html  -- ^ Resulting HTML.
bdo = Parent "bdo" "<bdo" "</bdo>"

blockquote :: Html  -- ^ Inner HTML.
           -> Html  -- ^ Resulting HTML.
blockquote = Parent "blockquote" "<blockquote" "</blockquote>"

body :: Html  -- ^ Inner HTML.
     -> Html  -- ^ Resulting HTML.
body = Parent "body" "<body" "</body>"

br :: Html  -- ^ Resulting HTML.
br = Leaf "br" "<br" ">"

button :: Html  -- ^ Inner HTML.
       -> Html  -- ^ Resulting HTML.
button = Parent "button" "<button" "</button>"

canvas :: Html  -- ^ Inner HTML.
       -> Html  -- ^ Resulting HTML.
canvas = Parent "canvas" "<canvas" "</canvas>"

caption :: Html  -- ^ Inner HTML.
        -> Html  -- ^ Resulting HTML.
caption = Parent "caption" "<caption" "</caption>"

cite :: Html  -- ^ Inner HTML.
     -> Html  -- ^ Resulting HTML.
cite = Parent "cite" "<cite" "</cite>"

code :: Html  -- ^ Inner HTML.
     -> Html  -- ^ Resulting HTML.
code = Parent "code" "<code" "</code>"

col :: Html  -- ^ Resulting HTML.
col = Leaf "col" "<col" ">"

colgroup :: Html  -- ^ Inner HTML.
         -> Html  -- ^ Resulting HTML.
colgroup = Parent "colgroup" "<colgroup" "</colgroup>"

command :: Html  -- ^ Inner HTML.
        -> Html  -- ^ Resulting HTML.
command = Parent "command" "<command" "</command>"

datalist :: Html  -- ^ Inner HTML.
         -> Html  -- ^ Resulting HTML.
datalist = Parent "datalist" "<datalist" "</datalist>"

dd :: Html  -- ^ Inner HTML.
   -> Html  -- ^ Resulting HTML.
dd = Parent "dd" "<dd" "</dd>"

del :: Html  -- ^ Inner HTML.
    -> Html  -- ^ Resulting HTML.
del = Parent "del" "<del" "</del>"

details :: Html  -- ^ Inner HTML.
        -> Html  -- ^ Resulting HTML.
details = Parent "details" "<details" "</details>"

dfn :: Html  -- ^ Inner HTML.
    -> Html  -- ^ Resulting HTML.
dfn = Parent "dfn" "<dfn" "</dfn>"

div :: Html  -- ^ Inner HTML.
    -> Html  -- ^ Resulting HTML.
div = Parent "div" "<div" "</div>"

dl :: Html  -- ^ Inner HTML.
   -> Html  -- ^ Resulting HTML.
dl = Parent "dl" "<dl" "</dl>"

dt :: Html  -- ^ Inner HTML.
   -> Html  -- ^ Resulting HTML.
dt = Parent "dt" "<dt" "</dt>"

em :: Html  -- ^ Inner HTML.
   -> Html  -- ^ Resulting HTML.
em = Parent "em" "<em" "</em>"

embed :: Html  -- ^ Resulting HTML.
embed = Leaf "embed" "<embed" ">"

fieldset :: Html  -- ^ Inner HTML.
         -> Html  -- ^ Resulting HTML.
fieldset = Parent "fieldset" "<fieldset" "</fieldset>"

figcaption :: Html  -- ^ Inner HTML.
           -> Html  -- ^ Resulting HTML.
figcaption = Parent "figcaption" "<figcaption" "</figcaption>"

figure :: Html  -- ^ Inner HTML.
       -> Html  -- ^ Resulting HTML.
figure = Parent "figure" "<figure" "</figure>"

footer :: Html  -- ^ Inner HTML.
       -> Html  -- ^ Resulting HTML.
footer = Parent "footer" "<footer" "</footer>"

form :: Html  -- ^ Inner HTML.
     -> Html  -- ^ Resulting HTML.
form = Parent "form" "<form" "</form>"

h1 :: Html  -- ^ Inner HTML.
   -> Html  -- ^ Resulting HTML.
h1 = Parent "h1" "<h1" "</h1>"

h2 :: Html  -- ^ Inner HTML.
   -> Html  -- ^ Resulting HTML.
h2 = Parent "h2" "<h2" "</h2>"

h3 :: Html  -- ^ Inner HTML.
   -> Html  -- ^ Resulting HTML.
h3 = Parent "h3" "<h3" "</h3>"

h4 :: Html  -- ^ Inner HTML.
   -> Html  -- ^ Resulting HTML.
h4 = Parent "h4" "<h4" "</h4>"

h5 :: Html  -- ^ Inner HTML.
   -> Html  -- ^ Resulting HTML.
h5 = Parent "h5" "<h5" "</h5>"

h6 :: Html  -- ^ Inner HTML.
   -> Html  -- ^ Resulting HTML.
h6 = Parent "h6" "<h6" "</h6>"

head :: Html  -- ^ Inner HTML.
     -> Html  -- ^ Resulting HTML.
head = Parent "head" "<head" "</head>"

header :: Html  -- ^ Inner HTML.
       -> Html  -- ^ Resulting HTML.
header = Parent "header" "<header" "</header>"

hgroup :: Html  -- ^ Inner HTML.
       -> Html  -- ^ Resulting HTML.
hgroup = Parent "hgroup" "<hgroup" "</hgroup>"

hr :: Html  -- ^ Resulting HTML.
hr = Leaf "hr" "<hr" ">"

html :: Html  -- ^ Inner HTML.
     -> Html  -- ^ Resulting HTML.
html = Parent "html" "<html" "</html>"

i :: Html  -- ^ Inner HTML.
  -> Html  -- ^ Resulting HTML.
i = Parent "i" "<i" "</i>"

iframe :: Html  -- ^ Inner HTML.
       -> Html  -- ^ Resulting HTML.
iframe = Parent "iframe" "<iframe" "</iframe>"

img :: Html  -- ^ Resulting HTML.
img = Leaf "img" "<img" ">"

input :: Html  -- ^ Resulting HTML.
input = Leaf "input" "<input" ">"

ins :: Html  -- ^ Inner HTML.
    -> Html  -- ^ Resulting HTML.
ins = Parent "ins" "<ins" "</ins>"

kbd :: Html  -- ^ Inner HTML.
    -> Html  -- ^ Resulting HTML.
kbd = Parent "kbd" "<kbd" "</kbd>"

keygen :: Html  -- ^ Resulting HTML.
keygen = Leaf "keygen" "<keygen" ">"

label :: Html  -- ^ Inner HTML.
      -> Html  -- ^ Resulting HTML.
label = Parent "label" "<label" "</label>"

legend :: Html  -- ^ Inner HTML.
       -> Html  -- ^ Resulting HTML.
legend = Parent "legend" "<legend" "</legend>"

li :: Html  -- ^ Inner HTML.
   -> Html  -- ^ Resulting HTML.
li = Parent "li" "<li" "</li>"

link :: Html  -- ^ Resulting HTML.
link = Leaf "link" "<link" ">"

map :: Html  -- ^ Inner HTML.
    -> Html  -- ^ Resulting HTML.
map = Parent "map" "<map" "</map>"

mark :: Html  -- ^ Inner HTML.
     -> Html  -- ^ Resulting HTML.
mark = Parent "mark" "<mark" "</mark>"

menu :: Html  -- ^ Inner HTML.
     -> Html  -- ^ Resulting HTML.
menu = Parent "menu" "<menu" "</menu>"

menuitem :: Html  -- ^ Resulting HTML.
menuitem = Leaf "menuitem" "<menuitem" ">"

meta :: Html  -- ^ Resulting HTML.
meta = Leaf "meta" "<meta" ">"

meter :: Html  -- ^ Inner HTML.
      -> Html  -- ^ Resulting HTML.
meter = Parent "meter" "<meter" "</meter>"

nav :: Html  -- ^ Inner HTML.
    -> Html  -- ^ Resulting HTML.
nav = Parent "nav" "<nav" "</nav>"

noscript :: Html  -- ^ Inner HTML.
         -> Html  -- ^ Resulting HTML.
noscript = Parent "noscript" "<noscript" "</noscript>"

object :: Html  -- ^ Inner HTML.
       -> Html  -- ^ Resulting HTML.
object = Parent "object" "<object" "</object>"

ol :: Html  -- ^ Inner HTML.
   -> Html  -- ^ Resulting HTML.
ol = Parent "ol" "<ol" "</ol>"

optgroup :: Html  -- ^ Inner HTML.
         -> Html  -- ^ Resulting HTML.
optgroup = Parent "optgroup" "<optgroup" "</optgroup>"

option :: Html  -- ^ Inner HTML.
       -> Html  -- ^ Resulting HTML.
option = Parent "option" "<option" "</option>"

output :: Html  -- ^ Inner HTML.
       -> Html  -- ^ Resulting HTML.
output = Parent "output" "<output" "</output>"

p :: Html  -- ^ Inner HTML.
  -> Html  -- ^ Resulting HTML.
p = Parent "p" "<p" "</p>"

param :: Html  -- ^ Resulting HTML.
param = Leaf "param" "<param" ">"

pre :: Html  -- ^ Inner HTML.
    -> Html  -- ^ Resulting HTML.
pre = Parent "pre" "<pre" "</pre>"

progress :: Html  -- ^ Inner HTML.
         -> Html  -- ^ Resulting HTML.
progress = Parent "progress" "<progress" "</progress>"

q :: Html  -- ^ Inner HTML.
  -> Html  -- ^ Resulting HTML.
q = Parent "q" "<q" "</q>"

rp :: Html  -- ^ Inner HTML.
   -> Html  -- ^ Resulting HTML.
rp = Parent "rp" "<rp" "</rp>"

rt :: Html  -- ^ Inner HTML.
   -> Html  -- ^ Resulting HTML.
rt = Parent "rt" "<rt" "</rt>"

ruby :: Html  -- ^ Inner HTML.
     -> Html  -- ^ Resulting HTML.
ruby = Parent "ruby" "<ruby" "</ruby>"

samp :: Html  -- ^ Inner HTML.
     -> Html  -- ^ Resulting HTML.
samp = Parent "samp" "<samp" "</samp>"

script :: Html  -- ^ Inner HTML.
       -> Html  -- ^ Resulting HTML.
script = Parent "script" "<script" "</script>"

section :: Html  -- ^ Inner HTML.
        -> Html  -- ^ Resulting HTML.
section = Parent "section" "<section" "</section>"

select :: Html  -- ^ Inner HTML.
       -> Html  -- ^ Resulting HTML.
select = Parent "select" "<select" "</select>"

small :: Html  -- ^ Inner HTML.
      -> Html  -- ^ Resulting HTML.
small = Parent "small" "<small" "</small>"

source :: Html  -- ^ Resulting HTML.
source = Leaf "source" "<source" ">"

span :: Html  -- ^ Inner HTML.
     -> Html  -- ^ Resulting HTML.
span = Parent "span" "<span" "</span>"

strong :: Html  -- ^ Inner HTML.
       -> Html  -- ^ Resulting HTML.
strong = Parent "strong" "<strong" "</strong>"

style :: Html  -- ^ Inner HTML.
      -> Html  -- ^ Resulting HTML.
style = Parent "style" "<style" "</style>"

sub :: Html  -- ^ Inner HTML.
    -> Html  -- ^ Resulting HTML.
sub = Parent "sub" "<sub" "</sub>"

summary :: Html  -- ^ Inner HTML.
        -> Html  -- ^ Resulting HTML.
summary = Parent "summary" "<summary" "</summary>"

sup :: Html  -- ^ Inner HTML.
    -> Html  -- ^ Resulting HTML.
sup = Parent "sup" "<sup" "</sup>"

table :: Html  -- ^ Inner HTML.
      -> Html  -- ^ Resulting HTML.
table = Parent "table" "<table" "</table>"

tbody :: Html  -- ^ Inner HTML.
      -> Html  -- ^ Resulting HTML.
tbody = Parent "tbody" "<tbody" "</tbody>"

td :: Html  -- ^ Inner HTML.
   -> Html  -- ^ Resulting HTML.
td = Parent "td" "<td" "</td>"

textarea :: Html  -- ^ Inner HTML.
         -> Html  -- ^ Resulting HTML.
textarea = Parent "textarea" "<textarea" "</textarea>"

tfoot :: Html  -- ^ Inner HTML.
      -> Html  -- ^ Resulting HTML.
tfoot = Parent "tfoot" "<tfoot" "</tfoot>"

th :: Html  -- ^ Inner HTML.
   -> Html  -- ^ Resulting HTML.
th = Parent "th" "<th" "</th>"

thead :: Html  -- ^ Inner HTML.
      -> Html  -- ^ Resulting HTML.
thead = Parent "thead" "<thead" "</thead>"

time :: Html  -- ^ Inner HTML.
     -> Html  -- ^ Resulting HTML.
time = Parent "time" "<time" "</time>"

title :: Html  -- ^ Inner HTML.
      -> Html  -- ^ Resulting HTML.
title = Parent "title" "<title" "</title>"

tr :: Html  -- ^ Inner HTML.
   -> Html  -- ^ Resulting HTML.
tr = Parent "tr" "<tr" "</tr>"

track :: Html  -- ^ Resulting HTML.
track = Leaf "track" "<track" ">"

ul :: Html  -- ^ Inner HTML.
   -> Html  -- ^ Resulting HTML.
ul = Parent "ul" "<ul" "</ul>"

var :: Html  -- ^ Inner HTML.
    -> Html  -- ^ Resulting HTML.
var = Parent "var" "<var" "</var>"

video :: Html  -- ^ Inner HTML.
      -> Html  -- ^ Resulting HTML.
video = Parent "video" "<video" "</video>"

wbr :: Html  -- ^ Resulting HTML.
wbr = Leaf "wbr" "<wbr" ">"
