package body MatrixMult is
    
    procedure MatMul(A: in matrix; B: in matrix; C: out matrix) is

        task type multiply is
            entry mult(rows: integer; cols: integer);
        end multiply;

        task body multiply is
            row: integer;
            col: integer;
            sum: integer:=0;

        begin
            accept mult(rows:integer; cols:integer) do
                row:= rows;
                col:= cols;
            end mult;

            for i in 1..SIZE loop
                sum  := sum + A(row,i) * B(i,col);
            end loop;
            C(row, col) := sum;
        end multiply;

        multiplyTasks:array(1..SIZE*SIZE) of multiply;

        begin
            for i in 1..SIZE loop 
                for j in 1..SIZE loop  
                    multiplyTasks((i-1)*SIZE+j).mult(i,j);
                end loop;
            end loop;
        end MatMul;

    end MatrixMult;
    


