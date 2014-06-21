module Text.Markup where
import Data.Monoid

class ToMarkup a where
    toMarkup :: a -> Markup

instance numberToMarkup :: ToMarkup Number where
    toMarkup = Content <<< show 

instance stringToMarkup :: ToMarkup String where
    toMarkup = Content <<< show 

data MarkupM a
    -- | Tag, open tag, end tag, content
    = Parent String String String (MarkupM a)
    -- | Custom parent
    | CustomParent String (MarkupM a)
    -- | Tag, open tag, end tag
    | Leaf String String String
    -- | Custom leaf
    | CustomLeaf String Boolean
    -- | HTML content
    | Content String
    -- | Concatenation of two HTML pieces
    | Append (MarkupM a) (MarkupM a)
    -- | Add an attribute to the inner HTML. Raw key, key, value, HTML to
    -- receive the attribute.
    | AddAttribute String String String (MarkupM a)
    -- | Add a custom attribute to the inner HTML.
    | AddCustomAttribute String String (MarkupM a)
    -- | Empty HTML.
    | Empty

type Markup = MarkupM Unit

instance semigroupMarkupM :: Semigroup (MarkupM a) where
    (<>) = Append

instance monoidMarkupM :: (Monoid a) => Monoid (MarkupM a) where
    mempty = Empty

instance functorMarkupM :: Functor MarkupM  where
    (<$>) _ = unsafeCoerce

instance applyMarkupM :: Apply MarkupM where
    (<*>) f _ = (error "Text.Markup: invalid use of applicative")

instance bindMarkup :: Bind MarkupM where
    (>>=) h1 f = (unsafeCoerce h1) <>  f (error "Text.Markup: invalid use of monadic bind")

instance applicativeMarkup :: Applicative MarkupM where
    pure _ = Empty

instance monadMarkupM :: Monad MarkupM

data Tag = Tag { unTag :: String }

data Attribute = Attribute forall a. (MarkupM a -> MarkupM a)

instance monoidSemigroup :: Semigroup Attribute where
   (<>) (Attribute f) (Attribute g) = Attribute (g <<< f)

instance monoidAttribute :: Monoid Attribute where
    mempty = Attribute id

instance semigroupAttributeValue :: Semigroup AttributeValue where
  (<>) (AttributeValue f) (AttributeValue g) = 
      AttributeValue {unAttributeValue : (f.unAttributeValue ++ g.unAttributeValue)}

instance monoidAttributeValue :: Monoid AttributeValue where
    mempty = AttributeValue {unAttributeValue : ""}

data AttributeValue = AttributeValue { unAttributeValue :: String }

foreign import unsafeCoerce
  "function unsafeCoerce(a){return a}" :: forall a b. a -> b         

foreign import error
  "function error (msg) {return (function () {console.log(msg)})}" :: forall a. String -> a

-- | Create a custom parent element
customParent :: Tag     -- ^ Element tag
             -> Markup  -- ^ Content
             -> Markup  -- ^ Resulting markup
customParent (Tag o) = CustomParent (o.unTag)

-- | Create a custom leaf element
customLeaf :: Tag     -- ^ Element tag
           -> Boolean -- ^ Close the leaf?
           -> Markup  -- ^ Resulting markup
customLeaf (Tag o) = CustomLeaf (o.unTag)

-- | Render some 'Markup' to an appending 'String'.
--
renderString :: Markup  -- ^ Markup to render
             -> String  -- ^ String to append
             -> String  -- ^ Resulting String
renderString = go id 
  where
    go :: forall b. (String -> String) -> MarkupM b -> String -> String

    go attrs (Parent _ open close content) =
        ((++) open)   <<< 
        attrs         <<< 
        ((++) ">")    <<< 
        go id content <<< 
        ((++) close)

    go attrs (CustomParent tag content) =
        ((++) "<")    <<< 
        ((++) tag)    <<< 
        attrs         <<< 
        ((++) ">")    <<< 
        go id content <<<
        ((++) "</")   <<< 
        ((++) tag)    <<< 
        ((++) ">")

    go attrs (Leaf _ begin end) = ((++) begin) <<< attrs <<< ((++) end)

    go attrs (CustomLeaf tag close) =
        ((++) "<") <<<  ((++) tag) <<< attrs <<<
        (if close 
         then ((++) " />" ) 
         else ((++) ">"))

    go attrs (AddAttribute _ key value h) = flip go h $
        ((++) key) <<< ((++) value) <<< ((++) "\"") <<< attrs

    go attrs (AddCustomAttribute key value h) = flip go h $
        ((++) " ") <<< ((++) key) <<< ((++) "=\"") <<< ((++) value) <<<
        ((++) "\"") <<<  attrs

    go _ (Content content) = ((++) content)

    go attrs (Append h1 h2) = go attrs h1 <<< go attrs h2

    go _ Empty = id

renderMarkup :: Markup -> String
renderMarkup markup = renderString markup ""

-- dataAttribute :: Tag             -- ^ Name of the attribute.
--               -> AttributeValue  -- ^ Value for the attribute.
--               -> Attribute       -- ^ Resulting HTML attribute.
-- dataAttribute (Tag tag) (AttributeValue value) = Attribute $ AddCustomAttribute
--     ("data-" <> (tag.unTag))
--     (value.unAttributeValue)

-- customAttribute :: Tag             -- ^ Name of the attribute
--                 -> AttributeValue  -- ^ Value for the attribute
--                 -> Attribute       -- ^ Resulting HTML attribtue
-- customAttribute tag value = Attribute $ AddCustomAttribute
--     (Static $ unTag tag)
--     (unAttributeValue value)
-- {-# INLINE customAttribute #-}
