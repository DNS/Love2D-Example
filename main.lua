
--[[
-- PLAY AUDIO .MP3
function love.load()
	splash = love.graphics.newImage("futuretech_logo.jpg")

	sound = love.audio.newSource("JKT48 - River.mp3")
	love.audio.play(sound)
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
-- RESIZE WINDOW

function love.resize ()

end


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
		image = love.graphics.newImage("orang.png") -- Let's just re-use this sprite
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
--[[
GLSL              | Effect language     | Comment
------------------+---------------------+--------------------------------------
float             | number              |
sampler2D         | Image               | LÖVE only supports 2D textures anyway
uniform           | extern              | less technical term
texture2D(tex,st) | Texel(tex,st)       | `tex' is an image, `st' is a vec2
]]
function love.load ()
	--splash = love.graphics.newImage("futuretech_logo.jpg")
	splash = love.graphics.newImage("F-91W ammo.jpg")
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
		/*// static TV noise (full)
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
		}*/
		
		// static TV noise (partial)
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
		
		
			
			
			
	]]

end

x = 0
y = 0
toggle = false
scale = 2

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

Supported image file format: BMP, TGA, PNG, JPEG

]=]

scale = 1

function love.load ()
	img_png = love.graphics.newImage("su-avatar.png")	-- PNG32
	img_bmp = love.graphics.newImage("su-avatar.bmp")	-- BMP32 
	img_bmp_pa = love.graphics.newImage("su-avatar-premultiplied-alpha.bmp")	-- need to use love.graphics.setBlendMode("alpha", "premultiplied")
	img_tga = love.graphics.newImage("su-avatar.tga")	-- TGA also support premultiplied alpha
	img_jpg = love.graphics.newImage("su-avatar.jpg")	-- JPEG doesn't support alpha transparency
	--img_gif = love.graphics.newImage("su-avatar.gif")	-- GIF, TIFF not supported by Love2D > 0.10.x
	
	love.graphics.setBackgroundColor(255, 0, 127)		-- background color
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
	love.graphics.draw(char1, activeFrame, 0, 100, 0, scale, scale)
	
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
debug_str = ""
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
	
	love.graphics.print(debug_str)
end

function love.update (dt)
	p_speed = 10
	debug_str = ""
	
	if love.keyboard.isDown("right") and love.keyboard.isDown("down") then
		MoveCollideRect(   {player,p_speed,p_speed},  {crate, platform}  )
	elseif love.keyboard.isDown("right") and love.keyboard.isDown("up") then
		MoveCollideRect(   {player,p_speed,-p_speed},  {crate, platform}  )
	elseif love.keyboard.isDown("left") and love.keyboard.isDown("down") then
		MoveCollideRect(   {player,-p_speed,p_speed},  {crate, platform}  )
	elseif love.keyboard.isDown("left") and love.keyboard.isDown("up") then
		MoveCollideRect(   {player,-p_speed,-p_speed},  {crate, platform}  )
	elseif love.keyboard.isDown("down") then
		MoveCollideRect(   {player,0,p_speed},  {crate, platform}  )
	elseif love.keyboard.isDown("up") then
		MoveCollideRect(   {player,0,-p_speed},  {crate, platform}  )
	elseif love.keyboard.isDown("right") then
		MoveCollideRect(   {player,p_speed,0},  {crate, platform}  )
	elseif love.keyboard.isDown("left") then
		MoveCollideRect(   {player,-p_speed,0},  {crate, platform}  )
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
function MoveCollideRect (p, q)
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
		debug_str = "HIT"
		return true	-- collide with other object
	end
	
	
end

]]


--[[

-- PLATFORMER EXAMPLE (RECTANGULAR COLLISION, GRAVITY, KEYBOARD MOVEMENT)
jumping = false
up_key_enable = false
plat_move_right = true
on_ladder = false

p_speed = 200
g_speed = 0
g_accel = 1		-- gravity/fall speed

function love.load ()
	crate = {
		x = 350,
		y = 300,
		w = 100,
		h = 100,
		type = 'DYNAMIC',
		movable = 5,
		img = love.graphics.newImage("crate.fw.png"),
	}
	player = {
		x = 300,
		y = 0,
		w = 21,
		h = 75,
		type = 'DYNAMIC',
		movable = 10,
		img = love.graphics.newImage("player.fw.png"),
	}
	
	ground = {
		x = 0,
		y = 400,
		w = 800,
		h = 200,
		type = 'STATIC',
		movable = 0,	-- STATIC don't need "movable" to be set
		img = love.graphics.newImage("ground.fw.png"),
	}
	
	moving_platform = {
		x = 500,
		y = 270,
		w = 200,
		h = 30,
		type = 'PLATFORM',
		movable = 50,
		img = love.graphics.newImage("platform.fw.png"),
	}
	
	platform1 = {
		x = 194,
		y = 150,
		w = 200,
		h = 30,
		type = 'STATIC',
		movable = 0,
		img = love.graphics.newImage("platform.fw.png"),
	}
	
	platform2 = {
		x = -50,
		y = 150,
		w = 200,
		h = 30,
		type = 'STATIC',
		movable = 0,
		img = love.graphics.newImage("platform.fw.png"),
	}
	
	ladder = {
		x = 150,
		y = 150,
		w = 44,
		h = 250,
		type = 'LADDER',
		movable = 50,
		img = love.graphics.newImage("ladder.fw.png"),
	}
	
	triangle = {
		x = 400,
		y = 400,
		w = 194,
		h = 167,
		type = 'STATIC',
		movable = 0,
		--points = { {x=0,y=167}, {x=194,y=167}, {x=97,y=0} },
		points = { {x=0+400,y=167+400}, {x=194+400,y=167+400}, {x=97+400,y=0+400} },
		img = love.graphics.newImage("triangle.fw.png"),
	}
	
	sky = love.graphics.newImage("sky.fw.png")
	--sound = love.audio.newSource("JKT48 - River.mp3")
	--love.audio.play(sound)
	
	
end

function love.draw ()
	love.graphics.draw(sky, 0, 0)
	love.graphics.draw(ground.img, ground.x, ground.y)
	
	love.graphics.draw(moving_platform.img, moving_platform.x, moving_platform.y)
	love.graphics.draw(ladder.img, ladder.x, ladder.y)
	love.graphics.draw(crate.img, crate.x, crate.y)
	love.graphics.draw(triangle.img, triangle.x, triangle.y)
	love.graphics.draw(platform1.img, platform1.x, platform1.y)
	love.graphics.draw(platform2.img, platform2.x, platform2.y)
	love.graphics.draw(player.img, player.x, player.y)
	--if not result1 then love.graphics.print("not result1") end
	--if not result2 then love.graphics.print("not result2", 0, 50) end
	love.graphics.print(debug_str, 0, 0)
end


function love.update (dt)
	obj_collide = {ground, crate, moving_platform, platform1, platform2, ladder}
	--platforms = {platform}
	local platform_speed = 150
	
	--PlatformMoveHorizontal (player, moving_platform, platform_speed, dt)
	PlatformMoveVertical (player, moving_platform, platform_speed, dt)
	
	
	if not LadderCollide(player, ladder) then
		AddGravity(player, obj_collide)
		IsJumping(player, obj_collide, dt)
		
		--if love.keyboard.isDown("down") then
		--	MoveCollideRect(   player,0,p_speed,  obj_collide  )
		--end
		if love.keyboard.isDown("space") then
			if up_key_enable then
				AddJump(player, obj_collide)
				up_key_enable = false
			end
		end
		if not on_platform then
			if love.keyboard.isDown("right") then
				MoveCollideRect(   player,p_speed*dt,0,  obj_collide  )
			end
			if love.keyboard.isDown("left") then
				MoveCollideRect(   player,-p_speed*dt,0,  obj_collide  )
			end
		end
	end
	
	
	
	
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end

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
			--print (333)
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
function MoveCollideRect (p, xm, ym, q)
	local result1 = true
	local result2 = true
	local result3 = false
	local result4 = false
	local t
	--debug_str = ''
	
	for i=1,#q do
		--print (q[i].type)
		t = q[i]		-- t: temporary variable
		--if checkCollisionRectangle (p.x, p.y, p.w, p.h,    q[i].x, q[i].y, q[i].w, q[i].h) then
		--z = CollisionRectangle ({x=p.x, y=p.y}, {x=p.w, y=p.h}, {x=q[i].x, y=q[i].y}, {x=q[i].w, y=q[i].h})
		if q[i].type == 'STATIC' or q[i].type == 'DYNAMIC' or q[i].type == 'PLATFORM' then
			--if CollisionRectangle ({x=p.x, y=p.y}, {x=p.x+p.w, y=p.y+p.h}, {x=q[i].x, y=q[i].y}, {x=q[i].x+q[i].w, y=q[i].y+q[i].h}) then
			if checkCollisionRectangle (p.x, p.y, p.w, p.h,    q[i].x, q[i].y, q[i].w, q[i].h) then
				--debug_str = 'aaa'
				result1 = false
				break
			end
			--if CollisionRectangle ({x=p.x+xm, y=p.y+ym}, {x=p.x+p.w+xm, y=p.y+p.h+ym}, {x=q[i].x, y=q[i].y}, {x=q[i].x+q[i].w, y=q[i].y+q[i].h}) then
			if checkCollisionRectangle (p.x+xm, p.y+ym, p.w+xm, p.h+ym,    q[i].x, q[i].y, q[i].w, q[i].h) then
				--debug_str = 'bbb'
				result2 = false
				break
			end
		elseif q[i].type == 'LADDER' then
			if checkCollisionRectangle (p.x, p.y, p.w, p.h,    q[i].x, q[i].y, q[i].w, q[i].h) and not checkCollisionRectangle (p.x+xm, p.y+ym, p.w+xm, p.h+ym,    q[i].x, q[i].y, q[i].w, q[i].h) then
				debug_str = 'ladder'
				break
			end
		end
	end
	
	--print (result1, result2)
	if result1 and result2 then			-- not hit
		--debug_str = '0000'
		p.x = p.x + xm
		p.y = p.y + ym
		return false
	elseif result1 and not result2 then		-- collide with other object
		if t.movable == 0 then		-- rigid object
			--debug_str = '111'
			if ym > 0 then			--  down
				p.y = t.y - p.h
			elseif ym < 0 then		-- up
				p.y = t.y + t.h
			end
			if xm < 0 then			-- left
				p.x = t.x + t.w
			elseif xm > 0 then		-- right
				p.x = t.x - p.w
			end
		elseif p.movable > t.movable then		-- light object
			--debug_str = '222'
			if ym > 0 then			--  down
				p.y = t.y - p.h
			elseif ym < 0 then		-- up
				p.y = t.y + t.h
			end
			if xm < 0 then			-- left
				t.x = t.x + xm
				p.x = t.x + t.w
			elseif xm > 0 then		-- right
				t.x = t.x + xm
				p.x = t.x - p.w
			end
		elseif p.movable < t.movable then		-- heavy object
			--debug_str = '333'
			if ym > 0 then			--  down
				p.y = t.y - p.h
			elseif ym < 0 then		-- up
				p.y = t.y + t.h
			end
			if xm < 0 then			-- left
				p.x = t.x + t.w
			elseif xm > 0 then		-- right
				p.x = t.x - p.w
			end
			
			--if jumping then
			--	jump_speed = 0
			--	jumping = false
			--end
		end
		
		
		
		return true	-- collide with other object
	else
		return false	-- result1 & result 2 == false
	end
	
	
	
end


function AddGravity (p, q)
	for i=1,#q do
		if checkCollisionRectangle (p.x, p.y+1, p.w, p.h+1,    q[i].x, q[i].y, q[i].w, q[i].h) then
			g_speed = 0
			up_key_enable = true
			return false
		end
	end
	
	if not jumping and not IsGround(p, q) then
		g_speed = g_speed + g_accel		-- gravity acceleration
		MoveCollideRect(p, 0, g_speed, q)
	end
end





function PlatformCollide (p, plat, plat_move_right, plat_speed, dt)
	if p.x+p.w >= plat.x and p.x <= plat.x+plat.w and plat.y == p.y+p.h then
		--debug_str = 'inside'
		local delta = 0
		on_plat = true
		delta = p.x - plat.x
		if plat_move_right then
			--debug_str = 'right'
			p.x = plat.x + delta + plat_speed * dt
			if love.keyboard.isDown("right") then
				p.x = p.x + p_speed * dt
			end
			if love.keyboard.isDown("left") then
				p.x =  p.x - p_speed * dt
			end
		elseif not plat_move_right then
			--debug_str = 'left' .. ' , ' .. delta
			p.x = plat.x + delta - plat_speed * dt
			if love.keyboard.isDown("right") then
				p.x = p.x + p_speed * dt
			end
			if love.keyboard.isDown("left") then
				p.x = p.x - p_speed * dt
			end
		end
		
		return true
	--elseif (p.x+p.w == plat.x or p.x == plat.x+plat.w) and p.y
	--if checkCollisionRectangle (p.x, p.y, p.w, p.h,    q[i].x, q[i].y, q[i].w, q[i].h) then
	end

	return false
end


function PlatformMoveHorizontal (player, moving_platform, platform_speed, dt)
	local on_platform = false
	if moving_platform.x >= 600 then
		plat_move_right = false	-- move left
	elseif moving_platform.x <= 200 then
		plat_move_right = true	-- move right
	end
	if plat_move_right then
		on_platform = PlatformCollide (player, moving_platform, plat_move_right, platform_speed, dt)
		moving_platform.x = moving_platform.x + platform_speed*dt
		if checkCollisionRectangle (player.x, player.y, player.w, player.h,    moving_platform.x, moving_platform.y, moving_platform.w, moving_platform.h) then
			player.x = moving_platform.x + moving_platform.w
		end
	elseif not plat_move_right then
		on_platform = PlatformCollide (player, moving_platform, plat_move_right, platform_speed, dt)
		moving_platform.x = moving_platform.x - platform_speed*dt
		if checkCollisionRectangle (player.x, player.y, player.w, player.h,    moving_platform.x, moving_platform.y, moving_platform.w, moving_platform.h) then
			player.x = moving_platform.x - player.w
		end
	end
end


function PlatformMoveVertical (player, moving_platform, platform_speed, dt)
	local on_platform = false
	if moving_platform.y >= 400 then
		plat_move_right = false	-- move left
	elseif moving_platform.y <= 200 then
		plat_move_right = true	-- move right
	end
	if plat_move_right then
		on_platform = PlatformCollide (player, moving_platform, plat_move_right, platform_speed, dt)
		--moving_platform.y = moving_platform.y + platform_speed*dt
		
		if on_platform then
			--player.x = moving_platform.x + moving_platform.w / 2
			player.y = moving_platform.y - player.h
		end
		if checkCollisionRectangle (player.x, player.y, player.w, player.h,    moving_platform.x, moving_platform.y, moving_platform.w, moving_platform.h) then
			
		end
	elseif not plat_move_right then
		on_platform = PlatformCollide (player, moving_platform, plat_move_right, platform_speed, dt)
		--moving_platform.y = moving_platform.y - platform_speed*dt
		
		if on_platform then
			--player.x = moving_platform.x + moving_platform.w / 2
			player.y = moving_platform.y - player.h
		end
		if checkCollisionRectangle (player.x, player.y, player.w, player.h,    moving_platform.x, moving_platform.y, moving_platform.w, moving_platform.h) then
			
		end
	end
end

function LadderCollide (p, l)
	--debug_str = l.y+l.h .. " , " .. math.floor(p.y+p.h)
	if p.x+p.w >= l.x and p.x <= l.x+l.w and l.y == p.y+p.h then	-- check if upstairs
		--debug_str = "upstairs"
		if love.keyboard.isDown("right") then
			p.x = p.x + p_speed
			--MoveCollideRect(   p,p_speed,0,  {ladder } )
		end
		if love.keyboard.isDown("left") then
			p.x = p.x - p_speed
			--MoveCollideRect(   p,-p_speed,0,  {ladder } )
		end
		if love.keyboard.isDown("down") then
			p.x = l.x + l.w/4	-- make the player on the middle of stair
			p.y = l.y - p.h/4	-- make the player a little bit down
		end
		if love.keyboard.isDown("up") then
			return false
		end
		return true
	elseif p.x+p.w >= l.x and p.x <= l.x+l.w and l.y+l.h <= p.y+p.h then	-- check if downstairs
		--debug_str = "downstairs"
		if love.keyboard.isDown("up") then
			p.y = l.y+l.h - p.h
			p.x = l.x + l.w/4
		end
		return false
	elseif checkCollisionRectangle (p.x, p.y, p.w, p.h,    l.x, l.y, l.w, l.h) then		-- (smaller hit detection area on the middle of ladder)
		--debug_str = "hit"
		if love.keyboard.isDown("down") then
			p.y = p.y + 3
			if l.y+l.h <= p.y+p.h then
				p.y = l.y+l.h - p.h
				--debug_str = "22"
			end
		end
		if love.keyboard.isDown("up") then
			p.y = p.y - 3
			if l.y >= p.y+p.h then
				p.y = l.y - p.h
			end
			
		end
		
		return true
	end
	
	
	return false
end

-- only can check rectangular collider
function checkCollisionRectangle (x1,y1,w1,h1, x2,y2,w2,h2)
	return x1 < x2+w2 and
		x2 < x1+w1 and
		y1 < y2+h2 and
		y2 < y1+h1
end

function IsGround (p, q)
	for i=1,#q do
		if checkCollisionRectangle (p.x, p.y, p.w, p.h,    q[i].x, q[i].y, q[i].w, q[i].h) then
		--if checkCollisionRectangle (p.x,p.y,p.x+p.w,p.y+p.h, q[i].x, q[i].y ,q[i].x+q[i].w,q[i].y+q[i].h) then
		--if CollisionRectangle ({x=p.x, y=p.y}, {x=p.x+p.w, y=p.y+p.h}, {x=q[i].x, y=q[i].y}, {x=q[i].x+q[i].w, y=q[i].y+q[i].h}) then
			debug_str = 'i: ' .. i .. '   q[i].y: ' .. q[i].y
			--touch_ground = true
			--g_speed = 0
			jumping = false
			return true
		end
	end
	--touch_ground = false
	return false
end

function AddJump (p, q)
	if not jumping then
		jumping = true
		jump_speed = 20
	end
end

function IsJumping (p, q, dt)
	if jumping and jump_speed > 0 then
		for i=1,#q do
			if checkCollisionRectangle (p.x, p.y-1, p.w, p.h-1,    q[i].x, q[i].y, q[i].w, q[i].h) then
				--speed = 0
				--up_key_enable = true
				jump_speed = 0
				return false
			end
		end
		
		jump_speed = jump_speed - 1
		MoveCollideRect(p, 0, -jump_speed, q)
	else
		jump_speed = 0
		jumping = false
	end
	
end
--]]


--[[
-- ANIMATION
speed = 4
x = 300
y = 300

-- idle=0, left=1, right=2
action = 0 

walk_animate = false

function love.load()
	love.graphics.setBackgroundColor(200, 100, 255)
	
	player1_idle = NewAnimation ({"player.fw.png"}, 1)
	player1_walk = NewAnimation ({"player.fw.png", "player walk.fw.png"}, 4)
	
	player2_idle = NewAnimationQuad ("player idle.png", 10, 3)
	player2_walk_left = NewAnimationQuad ("player walk left.png", 2, 8)
	player2_walk_right = NewAnimationQuad ("player walk right.png", 2, 8)
end

function love.draw()
	if not walk_animate then
		PlayAnimation(player1_idle, x, y-100)	-- idle animation
	else 
		PlayAnimation(player1_walk, x, y-100)	-- walk animation
	end
	
	if action == 0 then
		PlayAnimationQuad(player2_idle, x, y)	-- idle animation
	elseif action == 1 then
		PlayAnimationQuad(player2_walk_left, x, y)	-- walk animation
	elseif action == 2 then
		PlayAnimationQuad(player2_walk_right, x, y)	-- walk animation
	end
end

function love.update (dt)
	if love.keyboard.isDown("right") then
		x = x + speed
		walk_animate = true
		action = 2	-- right
	end
	if love.keyboard.isDown("left") then
		x = x - speed
		walk_animate = true
		action = 1	-- left
	end
	
	--if not love.keyboard.isDown("left", "right") and not love.keyboard.isDown("right") then
	if not love.keyboard.isDown("left", "right") then
		walk_animate = false
		action = 0	-- idle
	end
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end

function NewAnimation (img_files, delay)
	img_data = {}
	
	for i=1,#img_files do
		img_data[i] = love.graphics.newImage(img_files[i])
	end
	
	return {
		num_frames = #img_files,
		w = img_data[1]:getWidth(),
		h = img_data[1]:getHeight(),
		imgs = img_data,
		frame_counter = 1,
		delay = delay,
		delay_counter = 1,
		}
end

function PlayAnimation (anim, x, y)
	if anim.frame_counter <= anim.num_frames then
		love.graphics.draw(anim.imgs[anim.frame_counter], x, y)
		if anim.delay_counter <= anim.delay then
			anim.delay_counter = anim.delay_counter + 1
		else
			anim.delay_counter = 1
			anim.frame_counter = anim.frame_counter + 1
		end
	else
		anim.frame_counter = 1
		love.graphics.draw(anim.imgs[anim.frame_counter], x, y)
	end
end

function ResetAnimation (anim, x, y)
	anim.delay_counter = 1
	anim.frame_counter = 1
end


function NewAnimationQuad (img_file, delay, num_frames)
	obj = {}
	obj.quad = {}
	obj.img = love.graphics.newImage(img_file)
	
	frame_width = obj.img:getWidth()/num_frames
	frame_height = obj.img:getHeight()
	
	for i=1,num_frames do
		obj.quad[i] = love.graphics.newQuad( (i-1)*frame_width, 0, frame_width, frame_height, obj.img:getDimensions() )
	end
	
	obj.num_frames = num_frames
	obj.w = frame_width
	obj.h = frame_height
	
	obj.frame_counter = 1
	obj.delay = delay
	obj.delay_counter = 1
	return obj
end

function PlayAnimationQuad (anim, x, y)
	if anim.frame_counter <= anim.num_frames then
		love.graphics.draw(anim.img, anim.quad[anim.frame_counter], x, y)
		if anim.delay_counter <= anim.delay then
			anim.delay_counter = anim.delay_counter + 1
		else
			anim.delay_counter = 1
			anim.frame_counter = anim.frame_counter + 1
		end
	else
		anim.frame_counter = 1
		love.graphics.draw(anim.img, anim.quad[anim.frame_counter], x, y)
	end
end

function ResetAnimationQuad (anim, x, y)
	anim.frame_counter = 1
	anim.delay_counter = 1
end

]]

--[[
-- POLYGON

function love.load ()
	
end

function love.draw ()
	love.graphics.setColor(0, 255, 0)
	love.graphics.rectangle("fill", 10, 10, 100, 20)
	
	love.graphics.setColor(255, 0, 0)
	love.graphics.polygon("fill", {20, 20, 10, 100, 300, 300})
end

function love.update (dt)
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end
]]

--[[
-- ROTATING WHEEL
r = 0

function love.load ()
	nippon_flag = love.graphics.newImage("nippon flag.png")
	
end

function love.draw ()
	--love.graphics.draw(nippon_flag, 300, 300, math.pi*r, 1, 1, 1000, 1000)
	love.graphics.draw(nippon_flag, 300, 300, math.pi*r, 1, 1, 250, 250)
end

function love.update (dt)
	r = r + 0.026
	if r >= 2 then r = 0 end
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end
]]

--[[
-- VIBRATION (Android/iOS devices only)
function love.load ()
	love.system.vibrate( 1.5 )
end

function love.draw ()
	
end

function love.update (dt)
	
end
]]


--[[
-- CHANGE CAMERA POSITION
x = 0
y = 0

function love.load ()
	
end

function love.draw ()
	love.graphics.translate(x, y)
	
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle("fill", 100, 100, 100, 200)
end

function love.update (dt)
	if love.keyboard.isDown("right") then
		x = x + 1
	end
	if love.keyboard.isDown("left") then
		x = x - 1
	end
	if love.keyboard.isDown("up") then
		y = y - 1
	end
	if love.keyboard.isDown("down") then
		y = y + 1
	end
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end
]]


--[[
-- PHYSICS COLLISION CALLBACKS
force = ""
function love.load()
    world = love.physics.newWorld(0, 200, true)
    world:setCallbacks(beginContact, endContact, preSolve, postSolve)
 
    ball = {}
	ball.b = love.physics.newBody(world, 400,200, "dynamic")
	ball.b:setMass(10)
	ball.s = love.physics.newCircleShape(50)
	ball.f = love.physics.newFixture(ball.b, ball.s)
	ball.f:setRestitution(0.4)    -- make it bouncy
	ball.f:setUserData("Ball")
	
    static = {}
	static.b = love.physics.newBody(world, 400,400, "static")
	static.s = love.physics.newRectangleShape(200,50)
	static.f = love.physics.newFixture(static.b, static.s)
	static.f:setUserData("Block")
 
    text       = ""   -- we'll use this to put info text on the screen later
    persisting = 0    -- we'll use this to store the state of repeated callback calls
end
 
function love.update(dt)
    world:update(dt)
 
    if love.keyboard.isDown("right") then
        ball.b:applyForce(1000, 0)
    elseif love.keyboard.isDown("left") then
        ball.b:applyForce(-1000, 0)
    end
    if love.keyboard.isDown("up") then
        ball.b:applyForce(0, -5000)
    elseif love.keyboard.isDown("down") then
        ball.b:applyForce(0, 1000)
    end
 
    if string.len(text) > 768 then    -- cleanup when 'text' gets too long
        text = ""
    end
end
 
function love.draw()
    love.graphics.circle("line", ball.b:getX(),ball.b:getY(), ball.s:getRadius(), 20)
    love.graphics.polygon("line", static.b:getWorldPoints(static.s:getPoints()))
 
    love.graphics.print(text, 10, 10)
	
	love.graphics.print(force, 100, 400)
end
 
function beginContact(a, b, coll)
    x,y = coll:getNormal()
    text = text.."\n"..a:getUserData().." colliding with "..b:getUserData().." with a vector normal of: "..x..", "..y
end
 
function endContact(a, b, coll)
    persisting = 0
    text = text.."\n"..a:getUserData().." uncolliding with "..b:getUserData()
end
 
function preSolve(a, b, coll)
    if persisting == 0 then    -- only say when they first start touching
        text = text.."\n"..a:getUserData().." touching "..b:getUserData()
    elseif persisting < 20 then    -- then just start counting
        text = text.." "..persisting
    end
    persisting = persisting + 1    -- keep track of how many updates they've been touching for
end
 
function postSolve(a, b, coll, normalimpulse, tangentimpulse)
	force = normalimpulse	-- strength of force
end
]]


--
--

function love.load ()
	orang = love.graphics.newImage("futuretech_logo.jpg")
	stats = love.graphics.getStats()
end

function love.draw ()
	love.graphics.draw(orang, 50, 50, 0, 1, 1)
	love.graphics.draw(orang, 150, 50, 0, 1, 1)
	love.graphics.print(stats.drawcalls)
end

function love.update (dt)
	stats = love.graphics.getStats()
end






