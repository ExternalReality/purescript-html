module Text.Html where

import Text.Markup

type Html = MarkupM Unit 

toHtml = toMarkup

renderHtml :: Html -> String
renderHtml = renderMarkup
