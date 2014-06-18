purescript-html
---------------

A Direct Port of the BlazeHTML API for Haskell

```haskell
import Text.Html
import Text.Html5

personalityPage = renderHtml $ docTypeHtml $ do
  personalityPageHead
  personalityPageBody

personalityPageHead :: Html
personalityPageHead = head $ do
   title $ toHtml "Personality!!!"

personalityPageBody :: Html
personalityPageBody = body $ do
    introParagraph
    personalityList

introParagraph :: Html
introParagraph = p $ toHtml "Cause you've got - (personality) :"

personalityList :: Html
personalityList =  ul $ do
    li $ toHtml "Walk - (personality)"
    li $ toHtml "Talk - (personality)"
    li $ toHtml "Smile - (personality)"
```

Prettified Render:

```html
<!DOCTYPE HTML>

<html>
<head>
    <title>"Personality!!!"</title>
</head>

<body>
    <p>"Cause you've got - (personality) :"</p>

    <ul>
        <li>"Walk - (personality)"</li>

        <li>"Talk - (personality)"</li>

        <li>"Smile - (personality)"</li>
    </ul>
</body>
</html>
```
