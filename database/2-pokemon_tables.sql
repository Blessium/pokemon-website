USE pokemon;

CREATE TABLE pokemon_colors (
	id INTEGER NOT NULL, 
	identifier VARCHAR(100) NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE pokemon_shapes (
	id INTEGER NOT NULL, 
	identifier VARCHAR(24) NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE pokemon_habitats (
	id INTEGER NOT NULL, 
	identifier VARCHAR(16) NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE growth_rates (
	id INTEGER NOT NULL, 
	identifier VARCHAR(20) NOT NULL, 
	formula VARCHAR(500) NOT NULL, 
	PRIMARY KEY (id)
);
INSERT INTO growth_rates VALUES(1,'slow','\frac{5x^3}{4}');
INSERT INTO growth_rates VALUES(2,'medium','x^3');
INSERT INTO growth_rates VALUES(3,'fast','\frac{4x^3}{5}');
INSERT INTO growth_rates VALUES(4,'medium-slow','\frac{6x^3}{5} - 15x^2 + 100x - 140');
INSERT INTO growth_rates VALUES(5,'slow-then-very-fast','\begin{cases}
\frac{ x^3 \left( 100 - x \right) }{50},    & \text{if } x \leq 50  \\
\frac{ x^3 \left( 150 - x \right) }{100},   & \text{if } 50 < x \leq 68  \\
\frac{ x^3 \left( 1274 + (x \bmod 3)^2 - 9 (x \bmod 3) - 20 \left\lfloor \frac{x}{3} \right\rfloor \right) }{1000}, & \text{if } 68 < x \leq 98  \\
\frac{ x^3 \left( 160 - x \right) }{100},   & \text{if } x > 98  \\
\end{cases}');
INSERT INTO growth_rates VALUES(6,'fast-then-very-slow','\begin{cases}
\frac{ x^3 \left( 24 + \left\lfloor \frac{x+1}{3} \right\rfloor \right) }{50},  & \text{if } x \leq 15  \\
\frac{ x^3 \left( 14 + x \right) }{50},     & \text{if } 15 < x \leq 35  \\
\frac{ x^3 \left( 32 + \left\lfloor \frac{x}{2} \right\rfloor \right ) }{50},   & \text{if } x > 35  \\
\end{cases}');

INSERT INTO pokemon_habitats VALUES(1,'cave');
INSERT INTO pokemon_habitats VALUES(2,'forest');
INSERT INTO pokemon_habitats VALUES(3,'grassland');
INSERT INTO pokemon_habitats VALUES(4,'mountain');
INSERT INTO pokemon_habitats VALUES(5,'rare');
INSERT INTO pokemon_habitats VALUES(6,'rough-terrain');
INSERT INTO pokemon_habitats VALUES(7,'sea');
INSERT INTO pokemon_habitats VALUES(8,'urban');
INSERT INTO pokemon_habitats VALUES(9,'waters-edge');

INSERT INTO pokemon_colors VALUES(1,'black');
INSERT INTO pokemon_colors VALUES(2,'blue');
INSERT INTO pokemon_colors VALUES(3,'brown');
INSERT INTO pokemon_colors VALUES(4,'gray');
INSERT INTO pokemon_colors VALUES(5,'green');
INSERT INTO pokemon_colors VALUES(6,'pink');
INSERT INTO pokemon_colors VALUES(7,'purple');
INSERT INTO pokemon_colors VALUES(8,'red');
INSERT INTO pokemon_colors VALUES(9,'white');
INSERT INTO pokemon_colors VALUES(10,'yellow');

INSERT INTO pokemon_shapes VALUES(1,'ball');
INSERT INTO pokemon_shapes VALUES(2,'squiggle');
INSERT INTO pokemon_shapes VALUES(3,'fish');
INSERT INTO pokemon_shapes VALUES(4,'arms');
INSERT INTO pokemon_shapes VALUES(5,'blob');
INSERT INTO pokemon_shapes VALUES(6,'upright');
INSERT INTO pokemon_shapes VALUES(7,'legs');
INSERT INTO pokemon_shapes VALUES(8,'quadruped');
INSERT INTO pokemon_shapes VALUES(9,'wings');
INSERT INTO pokemon_shapes VALUES(10,'tentacles');
INSERT INTO pokemon_shapes VALUES(11,'heads');
INSERT INTO pokemon_shapes VALUES(12,'humanoid');
INSERT INTO pokemon_shapes VALUES(13,'bug-wings');
INSERT INTO pokemon_shapes VALUES(14,'armor');
