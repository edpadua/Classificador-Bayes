function [y] = maxi(X)
   [a s]=size(X);
   ind=1;
   maior=0;
   for i=1:s
      if(abs(X(i))>abs(maior))
         maior=X(i);
         ind=i;
      end    
   end
   y=ind;
end
