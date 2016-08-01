
--[[
function love.load()
	splash = love.graphics.newImage("futuretech_logo.jpg")

	--sound = love.audio.newSource("Bob Marley - No Woman No Cry.mp3")
	--love.audio.play(sound)
end

x, y = 20, 20
speed = 300

function love.draw()
	love.window.setTitle("FPS: " .. love.timer.getFPS())
	love.graphics.setColor(127, 127, 127, 255)
	love.graphics.draw(splash, 0, 0, 0, 1, 1)
	
	love.graphics.setColor(255, 255, 255)	-- white
	love.graphics.print("ok " .. 123, 400, 300) -- print to screen
	
	
	love.graphics.setColor(255, 0, 0)	-- red
	love.graphics.circle("fill", x, y, 15)
end

function love.update (dt)
	--x, y = love.mouse.getPosition()
		
	if love.keyboard.isDown("right") then
		x = x + speed*dt
	end
	if love.keyboard.isDown("left") then
		x = x - speed*dt
	end
	if love.keyboard.isDown("down") then
		y = y + speed*dt
	end
	if love.keyboard.isDown("up") then
		y = y - speed*dt
	end
end


--require "love-splash/main"
]]


--[[
player = {
x = 150,
y = 150,
xvel = 0,
yvel = 0,
rotation = 0
}

local ANGACCEL= 4
local ACCELERATION= 400

function love.update (dt)
	if love.keyboard.isDown("right") then
		-- rotate clockwise
		player.rotation = player.rotation + ANGACCEL*dt
	end
	if love.keyboard.isDown("left") then
		-- rotate counter-clockwise
		player.rotation = player.rotation - ANGACCEL*dt
	end
	if love.keyboard.isDown("down") then
		-- decelerate / accelerate backwards
		player.xvel = player.xvel - ACCELERATION*dt * math.cos(player.rotation)
		player.yvel = player.yvel - ACCELERATION*dt * math.sin(player.rotation)
	end
	if love.keyboard.isDown("up") then
		-- accelerate
		player.xvel = player.xvel + ACCELERATION*dt * math.cos(player.rotation)
		player.yvel = player.yvel + ACCELERATION*dt * math.sin(player.rotation)
	end
		player.x = player.x + player.xvel*dt
		player.y = player.y + player.yvel*dt
		player.xvel = player.xvel * 0.99
		player.yvel = player.yvel * 0.99
end

function love.draw()
	love.window.setTitle("FPS: " .. love.timer.getFPS())
	love.graphics.setColor(80, 80, 80)
	love.graphics.translate(player.x, player.y)
	love.graphics.rotate(player.rotation)
	love.graphics.rectangle("fill", -50, -10, 100, 20)
	love.graphics.setColor(200, 200, 200)
	love.graphics.line(20, 0, 50, 0)
end

]]

--[[
function love.load()
	orang = love.graphics.newImage("orang.png")
	splash = love.graphics.newImage("futuretech_logo.jpg")
	vid1 = love.graphics.newVideo("Typing_example_ogv_160p.ogv", true)
	vid1:play()
end

function love.draw()
	love.graphics.draw(splash, 0, 0, 0, 1, 1)
	
	love.graphics.draw(vid1, 10, 10, 0, 1, 1)
	love.graphics.draw(orang, 210, 80, 0, 1, 1)
end

function love.update (dt)

end
]]

--[[

-- GAME STATE & TIMER
state = 1;

function love.load ()
	orang = love.graphics.newImage("orang.png")
	splash = love.graphics.newImage("futuretech_logo.jpg")
	vid1 = love.graphics.newVideo("Typing_example_ogv_160p.ogv", true)
	
	initTime = love.timer.getTime()
end

function love.draw ()
	love.window.setTitle(love.timer.getFPS())
	
	if state == 1 then
		vid1:play()
		love.graphics.draw(splash, 0, 0, 0, 1, 1)
		love.graphics.draw(vid1, 10, 10, 0, 1, 1)
		love.graphics.draw(orang, 210, 80, 0, 1, 1)
	elseif state == 2 then
		vid1:rewind()
		--vid1:pause()
		love.graphics.print("ok " .. 123, 400, 300) -- print to screen
	end
	
end

function love.update (dt)
	currentTime = love.timer.getTime()
	timeDelta = math.floor(currentTime - initTime)
	if timeDelta >= 1.0 then
		initTime = currentTime
		if state == 1 then state = 2
		elseif state == 2 then state = 1 end
	end
end
]]

--[[
-- CHANGE GAME STATE + CLICK SPRITE , using love.update() -> MUCH BETTER
state = 1;

function love.load ()
	splash = love.graphics.newImage("futuretech_logo.jpg")
	box = love.graphics.newImage("box.png")
end

function love.draw ()
	--love.window.setTitle(love.timer.getFPS())
	
	if state == 1 then
		love.graphics.draw(splash, 50, 50, 0, 1, 1)
	elseif state == 2 then
		love.graphics.draw(box, 210, 280, 0, 1, 1)
	end
	
	love.graphics.print(love.mouse.getX() .. ', ' .. love.mouse.getY())
	--love.graphics.print(splash:getWidth() .. ', ' .. splash:getHeight())
end

function love.update (dt)
	if state == 1 and detect_click(splash, 50, 50) then
		state = 2
	elseif state == 2 and detect_click(box, 210, 280) then
		state = 1
	end
end


function detect_click (img, x, y)
	if love.mouse.isDown(1) == true and (love.mouse.getX() >= x and love.mouse.getX() <= x+img:getWidth() and 
		love.mouse.getY() >= y and love.mouse.getY() <= y+img:getHeight() ) then
		
		return true
	else
		return false
	end
end
]]


--[[
-- CHANGE GAME STATE + CLICK SPRITE, using love.mousepressed(), ALTERNATIVE
state = 1;

function love.load ()
	splash = love.graphics.newImage("futuretech_logo.jpg")
	box = love.graphics.newImage("box.png")
end

function love.draw ()
	--love.window.setTitle(love.timer.getFPS())
	
	if state == 1 then
		love.graphics.draw(splash, 50, 50, 0, 1, 1)
	elseif state == 2 then
		love.graphics.draw(box, 210, 280, 0, 1, 1)
	end
	
	love.graphics.print(love.mouse.getX() .. ', ' .. love.mouse.getY())
	--love.graphics.print(splash:getWidth() .. ', ' .. splash:getHeight())
end

function love.update (dt)
	
end

function love.mousepressed(x, y, button, istouch)
	if state == 1 and detect_click(splash, 50, 50) then
		state = 2
	elseif state == 2 and detect_click(box, 210, 280) then
		state = 1
	end
end

function love.keyreleased(key)
	if key == "escape" then
		love.event.quit()
	end
end

function detect_click (img, x, y)
	if love.mouse.isDown(1) == true and (love.mouse.getX() >= x and love.mouse.getX() <= x+img:getWidth() and 
		love.mouse.getY() >= y and love.mouse.getY() <= y+img:getHeight() ) then
		
		return true
	else
		return false
	end
end
]]



--[[
-- FADE

alpha = 255

function love.load ()
	love.graphics.setBackgroundColor(100, 200, 200)
	orang = love.graphics.newImage("futuretech_logo.jpg")
end

function love.draw ()
	love.window.setTitle(love.timer.getFPS())
	love.graphics.draw(orang, 50, 50, 0, 1, 1)
end

function love.update (dt)
	--if detect_click(orang, 210, 80) then is_clicked = true end
	fade_black()
end


function fade_black ()
	if alpha > 0 then
		alpha = alpha - 7
		love.graphics.setColor(255, 255, 255, alpha)
		return false
	else
		return true
	end	
end
]]


--[[
-- EXIT when ESC key pressed and released
function love.load ()
end

function love.draw ()
end

function love.update (dt)
end

function love.keyreleased(key)
	if key == "escape" then
		love.event.quit()
	end
end
]]



--[[
-- PHYSICS BOX2D
function love.load()
	love.physics.setMeter(64) --the height of a meter our worlds will be 64px
	world = love.physics.newWorld(0, 9.81*64, true) --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81
	
	objects = {} -- table to hold all our physical objects
	
	--let's create the ground
	objects.ground = {}
	objects.ground.body = love.physics.newBody(world, 650/2, 650-50/2) --remember, the shape (the rectangle we create next) anchors to the body from its center, so we have to move it to (650/2, 650-50/2)
	objects.ground.shape = love.physics.newRectangleShape(650, 50) --make a rectangle with a width of 650 and a height of 50
	objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape); --attach shape to body
	
	--let's create a BALL
	objects.ball = {}
	objects.ball.body = love.physics.newBody(world, 650/2, 650/2, "dynamic") --place the body in the center of the world and make it dynamic, so it can move around
	objects.ball.shape = love.physics.newCircleShape(20) --the ball's shape has a radius of 20
	objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape, 1) -- Attach fixture to body and give it a density of 1.
	objects.ball.image = love.graphics.newImage("orang.png")
	objects.ball.fixture:setRestitution(0.9) --let the ball bounce
	
	
	-- create BLOCK 1
	objects.block1 = {}
	objects.block1.body = love.physics.newBody(world, 200, 550, "dynamic")
	objects.block1.shape = love.physics.newRectangleShape(0, 0, 50, 100)
	objects.block1.fixture = love.physics.newFixture(objects.block1.body, objects.block1.shape, 5) -- A higher density gives it more mass.
	
	-- create BLOCK 2
	objects.block2 = {}
	objects.block2.body = love.physics.newBody(world, 200, 400, "dynamic")
	objects.block2.shape = love.physics.newRectangleShape(0, 0, 100, 50)
	objects.block2.fixture = love.physics.newFixture(objects.block2.body, objects.block2.shape, 2)
	
	--initial graphics setup
	love.graphics.setBackgroundColor(104, 136, 248) --set the background color to a nice blue
	love.window.setMode(650, 650) --set the window dimensions to 650 by 650
end

function love.update (dt)
	world:update(dt) --this puts the world into motion
	
	--here we are going to create some keyboard events
	if love.keyboard.isDown("right") then --press the right arrow key to push the ball to the right
		objects.ball.body:applyForce(400, 0)
	elseif love.keyboard.isDown("left") then --press the left arrow key to push the ball to the left
		objects.ball.body:applyForce(-400, 0)
	elseif love.keyboard.isDown("up") then --press the up arrow key to set the ball in the air
		objects.ball.body:setPosition(650/2, 650/2)
		objects.ball.body:setLinearVelocity(0, 0) --we must set the velocity to zero to prevent a potentially large velocity generated by the change in position
	end
end

function love.draw()
	love.graphics.setColor(72, 160, 14) -- set the drawing color to green for the ground
	love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints())) -- draw a "filled in" polygon using the ground's coordinates
	
	--love.graphics.setColor(193, 47, 14) --set the drawing color to red for the ball
	love.graphics.draw(objects.ball.image, objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.body:getAngle(),  1, 1, objects.ball.image:getWidth()/2, objects.ball.image:getHeight()/2)
	--love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())
	
	love.graphics.setColor(50, 50, 50) -- set the drawing color to grey for the blocks
	love.graphics.polygon("fill", objects.block1.body:getWorldPoints(objects.block1.shape:getPoints()))
	love.graphics.polygon("fill", objects.block2.body:getWorldPoints(objects.block2.shape:getPoints()))
end
]]


--[[
-- PLATFORMER JUMPING
function love.load()
	-- Nice and organised
	player = {
		x = 0,
		y = 0,
		y_velocity = 0,
		jetpack_fuel = 0.5, -- Note: not an actual jetpack. Variable is the time (in seconds) you can hold spacebar and jump higher.
		jetpack_fuel_max = 0.5,
		image = love.graphics.newImage("box.png") -- Let's just re-use this sprite
	}
	
	gravity = 400
	jump_height = 300
	
	winW, winH = love.graphics.getWidth(), love.graphics.getHeight() -- This is just so we can draw it in a fabulous manner
end
 
function love.draw()
	love.graphics.rectangle("fill", 0, winH / 2, winW, winH / 2)
	love.graphics.translate(winW / 2, winH / 2) -- You don't need to understand this
	
	love.graphics.draw(player.image, player.x, -player.y, 0, 1, 1, 64, 80) -- Trust me on the origin position. Just trust me
end

function love.update (dt)
	if player.y_velocity ~= 0 then -- We're probably jumping
		player.y = player.y + player.y_velocity * dt -- "dt" means we wont move at different speeds if the game lags
		player.y_velocity = player.y_velocity - gravity * dt
		
		if player.y < 0 then -- We hit the ground again
			player.y_velocity = 0
			player.y = 0
		end
	end
end
 
function love.keypressed(key, scancode, isrepeat)
	if key == "space" then
		if player.y_velocity == 0 then -- We're probably on the ground, let's jump
			player.y_velocity = jump_height
		end
	end
end


function love.update (dt)
	if player.jetpack_fuel > 0 and love.keyboard.isDown("space") then -- We can still move upwards and we're actually holding space
		player.jetpack_fuel = player.jetpack_fuel - dt -- Decrease the fuel meter
		player.y_velocity = player.y_velocity + jump_height * (dt / player.jetpack_fuel_max)
	end
	
	if player.y_velocity ~= 0 then -- we're probably jumping
		player.y = player.y + player.y_velocity * dt -- "dt" means we wont move at different speeds if the game lags
		player.y_velocity = player.y_velocity - gravity * dt
		
		-- We hit the ground again
		if player.y < 0 then
			player.y_velocity = 0
			player.y = 0
			player.jetpack_fuel = player.jetpack_fuel_max
		end
	end
end
]]



--[[
-- SCROLLING IMAGE

s = ""

function love.load ()
	orang = {
		x = 50,
		y = 50,
		img = love.graphics.newImage("orang.png")
	}
end

function love.draw ()
	love.graphics.draw(orang.img, orang.x, orang.y, 0, 1, 1)
	love.graphics.print(s, 400, 300) -- print to screen
end

function love.update (dt)
	mx, my = love.mouse.getPosition()
	
	if love.mouse.isDown(1) then
		if (love.mouse.getX() >= orang.x and love.mouse.getX() <= orang.x+orang.img:getWidth() and 
		love.mouse.getY() >= orang.y and love.mouse.getY() <= orang.y+orang.img:getHeight() ) then
		
			if not offset then
				offset = {}
				offset.x = love.mouse.getX() - orang.x
				offset.y = love.mouse.getY() - orang.y
			end
			
			s = tostring( offset.x .. ", " .. offset.y )
		end
		
		if offset then
			orang.x = mx - offset.x
			orang.y = my - offset.y
		end
		
	else
		offset = nil
	end
	
end
]]

--[[
-- FONT LOADING

function love.load ()
	font1 = love.graphics.newFont("comicbd.ttf", 20)
end

function love.draw ()
	love.graphics.setFont(font1)
	love.graphics.print("abc 123 abc 123 abc 123", 50, 400, 0, 1, 1, 0, 0, 0, -1)
end

function love.update (dt)
	
end
]]


--[[
-- COLLITION DETECTION
MOVE = 200
is_hit = false

function love.load ()
	orang = {
		x = 50,
		y = 400,
		img = love.graphics.newImage("orang.png")
	}
	
	box = {
		x = 200,
		y = 100,
		img = love.graphics.newImage("box.png")
	}
end

function love.draw ()
	love.graphics.draw(orang.img, orang.x, orang.y)
	love.graphics.draw(box.img, box.x, box.y)
	if is_hit == true then
		love.graphics.print("HIT", 400, 300)
	end
	
end

function love.update (dt)
	if love.keyboard.isDown('right') then
		orang.x = orang.x + MOVE*dt
	end
	if love.keyboard.isDown('left') then
		orang.x = orang.x - MOVE*dt
	end
	if love.keyboard.isDown('up') or love.keyboard.isDown('space') then
		orang.y = orang.y - MOVE*dt
	end
	if love.keyboard.isDown('down') then
		orang.y = orang.y + MOVE*dt
	end
	if love.keyboard.isDown('escape') then
		love.event.quit(0)
	end
	
	-- check if collide
	if is_hit == false then
		is_hit = CheckCollision (orang.x, orang.y, orang.img:getWidth(), orang.img:getHeight(), box.x, box.y, box.img:getWidth(), box.img:getHeight())
	end
end


function CheckCollision (x1,y1,w1,h1, x2,y2,w2,h2)
	return x1 < x2+w2 and
		x2 < x1+w1 and
		y1 < y2+h2 and
		y2 < y1+h1
end
]]


--[[
-- GRAVITY
GRAVITY = 100
is_hit = false

function love.load ()	
	box = {
		x = 200,
		y = 0,
		img = love.graphics.newImage("box.png")
	}
	rect = {
		x = 10,
		y = 500,
		w = 500,
		h = 20
	}
end

function love.draw ()
	love.graphics.draw(box.img, box.x, box.y)
	love.graphics.rectangle("fill", rect.x, rect.y, rect.w, rect.h)
	if is_hit == true then
		love.graphics.print("HIT", 400, 300)
	end
end

function love.update (dt)
	if is_hit == false then
		AddGravity(box, 200*dt)
		is_hit = CheckCollision (box.x, box.y, box.img:getWidth(), box.img:getHeight(), rect.x, rect.y, rect.w, rect.h)
	end
end

function AddGravity (obj1, g)
	obj1.y = obj1.y + g
end

function CheckCollision (x1,y1,w1,h1, x2,y2,w2,h2)
	return x1 < x2+w2 and
		x2 < x1+w1 and
		y1 < y2+h2 and
		y2 < y1+h1
	end
]]

--[[
-- MULTI TOUCH
tid = nil
touch_max = 0

function love.load ()
	
end

function love.draw ()
	--love.graphics.circle("fill", cx, cy, 50)
	
	
	
	love.graphics.print("Current Touches: " .. #tid, 0, 0)
	love.graphics.print("Maximum Touches: " .. touch_max, 0, 20)
	
	for _,id in pairs(tid) do
		local x, y = love.touch.getPosition(id)
		love.graphics.circle("fill", x, y, 50)
	end
end

function love.update (dt)
	tid = love.touch.getTouches()
	if touch_max < #tid then touch_max = #tid end
end

function love.mousepressed (x, y, button, isTouch )

end

function love.mousemoved (x, y, dx, dy)

end

function love.touchpressed (id, x, y, dx, dy, pressure)

end

function love.touchreleased (id, x, y, dx, dy, pressure)
	
end

function love.touchmoved (id, x, y, dx, dy, pressure)

end
]]


--[[

-- VIRTUAL D-PAD

PAD_CLICK = 0

function love.load ()
	pad1 = love.graphics.newImage("pad.png")
	pad2 = love.graphics.newImage("pad.png")
	pad3 = love.graphics.newImage("pad.png")
	pad4 = love.graphics.newImage("pad.png")
	pad5 = love.graphics.newImage("pad.png")
end

function love.draw ()
	
	love.graphics.draw(pad1, 40, 460)
	love.graphics.draw(pad2, 80, 420)
	love.graphics.draw(pad3, 80, 500)
	love.graphics.draw(pad4, 120, 460)
	love.graphics.draw(pad5, 600, 460)
	
	if PAD_CLICK == 1 then
		love.graphics.print("PAD 1 clicked", 0, 0)
	end
	if PAD_CLICK == 2 then
		love.graphics.print("PAD 2 clicked", 0, 0)
	end
	if PAD_CLICK == 3 then
		love.graphics.print("PAD 3 clicked", 0, 0)
	end
	if PAD_CLICK == 4 then
		love.graphics.print("PAD 4 clicked", 0, 0)
	end
	if PAD_CLICK == 5 then
		love.graphics.print("PAD 5 clicked", 0, 0)
	end
end

function love.update (dt)
	if love.mouse.isDown(1) then
		if detect_click(pad1, 40, 460) then
			PAD_CLICK = 1
		end
		if detect_click(pad2, 80, 420) then
			PAD_CLICK = 2
		end
		if detect_click(pad3, 80, 500) then
			PAD_CLICK = 3
		end
		if detect_click(pad4, 120, 460) then
			PAD_CLICK = 4
		end
		if detect_click(pad5, 600, 460) then
			PAD_CLICK = 5
		end
	end
end


function detect_click (img, x, y)
	if love.mouse.isDown(1) == true and (love.mouse.getX() >= x and love.mouse.getX() <= x+img:getWidth() and 
		love.mouse.getY() >= y and love.mouse.getY() <= y+img:getHeight() ) then
		
		return true
	else
		return false
	end
end

]]

--[[
-- AUDIO (MP3, TRACKER) MODULE PLAYBACK
function love.load ()
	-- Keep in mind that, if you pass love.audio.newSource "static" as a second argument,
	-- the sound file will be expanded into memory, so if you load a 5MB compressed .ogg file that way,
	-- it would consume ~50MB RAM when fully decompressed. Consider not using "static" in such cases.
	
	snd1 = love.audio.newSource("UNREALPM.S3M", "static")
	
	--snd1:setVolume(0.9)	-- 90% of ordinary volume
	--snd1:setPitch(0.5)	-- one octave lower
	
	--love.audio.play(snd1)
	snd1:play()
	
	--snd1:seek(10.5)	-- seek to 10.5 seconds
	
	--snd1:pause()
	--snd1:resume()
	--snd1:rewind()
	--snd1:stop()
	
	--love.audio.pause() -- All audio
	--love.audio.resume()	-- All audio
	--love.audio.stop() -- All audio
	--love.audio.setVolume( volume ) -- Master volume
end

function love.draw ()
	
end

function love.update (dt)
	
end

]]


function love.load ()
	
end

function love.update (dt)
	
end


function love.draw ()
	
end





