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

local empty = require "dromozoa.commons.empty"
local queue = require "dromozoa.commons.queue"
local visit = require "dromozoa.commons.visit"

return function (tree, visitor, s)
  local q = queue():push(s)
  visit(visitor, "discover_node", tree, s)
  while not empty(q) do
    local u = q:pop()
    for v in u:each_child() do
      q:push(v)
      visit(visitor, "discover_node", tree, v)
    end
    visit(visitor, "finish_node", tree, u)
  end
end