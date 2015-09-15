### Does -callback work with Dialyzer?

I'm not so sure at this point. I've run the following using Erlang R15B02 (we're on an old version).
```bash
> dialyzer --build_plt --apps erts stdlib kernel
  Compiling some key modules to native code... done in 0m17.77s
  Creating PLT /Users/Ceryni/.dialyzer_plt ...
Unknown functions:
  compile:file/2
  compile:forms/2
  compile:noenv_forms/2
  compile:output_generated/1
  crypto:des3_cbc_decrypt/5
  crypto:start/0
Unknown types:
  compile:option/0
 done in 0m27.91s
done (passed successfully)
> dialyzer dude.erl runner.erl no_spec_dude.erl spec_dude.erl
  Checking whether the PLT /Users/Ceryni/.dialyzer_plt is up-to-date... yes
  Proceeding with analysis...
runner.erl:7: Function run/0 has no local return
runner.erl:9: The call spec_dude:hey_dude(42) breaks the contract (Say::string()) -> Res::string()
 done in 0m0.31s
done (warnings were emitted)
```

So as you see, dialyzer issues a warning on line 9 but not line 8 as I would have expected. The `-spec` defined in `spec_dude.erl` is the same as the `-callback` defined on the behavior `dude.erl`. I'm not sure why but it seems like dialyzer is not applying the `-callback` to the implementing callback module `no_spec_dude.erl`.
