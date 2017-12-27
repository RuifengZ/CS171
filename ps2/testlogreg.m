%Ruifeng Zhang 861212163
%CS 171 PS2
%29 October 2017
function err = testlogreg(X,Y,w)
test = learnlogreg(X,Y,0.01);
err=sum(test==w)/length(w);
fprintf('fraction correct = %g\n',err);
