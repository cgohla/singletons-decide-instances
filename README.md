
Building this project yields the following error:
```
$ cabal build
Resolving dependencies...
Build profile: -w ghc-9.2.4 -O1
In order, the following will be built (use -v for more details):
 - singletons-decide-instances-0.1.0.0 (exe:singletons-decide-instances) (file app/Main.hs changed)
Preprocessing executable 'singletons-decide-instances' for singletons-decide-instances-0.1.0.0..
Building executable 'singletons-decide-instances' for singletons-decide-instances-0.1.0.0..
[1 of 1] Compiling Main             ( app/Main.hs, /home/bgohla/src/scratch/singletons-decide-instances/dist-newstyle/build/x86_64-openbsd/ghc-9.2.4/singletons-decide-instances-0.1.0.0/x/singletons-decide-instances/build/singletons-decide-instances/singletons-decide-instances-tmp/Main.o, /home/bgohla/src/scratch/singletons-decide-instances/dist-newstyle/build/x86_64-openbsd/ghc-9.2.4/singletons-decide-instances-0.1.0.0/x/singletons-decide-instances/build/singletons-decide-instances/singletons-decide-instances-tmp/Main.dyn_o )

app/Main.hs:32:2: error:
    • Couldn't match kind ‘PMessage’ with ‘Message’
      Expected kind ‘Message -> *’,
        but ‘SMessage’ has kind ‘PMessage -> *’
    • In the first argument of ‘Data.Type.Coercion.TestCoercion’, namely
        ‘(SMessage :: Message -> ghc-prim-0.8.0:GHC.Types.Type)’
      In the instance declaration for
        ‘Data.Type.Coercion.TestCoercion (SMessage :: Message
                                                      -> ghc-prim-0.8.0:GHC.Types.Type)’
   |
32 | $(let customPromote :: Name -> Name
   |  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^...

app/Main.hs:32:2: error:
    • Couldn't match kind ‘PMessage’ with ‘Message’
      Expected kind ‘Message -> *’,
        but ‘SMessage’ has kind ‘PMessage -> *’
    • In the first argument of ‘Data.Type.Equality.TestEquality’, namely
        ‘(SMessage :: Message -> ghc-prim-0.8.0:GHC.Types.Type)’
      In the instance declaration for
        ‘Data.Type.Equality.TestEquality (SMessage :: Message
                                                      -> ghc-prim-0.8.0:GHC.Types.Type)’
   |
32 | $(let customPromote :: Name -> Name
   |  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^...
```
