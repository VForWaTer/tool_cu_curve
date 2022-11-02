function bins = discretize(x, edges)
    bins = lookup(edges, x);
endfunction