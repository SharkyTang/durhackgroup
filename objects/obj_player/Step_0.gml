/// @description Player movement

// Check keys for movement
global.playerControl = true;
if(global.playerControl == true){
	right_key = keyboard_check(vk_right);
	left_key = keyboard_check(vk_left);
	up_key = keyboard_check(vk_up);
	down_key = keyboard_check(vk_down);
}
if(global.playerControl == false){
	moveRight=0;
	moveLeft=0;
	moveUp=0;
	moveDown=0;
}
//get xspd and yspd
xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;

//set sprite
mask_index = sprite[DOWN];
if yspd == 0
    {
    if xspd > 0 {face = RIGHT};
    if xspd < 0 {face = LEFT};
    }
	
if xspd > 0 && face == LEFT {face = RIGHT};
if xspd < 0 && face == RIGHT {face = LEFT};

if xspd == 0
 {
 if yspd > 0 {face = DOWN};
 if yspd < 0 {face = UP};
 }
 if xspd > 0 && face == UP {face = DOWN};
 if xspd < 0 && face == DOWN {face = UP};
 
sprite_index = sprite[face];

//collisions
if place_meeting(x + xspd, y, obj_wall) == true
{
      xspd = 0;
}
if place_meeting( x, y + yspd, obj_wall ) == true
{
      yspd = 0;
}
      
//move the player 
x += xspd;
y += yspd;

//animate
if xspd == 0 && yspd == 0
{
image_index = 0;
}

//depth
depth = -bbox_bottom;