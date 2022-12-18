/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
function rotate_vector(v, a)
{
	vx = v.x * dcos(a) - v.y * dsin(a);
	vy = v.x * dsin(a) + v.y * dcos(a);
	
	res = new vector(vx, vy);
	
	return res;
}

function compute_steering()
{
	if (keyboard_check(vk_left))
	{
		steering.add(rotate_vector(velocity, -90));
	}

	if (keyboard_check(vk_right))
	{
		steering.add(rotate_vector(velocity, 90));
	}
	
	steering.limit_magnitude(max_force);
}

function compute_acceleration()
{
	if (keyboard_check(vk_up))
	{	
		var v = rotate_vector(acceleration_vector, image_angle);
		v.multiply(acceleration);
		vec_acc.add(v);
	}
	else
	{
		deceleration_vector.copy(velocity);
		deceleration_vector.multiply(-1);
		deceleration_vector.limit_magnitude(max_dec);
		vec_acc.add(deceleration_vector);
	}
}

compute_steering();
velocity.add(steering);

compute_acceleration();
velocity.add(vec_acc);
velocity.limit_magnitude(max_speed);

position.add(velocity);

x = position.x;
y = position.y;

steering.set(0, 0);
vec_acc.set(0, 0);

if (velocity.get_magnitude() > 0)
	image_angle = velocity.get_direction();