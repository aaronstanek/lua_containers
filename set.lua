require("class")

set = class("set")

set.construct = function(obj,param)
  obj.size = 0
  obj.data = {}
end

set.methods.add = function(self,value)
  self.data[value] = set
  self.size = self.size+1
end

set.methods.addset = function(self,nset)
  for k,v in pairs(nset.data) do
    self:add(k)
  end
end

set.methods.isin = function(self,value)
  if self.data[value]==set then
    return true
  end
  return false
end

set.methods.issubset = function(self,s)
  if s.size>self.size then
    return false
  end
  for k,v in pairs(s.data) do
    if self:isin(k)==false then
      return false
    end
  end
  return true
end

set.methods.rm = function(self,value)
  if self:isin(value) then
    table.remove(self.data,value)
    self.size = self.size-1
  end
end

set.methods.rmset = function(self,nset)
  for k,v in pairs(nset.data) do
    self:rm(k)
  end
end

set.union = function(s1,s2)
  local h = set()
  h:addset(s1)
  h:addset(s2)
  return h
end

set.intersection = function(s1,s2)
  local h = set()
  for k,v in pairs(s1) do
    if s2:isin(k) then
      h:add(k)
    end
  end
  return h
end

set.overloads.__eq = function(s1,s2)
  if s1.size~=s2.size then
    return false
  end
  return s1:issubset(s2)
end
