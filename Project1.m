% Given matrices
A1 = [3.5 4 2.5; -3.5 0 -0.5; 0 0 -1.5];
A2 = [2 0 -2.5 -1; 0.5 -1 9 2; 3.5 -1.5 -.5 -1; .5 0 -2.5 -3.5];
A3 = [2 4 4 -5 1 0; 3 0 3.5 -9 0 0; 0 0 0 -2.5 -2 7; 0 0 4.5 -10 -3 0; 0 -2 0 -1 4 4; 0 0 0 -1.5 -3 3];
A4 = [0 -9 -18 -2.5; 2 -2.5 -3 0; 3 0 3 -1; 3 0 3 0];
A5 = [-1 0.5 2 0 -10 -1; -0.5 4.5 0 2 -0.5 -1; -3.5 2.5 -4.5 -1 -3 3.5; -6 2 -5 -1.5 5 0; 1 0 5 0 1 0; -2.5 0 3 -1 7 4.5];

A = {A1};
A{2} = A2;
A{3} = A3;
A{4} = A4;
A{5} = A5;
% matrixNum = input("Please enter number of matrices to compute: ");
for i = 1:size(A,2)
    disp("Given Matrix: ")
    disp(A{i})
    s = length(A{i});
    % Make sure matrix is nxn
    if(size(A{i},1) == size(A{i},2))
        % Get matrix in upper triangular form
        for m = 1:(s)-1 % from 1 to s-1
            for n = s:-1:m+1 % n=s, decrement till m+1
                disp(A{i})
                %If diagonal is 0, add nonzero row to it%
                if A{i}(m,m) == 0
                     if A{i}(m,m) == A{i}(1,1) % If first entry is 0 different logic applies
                         for x=2:s
                             if A{i}(x-1,m) ~= 0
                                A{i}(m,:) = A{i}(m,:) + A{i}(x-1,:);
                                break;
                             end
                         end
                     else
                        for x=m:s % From s to 1
                            disp(m)
                            disp(A{i}(m,m))
                            disp(A{i}(m+1,m))
                            
                            if A{i}(m+1,m) ~= 0
                                A{i}([m,m-1],:) = A{i}([m-1,m],:);
                                disp(A{i})
                                A{i}(m,:) = A{i}(m,:) + A{i}(m-1,:);
                                disp(A{i})
                                break;
                            end
                        end
                     end
                end
                 r = A{i}(n,m)/A{i}(m,m);
                 A{i}(n,:) = A{i}(n,:) - r*A{i}(m,:); % Reduce row
            end
        end 

        disp("Reduced Upper Triangular form: ")
        disp(A{i})

        % Multiply main diagonal together
        D = 1;
        for x = 1:s
            D = D * A{i}(x,x);
        end
        disp("Determinant: " + D)
        disp("================================================================")
        disp("")
    else
        disp("ERROR: Matrix is not nxn in size.")
    end
end