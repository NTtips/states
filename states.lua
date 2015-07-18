
local states = {}
states.states = {}
states.currentState = ""

function states.newState(name, table)
   if not states.states[name] then
      states.states[name] = table
   end
end

function states.setState(name)
   if states.states[name] then
      print("no")
      states.currentState = name
      print(states.currentState)
   end
end

function states.load(name)
   if states.states[name] then
      states.states[name]:load()
   end
end

function states.loadAll()
   for k, v in pairs(states.states) do
      if v.load then
         v:load()
      end
   end
end


function states.draw()
   if states.currentState ~= "" then
      if states.states[states.currentState].draw then
         states.states[states.currentState]:draw()
      end
   end
end

function states.update(dt)
   if states.currentState ~= "" then
      if states.states[states.currentState].update then
         states.states[states.currentState]:update(dt)
      end
   end
end

function states.mousepressed(button, x, y)
   if states.currentState ~= "" then
      if states.states[states.currentState].mousepressed then
         states.states[states.currentState]:mousepressed(button, x, y)
      end
   end
end

function states.mousereleased(button, x, y)
   if states.currentState ~= "" then
      if states.states[states.currentState].mousereleased then
         states.states[states.currentState]:mousereleased(button, x, y)
      end
   end
end

function states.keypressed(key, unicode)
   if states.currentState ~= "" then
      if states.states[states.currentState].keypressed then
         states.states[states.currentState]:keypressed(key, unicode)
      end
   end
end

function states.keyreleased(key, unicode)
   if states.currentState ~= "" then
      if states.states[currentState].keyreleased then
         states.states[states.currentState]:keyreleased(key, unicode)
      end
   end
end

return states
