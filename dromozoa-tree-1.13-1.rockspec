-- This file was automatically generated for the LuaDist project.

package = "dromozoa-tree"
version = "1.13-1"
-- LuaDist source
source = {
  tag = "1.13-1",
  url = "git://github.com/LuaDist-testing/dromozoa-tree.git"
}
-- Original source
-- source = {
--   url = "https://github.com/dromozoa/dromozoa-tree/archive/v1.13.tar.gz";
--   file = "dromozoa-tree-1.13.tar.gz";
-- }
description = {
  summary = "Tree data structures and algorithms";
  license = "GPL-3";
  homepage = "https://github.com/dromozoa/dromozoa-tree/";
  maintainer = "Tomoyuki Fujimori <moyu@dromozoa.com>";
}
dependencies = {
  "dromozoa-commons";
}
build = {
  type = "builtin";
  modules = {
    ["dromozoa.tree"] = "dromozoa/tree.lua";
    ["dromozoa.tree.bfs"] = "dromozoa/tree/bfs.lua";
    ["dromozoa.tree.dfs"] = "dromozoa/tree/dfs.lua";
    ["dromozoa.tree.graphviz"] = "dromozoa/tree/graphviz.lua";
    ["dromozoa.tree.model"] = "dromozoa/tree/model.lua";
    ["dromozoa.tree.node"] = "dromozoa/tree/node.lua";
  };
}