-- Copyright (C) 2015 Tomoyuki Fujimori <moyu@dromozoa.com>
--
-- This file is part of dromozoa-tree.
--
-- dromozoa-tree is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- dromozoa-tree is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with dromozoa-tree.  If not, see <http://www.gnu.org/licenses/>.

local sequence_writer = require "dromozoa.commons.sequence_writer"
local tree = require "dromozoa.tree"

local t = tree()

local n1 = t:create_node()
local n2 = t:create_node()
local n3 = t:create_node()
local n4 = t:create_node()
local n5 = t:create_node()
local n6 = t:create_node()
local n7 = t:create_node()
local n8 = t:create_node()

n1:append_child(n2)
n1:append_child(n3)
n2:append_child(n4)
n2:append_child(n5)
n3:append_child(n6)
n4:insert_sibling(n8)

local data = t:write_graphviz(sequence_writer()):concat()
assert(not data:find("\n" .. n2.id .. ";"))
assert(data:find("\n" .. n7.id .. ";"))

local data = t:write_graphviz(sequence_writer(), {
  default_node_attributes = function ()
    return {
      style = "filled";
    }
  end;
  node_attributes = function (_, u)
    if u.id == n1.id then
      return {
        fontcolor = "white";
        fillcolor = "black";
      }
    elseif u.id % 2 == 1 then
      return nil
    else
      return {
        shape = "box";
        style = "rounded";
      }
    end
  end;
}):concat()
assert(not data:find("\n" .. n2.id .. ";"))
assert(data:find("\n" .. n7.id .. ";"))
local out = assert(io.open("test.dot", "w"))
out:write(data)
out:close()
