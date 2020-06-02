function [fano] = myfun(y)
m=var(y);
v=mean(y);
fano = m./v;
end