require("class")

list = class("list")

list.construct = function(obj,param)
  obj.size = 0
  obj.data = {}
end

list.methods.at = function(self,index)
  return self.data[index]
end

list.overloads.__call = list.methods.at

list.methods.back = function(self)
  return self.data[self.size]
end

list.methods.put = function(self,index,value)
  self.data[index] = value
end

list.methods.append = function(self,value)
  self.size = self.size+1
  self.data[self.size] = value
end

list.methods.appendlist = function(self,newlist)
  for i=1, newlist.size do
    self:append(newlist(i))
  end
end

list.methods.appendarray = function(self,arr)
  local i = 1
  while true do
    if arr[i]==nil then
      return
    end
    self:append(arr[i])
    i = i+1
  end
end

list.methods.pop = function(self)
  if self.size==0 then
    return
  end
  table.remove(self.data,self.size)
  self.size = self.size-1
end

list.methods.slice = function(self,start,term,iter)
  local t_start
  if start==nil then
    t_start = 1
  else
    t_start = start
  end
  local t_term
  if term==nil then
    t_term = self.size
  else
    t_term = term
  end
  local t_iter
  if iter==nil then
    t_iter = 1
  else
    t_iter = iter
  end
  local h = list()
  for i=t_start, t_term, t_iter do
    h:append(self(i))
  end
  return h
end

list.join = function(lst1, lst2)
  local h = list()
  h:appendlist(lst1)
  h:appendlist(lst2)
end

list.overloads.__eq = function(lst1, lst2)
  if lst1.size~=lst2.size then
    return false
  end
  for i=1, lst1.size do
    if lst1(i)~=lst2(i) then
      return false
    end
  end
  return true
end
