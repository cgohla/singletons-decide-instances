{-# LANGUAGE DataKinds                #-}
{-# LANGUAGE FlexibleContexts         #-}
{-# LANGUAGE GADTs                    #-}
{-# LANGUAGE KindSignatures           #-}
{-# LANGUAGE OverloadedStrings        #-}
{-# LANGUAGE QuasiQuotes              #-}
{-# LANGUAGE ScopedTypeVariables      #-}
{-# LANGUAGE StandaloneKindSignatures #-}
{-# LANGUAGE TemplateHaskell          #-}
{-# LANGUAGE TypeApplications         #-}
{-# LANGUAGE TypeFamilies             #-}
{-# LANGUAGE UndecidableInstances     #-}
module Main (main) where

import           Data.Singletons.TH         (genSingletons, singDecideInstances,
                                             singletons)
import           Data.Singletons.TH.Options (defaultOptions,
                                             defunctionalizedName,
                                             promotedDataTypeOrConName,
                                             withOptions)
import           Data.String                (fromString)
import           Data.String.Singletons     (FromString)
import           Data.Text                  (Text)
import           GHC.TypeLits.Singletons    (Symbol)
import           Language.Haskell.TH        (Name)


-- | This is code from the README
-- https://github.com/goldfirere/singletons#arrows-symbol-and-literals

-- Term-level
newtype Message = MkMessage Text
-- Type-level
newtype PMessage = PMkMessage Symbol

$(let customPromote :: Name -> Name
      customPromote n
        | n == ''Message  = ''PMessage
        | n == 'MkMessage = 'PMkMessage
        | n == ''Text     = ''Symbol
        | otherwise       = promotedDataTypeOrConName defaultOptions n

      customDefun :: Name -> Int -> Name
      customDefun n sat = defunctionalizedName defaultOptions (customPromote n) sat in

  withOptions defaultOptions{ promotedDataTypeOrConName = customPromote
                            , defunctionalizedName      = customDefun
                            } $ do
    decs1 <- genSingletons [''Message]
    decs2 <- singletons [d|
               hello :: Message
               hello = MkMessage "hello"
               |]
    decs3 <- singDecideInstances [''Message] -- I added this
    return $ decs1 ++ decs2 ++ decs3)

main :: IO ()
main = putStrLn "Hello, Haskell!"
