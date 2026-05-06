function M = Prop(d)
M = sym(eye(4));   % IMPORTANT: symbolic identity matrix
M(1,2) = d;
M(3,4) = d;
end