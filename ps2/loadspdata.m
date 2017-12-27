function [X,Y] = loadspdata(fname,n)

fid = fopen(fname);
X = zeros(0,n);
Y = zeros(0,1);
while 1
	if feof(fid)
		break;
	end
	l = fgetl(fid);
	if (mod(size(X,1),100)==99)
		fprintf('#');
	end
	vals = sscanf(l,'%d');
	Y = [Y; vals(1)];
	newx = zeros(1,n);
	for i=2:2:length(vals)
		newx(vals(i)) = vals(i+1);
	end
	X = [X;newx];
end
fprintf('\n');
