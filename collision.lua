
-- return false if not hit & return table with 2 points (line) if hit
function PointCollisionPolygon (p, q)
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
			if q[a].x > q[c].x and q[a].x < p.x then
				return false
				--return { {x=q[a].x, y=q[a].y},  {x=q[b].x, y=q[b].y} }
			elseif q[a].x < q[c].x and q[a].x > p.x then
				return false
				--return { {x=q[a].x, y=q[a].y},  {x=q[b].x, y=q[b].y} }
			end
		elseif q[a].y == q[b].y then
			--print (222)
			if q[a].y > q[c].y and q[a].y < p.y then
				return false
				--return { {x=q[a].x, y=q[a].y},  {x=q[b].x, y=q[b].y} }
			elseif q[a].y < q[c].y and q[a].y > p.y then
				return false
				--return { {x=q[a].x, y=q[a].y},  {x=q[b].x, y=q[b].y} }
			end
			
		else
			--print (333)
			-- y = (x-x1)/(x2-x1) * (y2-y1) + y1
			y_cmp1 = (q[c].x-q[a].x)/(q[b].x-q[a].x) * (q[b].y-q[a].y) + q[a].y
			y_cmp2 = (p.x    -q[a].x)/(q[b].x-q[a].x) * (q[b].y-q[a].y) + q[a].y
			--print (q[a].x, q[a].y, q[b].x, q[b].y)
			if y_cmp1 < q[c].y and y_cmp2 > p.y then
				return false
				--return { {x=q[a].x, y=q[a].y},  {x=q[b].x, y=q[b].y} }
			elseif y_cmp1 > q[c].y and y_cmp2 < p.y then
				return false
				--print (y_cmp1, q[c].y)
				--print (y_cmp2, p.y)
				--return { {x=q[a].x, y=q[a].y},  {x=q[b].x, y=q[b].y} }
			end
		end
	
	end		-- for
	
	return true	-- hit
end

-- BUG
function PointCollisionRectangle (p1, p2, q1, q2)
	local r
	r = PointCollisionPolygon ( {x=p1.x,y=p1.y}, {{x=q1.x,y=q1.y}, {x=q2.x,y=q1.y}, {x=q2.x,y=q2.y}, {x=q1.x,y=q2.y}}  )
	if r ~= false then return r end
	r = PointCollisionPolygon ( {x=p1.x,y=p2.y}, {{x=q1.x,y=q1.y}, {x=q2.x,y=q1.y}, {x=q2.x,y=q2.y}, {x=q1.x,y=q2.y}}  )
	if r ~= false then return r end
	r = PointCollisionPolygon ( {x=p2.x,y=p1.y}, {{x=q1.x,y=q1.y}, {x=q2.x,y=q1.y}, {x=q2.x,y=q2.y}, {x=q1.x,y=q2.y}}  )
	if r ~= false then return r end
	r = PointCollisionPolygon ( {x=p2.x,y=p2.y}, {{x=q1.x,y=q1.y}, {x=q2.x,y=q1.y}, {x=q2.x,y=q2.y}, {x=q1.x,y=q2.y}}  )
	if r ~= false then return r end
	
	-- swap to check if the first rectangle is smaller
	r = PointCollisionPolygon ( {x=q1.x,y=q1.y}, {{x=p1.x,y=p1.y}, {x=p2.x,y=p1.y}, {x=p2.x,y=p2.y}, {x=p1.x,y=p2.y}}  )
	if r ~= false then return r end
	r = PointCollisionPolygon ( {x=p1.x,y=q2.y}, {{x=p1.x,y=p1.y}, {x=p2.x,y=p1.y}, {x=p2.x,y=p2.y}, {x=p1.x,y=p2.y}}  )
	if r ~= false then return r end
	r = PointCollisionPolygon ( {x=q2.x,y=q1.y}, {{x=p1.x,y=p1.y}, {x=p2.x,y=p1.y}, {x=p2.x,y=p2.y}, {x=p1.x,y=p2.y}}  )
	if r ~= false then return r end
	r = PointCollisionPolygon ( {x=q2.x,y=q2.y}, {{x=p1.x,y=p1.y}, {x=p2.x,y=p1.y}, {x=p2.x,y=p2.y}, {x=p1.x,y=p2.y}}  )
	if r ~= false then return r end
	
	return r
end

--a = PointCollisionPolygon ( {x=1,y=1}, {{x=1,y=1}, {x=4,y=3}, {x=3,y=5}}  )
--a = PointCollisionPolygon ( {x=0,y=0}, {{x=0,y=0}, {x=3,y=0}, {x=0,y=4}}  )
--a = PointCollisionPolygon ( {x=0,y=0}, {{x=0,y=0}, {x=4,y=0}, {x=4,y=4}, {x=0,y=4}}  )
--print (a)


function LineCollisionPolygon (p, q)
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
			if q[a].x > q[c].x and q[a].x < p.x then
				return false
				--return { {x=q[a].x, y=q[a].y},  {x=q[b].x, y=q[b].y} }
			elseif q[a].x < q[c].x and q[a].x > p.x then
				return false
				--return { {x=q[a].x, y=q[a].y},  {x=q[b].x, y=q[b].y} }
			end
		elseif q[a].y == q[b].y then
			--print (222)
			if q[a].y > q[c].y and q[a].y < p.y then
				return false
				--return { {x=q[a].x, y=q[a].y},  {x=q[b].x, y=q[b].y} }
			elseif q[a].y < q[c].y and q[a].y > p.y then
				return false
				--return { {x=q[a].x, y=q[a].y},  {x=q[b].x, y=q[b].y} }
			end
			
		else
			--print (333)
			-- y = (x-x1)/(x2-x1) * (y2-y1) + y1
			y_cmp1 = (q[c].x-q[a].x)/(q[b].x-q[a].x) * (q[b].y-q[a].y) + q[a].y
			y_cmp2 = (p.x    -q[a].x)/(q[b].x-q[a].x) * (q[b].y-q[a].y) + q[a].y
			--print (q[a].x, q[a].y, q[b].x, q[b].y)
			if y_cmp1 < q[c].y and y_cmp2 > p.y then
				return false
				--return { {x=q[a].x, y=q[a].y},  {x=q[b].x, y=q[b].y} }
			elseif y_cmp1 > q[c].y and y_cmp2 < p.y then
				return false
				--print (y_cmp1, q[c].y)
				--print (y_cmp2, p.y)
				--return { {x=q[a].x, y=q[a].y},  {x=q[b].x, y=q[b].y} }
			end
		end
	
	end		-- for
end


function IsBetween (x, b1, b2)
	return ( ((x >= (b1 - 0.1)) and 
		(x <= (b2 + 0.1))) or 
		((x >= (b2 - 0.1)) and
		(x <= (b1 + 0.1))))
end

function LineCollisionLine (lineA,lineB,line2A,line2B)
	deltaX1 = lineB.x - lineA.x
	deltaX2 = line2B.x - line2A.x
	deltaY1 = lineB.y - lineA.y
	deltaY2 = line2B.y - line2A.y

	if (math.abs(deltaX1) < 0.01 and  
		math.abs(deltaX2) < 0.01) then
		return false
	end
	
	if (math.abs((deltaY1 / deltaX1) - (deltaY2 / deltaX2)) < 0.001) then
		return false
	end
	
	xCol = ( ((deltaX1 * deltaX2) * (line2A.y - lineA.y)) - (line2A.x * deltaY2 * deltaX1) + 
			(lineA.x * deltaY1 * deltaX2)) / ((deltaY1 * deltaX2) - (deltaY2 * deltaX1) )
	yCol = 0
	
	if (deltaX1 < 0.01) then
		yCol = ((xCol * deltaY2) + (line2A.y * deltaX2) - (line2A.x * deltaY2)) / deltaX2
	else
		yCol = ((xCol * deltaY1) + (lineA.y * deltaX1) - (lineA.x * deltaY1)) / deltaX1
	end
	
	isCol = IsBetween(xCol, lineA.x, lineB.x) and
			IsBetween(yCol, lineA.y, lineB.y) and
			IsBetween(xCol, line2A.x, line2B.x) and
			IsBetween(yCol, line2A.y, line2B.y)
			
	if isCol then
		print (xCol, yCol)
	end
	return isCol
end


--a = PointCollisionRectangle ({x=0,y=0}, {x=1,y=1}, {x=0,y=0}, {x=5,y=7})
--a = PointCollisionRectangle ({x=0,y=0}, {x=200,y=200},  {x=-1,y=-1}, {x=-2,y=-2})
--300	0	21	75	500	270	200	30

--LineCollisionPolygon ( {{x=1,y=1}, {x=2,y=2}},    {{x=1,y=1}, {x=4,y=3}, {x=3,y=5}}  )


a = LineCollisionLine ( {x=1,y=1},{x=2,y=2},  {x=1,y=2},{x=2,y=1} )
print (a)



