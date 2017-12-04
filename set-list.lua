require("set")
require("list")

set_to_array = function(nset)
  local h = {}
  local i = 1
  for k,v in pairs(nset.data) do
    h[i] = k
    i = i+1
  end
end

array_to_set = function(arr)
  local h = set()
  for k,v in pairs(arr) do
    h:add(v)
  end
  return h
end

list_to_array = function(lst)
  return shallowcopy(lst.data)
end

array_to_list = function(arr)
  local h = list()
  h.appendarray(arr)
  return h
end

set_to_list = function(nset)
  local h = list()
  for k,v in pairs(nset.data) do
    h:append(k)
  end
  return h
end

list_to_set = function(lst)
  local h = set()
  for i=1,lst.size do
    h:add(lst:at(i))
  end
  return h
end
