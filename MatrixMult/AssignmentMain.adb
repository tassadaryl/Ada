with text_io;
with MatrixMult;
with Ada.Integer_Text_IO;

procedure AssignmentMain is
    use text_io;
    use MatrixMult;
    use Ada.Integer_Text_IO;

    A: matrix;
    B: matrix;
    C: matrix;

    task type readFile is
        entry read(inMatrix: out matrix);
    end readFile;

    task body readFile is
        num: integer;
        begin
        accept read(inMatrix: out matrix) do
            for i in 1..SIZE loop
                for j in 1..SIZE loop
                    Ada.Integer_Text_IO.Get(num);
                    inMatrix(i,j):=num; 
                end loop;
            end loop;
        end read;
    end readFile;

    task type printMatrix is
        entry print(inMatrix: matrix);
    end printMatrix;

    task body printMatrix is 
        begin
        accept print(inMatrix: in matrix) do
            for i in 1..SIZE loop
                for j in 1..SIZE loop 
                    put(inMatrix(i,j));
                    put(" ");
                end loop;
                new_line;
            end loop;
        end print;
    end printMatrix;

    Reader1:readFile;
    Reader2:readFile;
    Printer:printMatrix;

    begin   
        Reader1.read(A);
        Reader2.read(B);
        MatMul(A,B,C);
        Printer.print(C);
    end AssignmentMain;


