require("class")

queue = class("queue")

queue.element = class("queue_element")

queue.element.construct = function(obj,param)
  obj.value = param
  obj.next = nil
end

queue.construct = function(obj,param)
  obj.size = 0
  obj.first = nil
  obj.last = nil
end

queue.methods.add = function(self,value)
  local h = queue.element(value)
  if self.size==0 then
    self.first = h
    self.last = h
  else
    self.last.next = h
    self.last = h
  end
  self.size = self.size+1
end

queue.methods.pop = function(self)
  if self.size>1 then
    self.first = self.first.next
    self.size = self.size-1
  elseif self.size==1 then
    self.first = nil
    self.last = nil
    self.size = self.size-1
  end
end

queue.methods.read = function(self)
  if self.size==0 then
    return nil
  end
  return self.first.value
end
