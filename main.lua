
--[[
function love.load()
	splash = love.graphics.newImage("futuretech_logo.jpg")

	--sound = love.audio.newSource("JKT48 - River.mp3")
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

function love.keyreleased (key)
	if key == "escape" then
		love.event.quit()
	end
end
]]



--[[
-- PHYSICS BOX2D
function love.load ()
	love.physics.setMeter(64) --the height of a meter our worlds will be 64px
	world = love.physics.newWorld(0, 9.81*64, true) --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81
	
	objects = {} -- table to hold all our physical objects
	
	--let's create the ground
	objects.ground = {}
	objects.ground.body = love.physics.newBody(world, 650/2, 650-50/2) --remember, the shape (the rectangle we create next) anchors to the body from its center, so we have to move it to (650/2, 650-50/2)
	objects.ground.shape = love.physics.newRectangleShape(650, 50) --make a rectangle with a width of 650 and a height of 50
	objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape) --attach shape to body
	
	--let's create a BALL
	objects.ball = {}
	objects.ball.body = love.physics.newBody(world, 650/2, 650/2, "dynamic") --place the body in the center of the world and make it dynamic, so it can move around
	objects.ball.shape = love.physics.newCircleShape(20) --the ball's shape has a radius of 20
	objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape, 1) -- Attach fixture to body and give it a density of 1.
	--objects.ball.image = love.graphics.newImage("orang.png")
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

function love.draw ()
	love.graphics.setColor(72, 160, 14) -- set the drawing color to green for the ground
	love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints())) -- draw a "filled in" polygon using the ground's coordinates
	
	love.graphics.setColor(193, 47, 14) --set the drawing color to red for the ball
	--love.graphics.draw(objects.ball.image, objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.body:getAngle(),  1, 1, objects.ball.image:getWidth()/2, objects.ball.image:getHeight()/2)
	love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())
	
	love.graphics.setColor(50, 50, 50) -- set the drawing color to grey for the blocks
	love.graphics.polygon("fill", objects.block1.body:getWorldPoints(objects.block1.shape:getPoints()))
	love.graphics.polygon("fill", objects.block2.body:getWorldPoints(objects.block2.shape:getPoints()))
end
--]]


--[[
-- PLATFORMER JUMPING + GRAVITY
function love.load()
	-- Nice and organised
	player = {
		x = 0,
		y = 0,
		y_velocity = 0,
		jetpack_fuel = 0.5, -- Note: not an actual jetpack. Variable is the time (in seconds) you can hold spacebar and jump higher.
		jetpack_fuel_max = 0.5,
		image = love.graphics.newImage("[.png") -- Let's just re-use this sprite
	}
	
	gravity = 1000
	jump_height = 350
	
	winW, winH = love.graphics.getWidth(), love.graphics.getHeight() -- This is just so we can draw it in a fabulous manner
end
 
function love.draw()
	love.graphics.rectangle("fill", 0, winH / 2, winW, winH / 2)
	love.graphics.translate(winW / 2, winH / 2) -- You don't need to understand this
	
	love.graphics.draw(player.image, player.x, -player.y, 0, 1, 1, 64, 80) -- Trust me on the origin position. Just trust me
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
	
	snd1 = love.audio.newSource("nerve_intro2.xm")
	--snd1 = love.audio.newSource("nerve_intro2.xm", "static")
	
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


--[=[
-- SHADER LOVE GLSL
function love.load ()
	splash = love.graphics.newImage("futuretech_logo.jpg")
	orang = love.graphics.newImage("orang.png")
	myShader = love.graphics.newShader[[
		/*
		GLSL CHEATSHEET:
		vec4.r = red value range 0.0 - 1.0
		vec4.g = green value range 0.0 - 1.0
		vec4.b = bluevalue range 0.0 - 1.0
		vec4.a = alpha value range 0.0 - 1.0
		
		*/
		// no effect
		/*vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ) {
			vec4 pixel = Texel(texture, texture_coords);	//This is the current pixel color
			return pixel * color;
		}
		*/
		/*// red
		vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ) {
			return vec4(1.0,0.0,0.0,1.0);
		}
		*/
		/*// half red-blue texture_coords
		vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
			if(texture_coords.x > 0.5){
				return vec4(1.0,0.0,0.0,1.0);//red
			} else {
				return vec4(0.0,0.0,1.0,1.0);//blue
			}
		}
		*/
		/*// half red-blue screen_coords
		vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
			if(screen_coords.x > 400){
				return vec4(1.0,0.0,0.0,1.0);//red
			} else {
				return vec4(0.0,0.0,1.0,1.0);//blue
			}
		}
		*/
		/*// black & white 1
		vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
			vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
			number average = (pixel.r+pixel.b+pixel.g)/3.0;
			pixel.r = average;
			pixel.g = average;
			pixel.b = average;
			return pixel;
		}
		*/
		/*// black & white 2
		vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
			vec4 c = Texel(texture, texture_coords); // This reads a color from our texture at the coordinates LOVE gave us (0-1, 0-1)
			return vec4(vec3(1.0, 1.0, 1.0) * (max(c.r, max(c.g, c.b))), 1.0); // This just returns a white color that's modulated by the brightest color channel at the given pixel in the texture. Nothing too complex, and not exactly the prettiest way to do B&W :P
		}
		*/
		/*// gradual black & white
		vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
			vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
			number average = (pixel.r+pixel.b+pixel.g)/3.0;
			number factor = texture_coords.x;
			pixel.r = pixel.r + (average-pixel.r) * factor;
			pixel.g = pixel.g + (average-pixel.g) * factor;
			pixel.b = pixel.b + (average-pixel.b) * factor;
			return pixel;
		}
		*/
		/*// negative color
		vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
			vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
			pixel.r = 1-pixel.r;
			pixel.g = 1-pixel.g;
			pixel.b = 1-pixel.b;
			return pixel;
		}		
		*/
		/*// alpha
		vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
			vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
			pixel.a = 0.5;
			return pixel;
		}*/
		/*// psychedelic
		vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
			vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
			pixel.r = abs(0.6-pixel.r);
			pixel.g = abs(0.2-pixel.g);
			pixel.b = abs(0.4-pixel.b);
			return pixel;
		}*/
		// static TV noise (full)
		float rand2 ( vec2 p ) {
			// e^pi (Gelfond's constant)
			// 2^sqrt(2) (Gelfond–Schneider constant)
			vec2 r = vec2( 23.14069263277926, 2.665144142690225 );
			//return fract( cos( mod( 12345678., 256. * dot(p,r) ) ) ); // ver1
			return fract(cos(dot(p,r)) * 123456.); // ver2
		}
		float rand1 ( vec2 co) {
			return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
		}
		vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
			vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
			pixel.r = rand1(vec2(texture_coords.x, texture_coords.y));
			pixel.g = rand1(vec2(texture_coords.x, texture_coords.y));
			pixel.b = rand1(vec2(texture_coords.x, texture_coords.y));
			return pixel;
		}
		
		/*// static TV noise (partial)
		extern float factor = 1;
		extern float addPercent = 0.1;
		extern float clamp = 0.1;

		// from http://www.ozone3d.net/blogs/lab/20110427/glsl-random-generator/
		float rand(vec2 n){
			return 0.5 + 0.5 * fract(sin(dot(n.xy, vec2(12.9898, 78.233))) * 43758.5453);
		}

		vec4 effect(vec4 color, Image tex, vec2 tc, vec2 sc){
			float grey = 1 * rand(tc * factor);
			float clampedGrey = max(grey, clamp);
			vec4 noise = vec4(grey, grey, grey, 1);
			vec4 clampedNoise = vec4(clampedGrey, clampedGrey, clampedGrey, 1);
			return (Texel(tex, tc) * clampedNoise * (1 - addPercent) + noise * addPercent) * color;
		}
		*/
		
		
	]]
	
end

x = 0
y = 0
toggle = false
scale = 10

function love.draw ()
	love.graphics.draw(orang, 0, 0)
	love.graphics.setShader(myShader) --draw something here
	love.graphics.draw(splash, x, y)
	--love.graphics.draw(splash, -math.random()*240, -math.random()*120, 0, scale, scale)	-- use this to see TV noise effect
	love.graphics.setShader()
end

function love.update (dt)
	if x >= 100 then toggle = true end
	if x <= 0 then toggle = false end
	
	if x <= 100 and toggle == false then
		x = x + 3
	elseif x >= 0 and toggle == true then
		x = x - 3
	end
end
]=]


--[=[
-- SCREEN SHOOT
function love.load ()
	--splash = love.graphics.newImage("futuretech_logo.jpg")
	splash = love.graphics.newImage("white-4000x4000.png")
	myShader = love.graphics.newShader[[
		// static TV noise (full)
		float rand2 ( vec2 p ) {
			// e^pi (Gelfond's constant)
			// 2^sqrt(2) (Gelfond–Schneider constant)
			vec2 r = vec2( 23.14069263277926, 2.665144142690225 );
			//return fract( cos( mod( 12345678., 256. * dot(p,r) ) ) ); // ver1
			return fract(cos(dot(p,r)) * 123456.); // ver2
		}
		float rand1 ( vec2 co) {
			return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
		}
		vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
			vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
			pixel.r = rand1(vec2(texture_coords.x, texture_coords.y));
			pixel.g = rand1(vec2(texture_coords.x, texture_coords.y));
			pixel.b = rand1(vec2(texture_coords.x, texture_coords.y));
			return pixel;
		}
		
	]]
		
	--love.filesystem.setIdentity('screenshot_example')
	--love.window.setMode(4000, 4000)
end

x = 0
y = 0
toggle = false
scale = 1

function love.draw ()
	love.graphics.setShader(myShader) --draw something here
	love.graphics.draw(splash, x, y)
	love.graphics.draw(splash, -math.random()*240, -math.random()*120, 0, scale, scale)	-- use this to see TV noise effect
	love.graphics.setShader()
	
	
end

function love.update (dt)
	
end


function love.keypressed()
    local screenshot = love.graphics.newScreenshot()
    -- saved to %APPDATA% directory
    -- C:\Users\[USERNAME]\AppData\Roaming\LOVE\[Love2D Example]
    screenshot:encode('png', os.time() .. '.png')
end
--]=]


--[=[
-- PASS LUA VARIABLE TO GLSL
function love.load ()
	splash = love.graphics.newImage("futuretech_logo.jpg")
	orang = love.graphics.newImage("orang.png")
	myShader = love.graphics.newShader[[
		/*
		GLSL			LÖVE shader language
		float			number
		sampler2D		Image
		uniform			extern
		texture2D(tex, uv)	Texel(tex, uv)
		*/
		
		extern number var1, var2;		// DECLARE EXTERNAL VARIABLE
		
		vec4 effect (vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
			vec4 pixel = Texel(texture, texture_coords);	//This is the current pixel color
			pixel.r = var1;
			pixel.g = var2;
			pixel.b = 0;
			return pixel;
		}
		
		
		
		]]
	
	myShader:send("var1", 1)
	myShader:send("var2", 0.5)
end

x = 0
y = 0
toggle = false

function love.draw ()
	love.graphics.draw(orang, 0, 0)
	love.graphics.setShader(myShader) --draw something here
	love.graphics.draw(splash, x, y)
	love.graphics.setShader()
	
end

function love.update (dt)
	if x >= 100 then toggle = true end
	if x <= 0 then toggle = false end
	
	if x <= 100 and toggle == false then
		x = x + 3
	elseif x >= 0 and toggle == true then
		x = x - 3
	end
end
--]=]

--[[
-- THREAD

function love.load ()
	
end

function love.draw ()
	--love.graphics.print("start")

	--create a thread named worker running the code in thread.lua
	thread1 = love.thread.newThread("thread1.lua")
	--start the thread
	thread1:start()
	
	--love.graphics.print("end")
end

function love.update (dt)
	
end
--]]


--[[
-- IMAGE FORMAT SUPPORT 

--[=[
Pixelformer: Export to BMP with premultiplied alpha need to use with love.graphics.setBlendMode("alpha", "premultiplied")

-- BMP no alpha
BMP8 (8-bit, 256 color) uncompressed / RLE compressed, Pixelformer doesn't support RLE compression (use CorelPP or Photoshop instead)
BMP15 = R5:G5:B5
BMP16 = R5:G6:B5
BMP24 = R8:G8:B8

-- BMP with alpha
BMP16 = A1:R5:G5:B5 (1-bit alpha, ugly alpha blend support, only for sharp edge transparent images)
BMP16 = A4:R4:G4:B4 (4-bit alpha, good/medium alpha blend)
BMP32 = A8:R8:G8:B8 (8-bit alpha, best alpha blend)


]=]

scale = 1

function love.load ()
	img_png = love.graphics.newImage("su-avatar.png")	-- PNG32
	img_bmp = love.graphics.newImage("su-avatar.bmp")	-- BMP32 
	img_bmp_pa = love.graphics.newImage("su-avatar-premultiplied-alpha.bmp")	-- need to use love.graphics.setBlendMode("alpha", "premultiplied")
	img_tga = love.graphics.newImage("su-avatar.tga")	-- TGA also support premultiplied alpha
	img_jpg = love.graphics.newImage("su-avatar.jpg")	-- JPEG doesn't support alpha transparency
	--img_gif = love.graphics.newImage("su-avatar.gif")	-- GIF, TIFF not supported by Love2D 0.10.1
	
	love.graphics.setBackgroundColor(127, 127, 127)		-- gray background color
end

function love.draw ()
	love.graphics.setBlendMode("alpha")	-- this is the default
	love.graphics.draw(img_png, 50, 30, 0, scale, scale)
	love.graphics.draw(img_bmp, 50, 130, 0, scale, scale)
	
	love.graphics.setBlendMode("alpha", "premultiplied")	-- use premultiplied alpha
	love.graphics.draw(img_bmp_pa, 50, 230, 0, scale, scale)
	
	love.graphics.setBlendMode("alpha")
	love.graphics.draw(img_tga, 50, 330, 0, scale, scale)
	love.graphics.draw(img_jpg, 50, 430, 0, scale, scale)
	
	love.graphics.print("PNG32, BMP32, BMP32-PM, TGA, JPEG")
end

function love.update (dt)
	
end
]]



--[[
-- TV NOISE FROM TEXTURE

scale = 2

function love.load ()
	lotsanoiseimg = love.graphics.newImage("noise-1920x1080.png")
end

function love.draw ()
	love.graphics.setColor(255, 255, 255, 200)
	love.graphics.draw(lotsanoiseimg, -math.random()*240, -math.random()*120, 0, scale, scale)
end

function love.update (dt)
	
end
]]

--[[
-- TV NOISE USING SHADER GLSL
function love.load ()
	splash = love.graphics.newImage("futuretech_logo.jpg")
	tv_shader = love.graphics.newShader[=[
		// static TV noise (full)
		float rand2 ( vec2 p ) {
			// e^pi (Gelfond's constant)
			// 2^sqrt(2) (Gelfond–Schneider constant)
			vec2 r = vec2( 23.14069263277926, 2.665144142690225 );
			//return fract( cos( mod( 12345678., 256. * dot(p,r) ) ) ); // ver1
			return fract(cos(dot(p,r)) * 123456.); // ver2
		}
		float rand1 ( vec2 co) {
			return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
		}
		vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
			vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
			pixel.r = rand1(vec2(texture_coords.x, texture_coords.y));
			pixel.g = rand1(vec2(texture_coords.x, texture_coords.y));
			pixel.b = rand1(vec2(texture_coords.x, texture_coords.y));
			return pixel;
		}
		
		
	]=]
	
end

x = 0
y = 0
scale = 10

function love.draw ()
	love.graphics.setShader(tv_shader) --draw something here
	--love.graphics.draw(splash, x, y)
	love.graphics.draw(splash, -math.random()*240, -math.random()*120, 0, scale, scale)	-- use this to see TV noise effect
	love.graphics.setShader()
end

function love.update (dt)
	
end
]]


--[[
-- infinite rolling object
--screenWidth, screenHeight = love.graphics.getDimensions()
box1 = false

function love.load ()
	box_img = love.graphics.newImage("box.png")
end

function love.draw ()
	if box1 then
		love.graphics.draw(box_img, box1_x, 100)
	end
end

function love.update (dt)
	if box1 == false then
		box1_x = love.graphics.getWidth() + 100
		box1 = true
	end
	
	if box1 then
		box1_x = box1_x - 20
	end
	
	if box1_x <= -100 then
		box1 = false
	end
end
]]


--[[
-- CUSTOM LIGHTNING, THUNDERSTORM EFFECT

function love.load ()
	splash = love.graphics.newImage("futuretech_logo.jpg")
	half = love.graphics.newImage("half-transparent.png")
end

function love.draw ()
	love.graphics.draw(splash)
	if show_thunder == true then
		love.graphics.draw(half)
	end
end

x = 0
show_thunder = false

function love.update (dt)
	x = x + 5
	if x >= 100 and show_thunder == false then
		show_thunder = true
	elseif x >=200 and show_thunder == true then
		show_thunder = false
		x = 0
	end
end
]]

--[[
-- IMAGE SCALING
scale = 0.5
function love.load ()
	splash = love.graphics.newImage("futuretech_logo.jpg")
	
end

function love.draw ()
	love.graphics.draw(splash, 0, 0, 0, scale, scale)
	
end


function love.update (dt)
	
end
]]


--[[
-- PARALLAX SCROLLING & IMAGE SCALING
-- Note: love2d default scaling algorithm doen's work well & look ugly
x1 = 0
x2 = 0
x3 = 0
scale = 1.0

function love.load ()
	--love.graphics.setDefaultFilter('nearest', 'nearest')
	love.graphics.setDefaultFilter('linear', 'linear', 16)
	
	cloud1 = love.graphics.newImage("kitty/cloud1.png", {['mipmaps']=true})
	cloud2 = love.graphics.newImage("kitty/cloud2.png", {['mipmaps']=true})
	ground1 = love.graphics.newImage("kitty/ground1.png", {['mipmaps']=true})
	ground2 = love.graphics.newImage("kitty/ground2.png", {['mipmaps']=true})
	ground3 = love.graphics.newImage("kitty/ground3.png", {['mipmaps']=true})
	rock1 = love.graphics.newImage("kitty/rock1.png", {['mipmaps']=true})
	sky1 = love.graphics.newImage("kitty/sky1.png", {['mipmaps']=true})
	--
	ground1:setFilter('linear', 'linear', 16)
	ground2:setFilter('linear', 'linear', 16)
	ground3:setFilter('linear', 'linear', 16)
	rock1:setFilter('linear', 'linear', 16)
	
	--
	cloud1:setMipmapFilter("linear", 0)
	cloud2:setMipmapFilter("linear", 0)
	ground1:setMipmapFilter("linear", 0)
	ground2:setMipmapFilter("linear", 0)
	ground3:setMipmapFilter("linear", 0)
	rock1:setMipmapFilter("linear", 0)
	sky1:setMipmapFilter("linear", 0)
	
	--[=[
	cloud1:setMipmapFilter("nearest")
	cloud2:setMipmapFilter("nearest")
	ground1:setMipmapFilter("nearest")
	ground2:setMipmapFilter("nearest")
	ground3:setMipmapFilter("nearest")
	rock1:setMipmapFilter("nearest")
	sky1:setMipmapFilter("nearest")
	]=]
end

function love.draw ()
	
	love.graphics.scale(scale, scale)
	--
	love.graphics.draw(sky1)
	--
	love.graphics.draw(rock1, x2, 160)
	love.graphics.draw(rock1, (x2+800), 160)
	--
	love.graphics.draw(cloud1, (x3+40), 10)
	love.graphics.draw(cloud2, (x3+400), 40)
	
	love.graphics.draw(cloud1, (x3+40+800), 10)
	love.graphics.draw(cloud2, (x3+400+800), 40)
	--
	love.graphics.draw(ground1, x1, 336)
	love.graphics.draw(ground3, x1, 400)
	love.graphics.draw(ground2, x1, 450)
	
	love.graphics.draw(ground1, (x1+800), 336)
	love.graphics.draw(ground3, (x1+800), 400)
	love.graphics.draw(ground2, (x1+800), 450)
end

function love.update (dt)
	if love.keyboard.isDown('escape') then
		love.event.quit(0)
	end
	
	if x1 < -800 then
		x1 = 0
	else
		x1 = x1 - 6
	end
	
	if x2 < -800 then
		x2 = 0
	else
		x2 = x2 - 1.1
	end
	
	if x3 < -800 then
		x3 = 0
	else
		x3 = x3 - 0.2
	end
end
]]


--[[
-- LOAD MULTIPLE SPRITE FROM ONE IMAGE FOR ANIMATION

scale = 5

function love.load ()
	char1 = love.graphics.newImage("trosh.png")
	quad_stand = love.graphics.newQuad(0, 0, 14, 24, char1:getWidth(), char1:getHeight())
	quad_walk = love.graphics.newQuad(14, 0, 14, 24, char1:getWidth(), char1:getHeight())
end

function love.draw ()
	
	love.graphics.draw(char1, quad_stand, 0, 0, 0, scale, scale)
	love.graphics.draw(char1, quad_walk, 0, 200, 0, scale, scale)
end


function love.update (dt)
	
end
]]

--[[
-- SPRITE SHEET ANIMATION

scale = 5
frames = {}
currentFrame = 1
elapsedTime = 0
totalFrame = 2

function love.load ()
	char1 = love.graphics.newImage("trosh.png")
	frames[1] = love.graphics.newQuad(0, 0, 14, 24, char1:getWidth(), char1:getHeight())
	frames[2] = love.graphics.newQuad(14, 0, 14, 24, char1:getWidth(), char1:getHeight())
	activeFrame = frames[currentFrame]
end

function love.draw ()
	love.graphics.draw(char1, activeFrame, 0, 0, 0, scale, scale)
	
end


function love.update (dt)
	elapsedTime = elapsedTime + dt
	
	if (elapsedTime > 0.1) then
		if (currentFrame < totalFrame) then
			currentFrame = currentFrame + 1
		else
			currentFrame = 1
		end
		activeFrame = frames[currentFrame]
		elapsedTime = 0
	end
end
]]

--[[
-- SPRITE SHEET ANIMATION + KEYBOARD INPUT + GRAVITY

scale = 5
frames = {}
currentFrame = 1
elapsedTime = 0
totalFrame = 2
x = 200
y = 400

y_ground = y
speed = 400

y_velocity = 0
jetpack_fuel = 0.5	-- Note: not an actual jetpack. Variable is the time (in seconds) you can hold spacebar and jump higher.
jetpack_fuel_max = 1

gravity = 1000
jump_height = 500

jump = false

function love.load ()
	height500 = love.graphics.newImage("height-500px.png")
	char1 = love.graphics.newImage("trosh.png")		-- SPRITE SHEET 
	frames[1] = love.graphics.newQuad(0, 0, 14, 24, char1:getWidth(), char1:getHeight())		-- SPRITE SEPARATION 
	frames[2] = love.graphics.newQuad(14, 0, 14, 24, char1:getWidth(), char1:getHeight())
	activeFrame = frames[currentFrame]
end

function love.draw ()
	love.graphics.draw(height500, 50, 50)
	love.graphics.draw(char1, activeFrame, x, y, 0, scale, scale)
	if y == y_ground then
		love.graphics.print("OK")
	end
	love.graphics.print("\nOK")
	--love.graphics.print("y: " .. y)
	--love.graphics.print("\ny_ground: " .. y_ground)
end


function love.update (dt)
	elapsedTime = elapsedTime + dt
	
	if (elapsedTime > 0.3) then
		if (currentFrame < totalFrame) then
			currentFrame = currentFrame + 1
		else
			currentFrame = 1
		end
		activeFrame = frames[currentFrame]
		elapsedTime = 0
	end
	
	if love.keyboard.isDown("right") then
		x = x + speed*dt
	end
	if love.keyboard.isDown("left") then
		x = x - speed*dt
	end
	
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
	
	
	-- JUMP
	if love.keyboard.isDown("up") then
		if y_velocity == 0 then -- We're probably on the ground, let's jump
			y_velocity = jump_height
		end
	end
	
	--if jetpack_fuel > 0 then -- We can still move upwards and we're actually holding space
	--	jetpack_fuel = jetpack_fuel - dt -- Decrease the fuel meter
		y_velocity = y_velocity + jump_height * (dt / jetpack_fuel_max)
	--end
	
	if y_velocity ~= 0 then -- we're probably jumping
		y = y - y_velocity * dt -- "dt" means we wont move at different speeds if the game lags
		y_velocity = y_velocity - gravity * dt
		
		-- We hit the ground again
		if y > y_ground then
			y_velocity = 0
			y = y_ground
		end
	end
	
	
	
end
]]

--[[
-- WAIT JUMPING UNTIL THE BUTTON IS RELEASED + LINEAR GRAVITY (FAKE)
x = 400
y_ground = 400
y = y_ground
jump_height = 100 -- px
jump = false
go_down = false

function love.load ()
	orang = love.graphics.newImage("orang.png")
end

function love.draw ()
	love.graphics.draw(orang, x, y, 0, 1, 1)
	--if go_down then love.graphics.print("OK") end
end

function love.update (dt)
	if love.keyboard.isDown("space") then
		if not jump then
			jump = true
		end
	end
	
	if jump then
		if not go_down and y_ground-y <= jump_height then
			y = y - 5
		elseif not go_down and not (y_ground-y <= jump_height) then
			go_down = true
		elseif go_down and (y_ground-y) >= 0 then
			y = y + 5
		elseif not love.keyboard.isDown("space") then
			go_down = false
			jump = false
		end
	end
	
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end
]]

--[[
-- WAIT JUMPING UNTIL THE BUTTON IS RELEASED + REAL GRAVITY
x = 400
y_ground = 400
y = y_ground

jump_height = 800 -- px
jump = false
go_down = false

y_velocity = 0
gravity = 2000

function love.load ()
	orang = love.graphics.newImage("orang.png")
end

function love.draw ()
	love.graphics.draw(orang, x, y)
	--if go_down then love.graphics.print("OK") end
end

function love.update (dt)
	if love.keyboard.isDown("space") then
		if not jump then
			jump = true
			y_velocity = jump_height
		end
	end
	
	if jump then
		y = y - y_velocity*dt
		y_velocity = y_velocity - gravity*dt
		if y >= y_ground then
			y = y_ground
			if not love.keyboard.isDown("space") then
				jump = false
			end
		end
	
	end
	
	
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end
]]

--[[
-- FONT TRUETYPE (.TTF) LOADING

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
-- BITMAP FONT
function love.load ()
	font = love.graphics.newImageFont('font 2.png', ' ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789')
end

function love.draw ()
	love.graphics.setFont(font)
	love.graphics.print('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789', 16, 16)
	love.graphics.print('Text is now drawn using the font', 16, 32)
end

function love.update (dt)

end
]]


--[[
-- LOAD & PLAY VIDEO (.OGV only)
function love.load ()
	video = love.graphics.newVideo("Kamen Joshi - GENKIDANE.ogv")
	video:play()
end

function love.draw ()
	love.graphics.draw(video, 0, 0)
end

function love.update (dt)

end
]]


--[[
-- MOVE COLLIDER  (RECTANGULAR COLLISION)
function love.load()
	crate = {
		x = 150,
		y = 311,
		w = 100,
		h = 100,
		img = love.graphics.newImage("crate.fw.png"),
	}
	player = {
		x = 300,
		y = 0,
		w = 80,
		h = 80,
		img = love.graphics.newImage("box.png"),
	}
	
	
	platform = {
		x = 500,
		y = 270,
		w = 200,
		h = 30,
		img = love.graphics.newImage("platform.fw.png"),
	}
	
	
end

function love.draw()	
	love.graphics.draw(platform.img, platform.x, platform.y)
	love.graphics.draw(crate.img, crate.x, crate.y)
	love.graphics.draw(player.img, player.x, player.y)
	
end

function love.update (dt)
	p_speed = 10
	
	if love.keyboard.isDown("right") and love.keyboard.isDown("down") then
		MoveCollide(   {player,p_speed,p_speed},  {crate, platform}  )
	elseif love.keyboard.isDown("right") and love.keyboard.isDown("up") then
		MoveCollide(   {player,p_speed,-p_speed},  {crate, platform}  )
	elseif love.keyboard.isDown("left") and love.keyboard.isDown("down") then
		MoveCollide(   {player,-p_speed,p_speed},  {crate, platform}  )
	elseif love.keyboard.isDown("left") and love.keyboard.isDown("up") then
		MoveCollide(   {player,-p_speed,-p_speed},  {crate, platform}  )
	elseif love.keyboard.isDown("down") then
		MoveCollide(   {player,0,p_speed},  {crate, platform}  )
	elseif love.keyboard.isDown("up") then
		MoveCollide(   {player,0,-p_speed},  {crate, platform}  )
	elseif love.keyboard.isDown("right") then
		MoveCollide(   {player,p_speed,0},  {crate, platform}  )
	elseif love.keyboard.isDown("left") then
		MoveCollide(   {player,-p_speed,0},  {crate, platform}  )
	end
	
	
	
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end

-- only can check rectangular collider
function CheckCollision (x1,y1,w1,h1, x2,y2,w2,h2)
	return x1 < x2+w2 and
		x2 < x1+w1 and
		y1 < y2+h2 and
		y2 < y1+h1
end


-- arg: p={player, x_player_speed, y_player_speed},  q={objects_to_collide, ...} 
function MoveCollide (p, q)
	result1 = true
	result2 = true
	
	for i=1,#q do
		if CheckCollision (p[1].x, p[1].y, p[1].w, p[1].h,    q[i].x, q[i].y, q[i].w, q[i].h) then
			result1 = false
			break
		end
		if CheckCollision (p[1].x+p[2], p[1].y+p[3], p[1].w, p[1].h,    q[i].x, q[i].y, q[i].w, q[i].h) then
			result2 = false
			t = q[i]
			break
		end
	end
	
	if result1 and result2 then
		p[1].x = p[1].x + p[2]
		p[1].y = p[1].y + p[3]
		return false	-- not hit
		
	elseif result1 and not result2 then
	
		if p[2] > 0 and p[3] > 0 then	-- right & down
			if p[1].y+p[1].h <= t.y then
				p[1].x = p[1].x + p[2]
				p[1].y = t.y - p[1].h
			else
				p[1].x = t.x - p[1].w
				p[1].y = p[1].y + p[3]
			end
		elseif p[2] > 0 and p[3] < 0 then	-- right & up
			if p[1].y >= t.y+t.h then
				p[1].x = p[1].x + p[2]
				p[1].y = t.y + t.h
			else
				p[1].x = t.x - p[1].w
				p[1].y = p[1].y + p[3]
			end
		elseif p[2] < 0 and p[3] > 0 then	-- left & down
			if p[1].y+p[1].h <= t.y then
				p[1].x = p[1].x + p[2]
				p[1].y = t.y - p[1].h
			else
				p[1].x = t.x + t.w
				p[1].y = p[1].y + p[3]
			end
		elseif p[2] < 0 and p[3] < 0 then	-- left & up
			if p[1].y >= t.y+t.h then
				p[1].x = p[1].x + p[2]
				p[1].y = t.y + t.h
			else
				p[1].x = t.x + t.w
				p[1].y = p[1].y + p[3]
			end
		elseif p[3] > 0 then		--  down
			p[1].y = t.y - p[1].h
		elseif p[3] < 0 then		-- up
			p[1].y = t.y + t.h
		elseif p[2] < 0 then		-- left
			p[1].x = t.x + t.w
		elseif p[2] > 0 then		-- right
			p[1].x = t.x - p[1].w
		end
		
		return true	-- collide with other object
	end
	
	
end
]]




jumping = false
touch_ground = false

JUMP_HEIGHT = 100



-- PLATFORMER EXAMPLE (RECTANGULAR COLLISION, GRAVITY, KEYBOARD MOVEMENT)
function love.load()
	crate = {
		x = 50,
		y = 311,
		w = 100,
		h = 100,
		type = 'RECT',
		img = love.graphics.newImage("crate.fw.png"),
	}
	player = {
		x = 300,
		y = 0,
		w = 21,
		h = 75,
		type = 'RECT',
		img = love.graphics.newImage("player.fw.png"),
	}
	
	ground = {
		x = 0,
		y = 400,
		w = 800,
		h = 200,
		type = 'GROUND',
		img = love.graphics.newImage("ground.fw.png"),
	}
	
	platform = {
		x = 500,
		y = 270,
		w = 200,
		h = 30,
		type = 'PLATFORM',
		img = love.graphics.newImage("platform.fw.png"),
	}
	
	triangle = {
		x = 400,
		y = 400,
		w = 194,
		h = 167,
		type = 'POLY',
		--points = { {x=0,y=167}, {x=194,y=167}, {x=97,y=0} },
		points = { {x=0+400,y=167+400}, {x=194+400,y=167+400}, {x=97+400,y=0+400} },
		img = love.graphics.newImage("triangle.fw.png"),
	}
	
	sky = love.graphics.newImage("sky.fw.png")
	--sound = love.audio.newSource("JKT48 - River.mp3")
	--love.audio.play(sound)
	
    
end

function love.draw()
	love.graphics.draw(sky, 0, 0)
	love.graphics.draw(ground.img, ground.x, ground.y)
	
	love.graphics.draw(platform.img, platform.x, platform.y)
	love.graphics.draw(crate.img, crate.x, crate.y)
	love.graphics.draw(triangle.img, triangle.x, triangle.y)
	love.graphics.draw(player.img, player.x, player.y)
	if not result1 then love.graphics.print("not result1") end
	if not result2 then love.graphics.print("not result2", 0, 50) end
	love.graphics.print(debug_str, 0, 100)
	--love.graphics.print(b, 0, 50)
	
end


function love.update (dt)
	p_speed = 7
	obj_collide = {crate, platform, triangle, ground}
	
	AddGravity(player, obj_collide)
	IsGround(player, obj_collide)
	IsJumping(player, obj_collide)
	
	--[[if love.keyboard.isDown("right") and love.keyboard.isDown("down") then
		MoveCollide(   player,p_speed,p_speed,  obj_collide  )
	elseif love.keyboard.isDown("right") and love.keyboard.isDown("up") then
		MoveCollide(   player,p_speed,-p_speed,  obj_collide  )
	elseif love.keyboard.isDown("left") and love.keyboard.isDown("down") then
		MoveCollide(   player,-p_speed,p_speed,  obj_collide  )
	elseif love.keyboard.isDown("left") and love.keyboard.isDown("up") then
		MoveCollide(   player,-p_speed,-p_speed,  obj_collide  )
	elseif love.keyboard.isDown("down") then]]
	if love.keyboard.isDown("down") then
		MoveCollide(   player,0,p_speed,  obj_collide  )
	elseif love.keyboard.isDown("up") then
		--MoveCollide(   player,0,-p_speed,  obj_collide  )
		if not jumping and touch_ground then
			AddJump(player, obj_collide)
		end
	elseif love.keyboard.isDown("right") then
		MoveCollide(   player,p_speed,0,  obj_collide  )
	elseif love.keyboard.isDown("left") then
		MoveCollide(   player,-p_speed,0,  obj_collide  )
	end
	
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end
--[[
-- check whether two rectangular objects overlap
function checkCollisionRectangle (x1,y1,w1,h1, x2,y2,w2,h2)
	return x1 < x2+w2 and
		x2 < x1+w1 and
		y1 < y2+h2 and
		y2 < y1+h1
end
]]
-- ax, ay = circleA's center coordinates; bx, by = circleB's center coordinates; ar, br = circleA's and circleB's radii, respectively. 
function checkCollisionCircular (ax, ay, bx, by, ar, br)
	local dx = bx - ax
	local dy = by - ay
	return dx^2 + dy^2 < (ar + br)^2
end



-- return false if not hit & return table with 2 points (line) if hit
function CollisionPolygon (p, q)
	local r = false
	local i, a, b, c
	local y_cmp1, y_cmp2
	
	for i=1, #q do
		a = i
		b = i+1
		c = i+2
		if i == #q-1 then
			c = 1
		elseif i == #q then
			b = 1
			c = 2
		end
		
		if q[a].x == q[b].x then
			--print (111)
			if q[a].x > q[c].x and q[a].x <= p.x then
				return false
				--return { {x=q[a].x, y=q[a].y},  {x=q[b].x, y=q[b].y} }
			elseif q[a].x < q[c].x and q[a].x >= p.x then
				return false
				--return { {x=q[a].x, y=q[a].y},  {x=q[b].x, y=q[b].y} }
			end
		elseif q[a].y == q[b].y then
			--print (222)
			if q[a].y > q[c].y and q[a].y <= p.y then
				return false
				--return { {x=q[a].x, y=q[a].y},  {x=q[b].x, y=q[b].y} }
			elseif q[a].y < q[c].y and q[a].y >= p.y then
				return false
				--return { {x=q[a].x, y=q[a].y},  {x=q[b].x, y=q[b].y} }
			end
			
		else
			print (333)
			--print (p.x, p.y, '|', q[a].x, q[a].y)
			-- y = (x-x1)/(x2-x1) * (y2-y1) + y1
			y_cmp1 = (q[c].x-q[a].x)/(q[b].x-q[a].x) * (q[b].y-q[a].y) + q[a].y
			y_cmp2 = (p.x    -q[a].x)/(q[b].x-q[a].x) * (q[b].y-q[a].y) + q[a].y
			--print (q[a].x, q[a].y, q[b].x, q[b].y)
			if y_cmp1 < q[c].y and y_cmp2 >= p.y then
				return false
				--return { {x=q[a].x, y=q[a].y},  {x=q[b].x, y=q[b].y} }
			elseif y_cmp1 > q[c].y and y_cmp2 <= p.y then
				return false
				--print (y_cmp1, q[c].y)
				--print (y_cmp2, p.y)
				--return { {x=q[a].x, y=q[a].y},  {x=q[b].x, y=q[b].y} }
			end
		end
		
	end		-- for
	
	return true	-- hit
end

result1 = true
result2 = true
debug_str = ""

function CollisionRectangle (p1, p2, q1, q2)
	local r
	r = CollisionPolygon ( {x=p1.x,y=p1.y}, {{x=q1.x,y=q1.y}, {x=q2.x,y=q1.y}, {x=q2.x,y=q2.y}, {x=q1.x,y=q2.y}}  )
	if r ~= false then return r end
	r = CollisionPolygon ( {x=p1.x,y=p2.y}, {{x=q1.x,y=q1.y}, {x=q2.x,y=q1.y}, {x=q2.x,y=q2.y}, {x=q1.x,y=q2.y}}  )
	if r ~= false then return r end
	r = CollisionPolygon ( {x=p2.x,y=p1.y}, {{x=q1.x,y=q1.y}, {x=q2.x,y=q1.y}, {x=q2.x,y=q2.y}, {x=q1.x,y=q2.y}}  )
	if r ~= false then return r end
	r = CollisionPolygon ( {x=p2.x,y=p2.y}, {{x=q1.x,y=q1.y}, {x=q2.x,y=q1.y}, {x=q2.x,y=q2.y}, {x=q1.x,y=q2.y}}  )
	if r ~= false then return r end
	--
	-- swap to check if the first rectangle is smaller
	r = CollisionPolygon ( {x=q1.x,y=q1.y}, {{x=p1.x,y=p1.y}, {x=p2.x,y=p1.y}, {x=p2.x,y=p2.y}, {x=p1.x,y=p2.y}}  )
	if r ~= false then return r end
	r = CollisionPolygon ( {x=q1.x,y=q2.y}, {{x=p1.x,y=p1.y}, {x=p2.x,y=p1.y}, {x=p2.x,y=p2.y}, {x=p1.x,y=p2.y}}  )
	if r ~= false then return r end
	r = CollisionPolygon ( {x=q2.x,y=q1.y}, {{x=p1.x,y=p1.y}, {x=p2.x,y=p1.y}, {x=p2.x,y=p2.y}, {x=p1.x,y=p2.y}}  )
	if r ~= false then return r end
	r = CollisionPolygon ( {x=q2.x,y=q2.y}, {{x=p1.x,y=p1.y}, {x=p2.x,y=p1.y}, {x=p2.x,y=p2.y}, {x=p1.x,y=p2.y}}  )
	if r ~= false then return r end
	
	return r
end


-- arg: ( player_object, x_move, y_move, other_object_to_collide )
function MoveCollide (p, xm, ym, q)
	local result1 = true
	local result2 = true
	debug_str = ''
	
	for i=1,#q do
		--if checkCollisionRectangle (p.x, p.y, p.w, p.h,    q[i].x, q[i].y, q[i].w, q[i].h) then
		--z = CollisionRectangle ({x=p.x, y=p.y}, {x=p.w, y=p.h}, {x=q[i].x, y=q[i].y}, {x=q[i].w, y=q[i].h})
		--print (z)
		if q[i].type == 'RECT' or q[i].type == 'GROUND' then
			if CollisionRectangle ({x=p.x, y=p.y}, {x=p.x+p.w, y=p.y+p.h}, {x=q[i].x, y=q[i].y}, {x=q[i].x+q[i].w, y=q[i].y+q[i].h}) then
				--print (111)
				result1 = false
				break
			end
			--if checkCollisionRectangle (p.x+xm, p.y+ym, p.w+xm, p.h+ym,    q[i].x, q[i].y, q[i].w, q[i].h) then
			if CollisionRectangle ({x=p.x+xm, y=p.y+ym}, {x=p.x+p.w+xm, y=p.y+p.h+ym}, {x=q[i].x, y=q[i].y}, {x=q[i].x+q[i].w, y=q[i].y+q[i].h}) then
				--print (222)
				result2 = false
				t = q[i]
				break
			end
		elseif q[i].type == 'GROUND' then
			--[[
			if CollisionPolygon ({x=p.x, y=p.y}, q[i].points) then
				--print (q[i].points)
				debug_str = 'POLY'
				result1 = false
				--t = q[i]
				break
			end
			]]
		end
	end
	
	
	
	--print (result1, result2)
	--
	if result1 and result2 then
		--print (444)
		p.x = p.x + xm
		p.y = p.y + ym
		return false	-- not hit
		
	elseif result1 and not result2 then
		--
		if xm > 0 and ym > 0 then	-- right & down
			if p.y+p.h <= t.y then
				p.x = p.x + xm
				p.y = t.y - p.h
				--p.x = p.x + (p.y+ym+p.h - (p.y+p.h)) / ym * xm
				
			else
				p.x = t.x - p.w
				p.y = p.y + ym
				--p.y = p.y + (p.y+ym+p.h - (p.y+p.h)) / xm * ym
			end
		elseif xm > 0 and ym < 0 then	-- right & up
			if p.y >= t.y+t.h then
				p.x = p.x + xm
				p.y = t.y + t.h
				--p.x = p.x + (p.y+ym+p.h - (p.y+p.h)) / ym * xm
			else
				p.x = t.x - p.w
				p.y = p.y + ym
				--p.y = p.y - (p.y+ym+p.h - (p.y+p.h)) / xm * ym
			end
		elseif xm < 0 and ym > 0 then	-- left & down
			if p.y+p.h <= t.y then
				p.x = p.x + xm
				p.y = t.y - p.h
				--p.x = p.x + (p.y+ym+p.h - (p.y+p.h)) / ym * xm
			else
				p.x = t.x + t.w
				p.y = p.y + ym
				--p.y = p.y - (p.y+ym+p.h - (p.y+p.h)) / xm * ym
			end
		elseif xm < 0 and ym < 0 then	-- left & up
			if p.y >= t.y+t.h then
				p.x = p.x + xm
				p.y = t.y + t.h
				--p.x = p.x + (p.y+ym+p.h - (p.y+p.h)) / ym * xm
			else
				p.x = t.x + t.w
				p.y = p.y + ym
				--p.y = p.y + (p.y+ym+p.h - (p.y+p.h)) / xm * ym
			end
		elseif ym > 0 then		--  down
			p.y = t.y - p.h
		elseif ym < 0 then		-- up
			p.y = t.y + t.h
		elseif xm < 0 then		-- left
			p.x = t.x + t.w
		elseif xm > 0 then		-- right
			p.x = t.x - p.w
		end
		
		return true	-- collide with other object
	else
		return false	-- result1 & result 2 == false
	end
	
end


function AddGravity (mov_obj, static_obj)
	if not jumping then
		MoveCollide(mov_obj, 0, 5, static_obj)
	end
end

function AddJump (mov_obj, static_obj)
	jumping = true
	jump_height = JUMP_HEIGHT
end

function IsJumping (mov_obj, static_obj)
	if jumping and jump_height > 0 then
		jump_height = jump_height - 10
		MoveCollide(mov_obj, 0, -10, static_obj)
	else
		jumping = false
	end
end


