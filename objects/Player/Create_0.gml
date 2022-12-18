/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

acceleration_vector = new vector(1, 0);
deceleration_vector = new vector(0, 0);

position = new vector(x, y);
velocity = new vector_zero();
steering = new vector_zero();
vec_acc = new vector_zero();

acceleration = 1;
deceleration = 0.5;

max_acc = 2;
max_dec = 0.2;

max_speed = 3;
max_force = 0.5;