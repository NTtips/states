
local states = {}
states.states = {}
states.currentState = ""

function states.init(statetable, startState)
  for k, v in pairs(statetable) do
    if not states.states[v.name] then
      states.states[v.name] = v
    end
  end
  if startState then
    states.setState(startState, true)
  end
end

function states.setState(name, loadBool)
   if states.states[name] then
      states.currentState = name
      if loadBool states.load(states.currentState) else end
      print(states.currentState)
   end
end

function states.load(name)
   if states.states[name] then
      states.states[name]:load()
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

function states.mousepressed(x, y, button)
   if states.currentState ~= "" then
      if states.states[states.currentState].mousepressed then
         states.states[states.currentState]:mousepressed(x, y, button)
      end
   end
end

function states.mousereleased(x, y, button)
   if states.currentState ~= "" then
      if states.states[states.currentState].mousereleased then
         states.states[states.currentState]:mousereleased(x, y, button)
      end
   end
end

function states.keypressed(key, scancode, isrepeat)
   if states.currentState ~= "" then
      if states.states[states.currentState].keypressed then
         states.states[states.currentState]:keypressed(key, scancode, isrepeat)
      end
   end
end

function states.keyreleased(key, scancode, isrepeat)
   if states.currentState ~= "" then
      if states.states[currentState].keyreleased then
         states.states[states.currentState]:keyreleased(key, scancode, isrepeat)
      end
   end
end

return states
