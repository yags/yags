
# YAGS

YAGS is a [GAP](http://gap-system.org/) package for working with graphs (in the sense of graph
theory). It is intended to be an alternative to [GRAPE](http://gap-system.org/Packages/grape.html).

# Obtaining YAGS

YAGS can be obtained from [its page](https://github.com/yags/yags) at GitHub.

# Installation

To try YAGS, you can first install it from git at a local
directory. In a terminal, move to the directory `~/gaplocal`, then 
get the YAGS files:

    git clone http://github.com/yags/yags.git pkg/yags

and then start `gap` with 

    gap -r -l ";~/gaplocal"

The option `-r` makes `gap` not to read your initialization files, which
might conflict with YAGS current function names, especially if you
load GRAPE. After GAP starts, you should be able to load YAGS:

    gap> RequirePackage("yags");
    
    Loading  YAGS - Yet Another Graph System 0.0.1.
    Copyright (C) 2016 R. MacKinney-Romero, M.A. Pizana and R. Villarroel-Flores
    This is free software under GPLv3; for details type: ?yags:Copyright
    
    true

