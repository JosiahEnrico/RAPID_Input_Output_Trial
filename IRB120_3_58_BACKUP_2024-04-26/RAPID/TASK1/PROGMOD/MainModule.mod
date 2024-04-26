MODULE MainModule
!*** Setup
    VAR num nKey:=0;
    VAR num nKey_Bin:=0;
    VAR num nNumber:=0;
    VAR dionum arBinary{4};
    
    !*** Loop
    PROC Main()
        nKey:=0;
        nKey_Bin:=0;
        nNumber:=0;
        arBinary:=[0,0,0,0];
        
        Reset DO01_Out;
        Reset DO02_Out;
        Reset DO03_Out;
        Reset DO04_Out;
        
        TPErase;
        TPWrite "Trial Input Output";
        TPWrite "This program will convert your 4-digit binary to a number or vice versa";
        TPReadFK nKey,"Which data do you want to input?","4-Digit Binary","Number","","","";
        IF nKey=1 THEN !*** 4 Digit binary option
            Repeat:
            TPErase;
            TPWrite "You have chosen to input 4-digit binary";
            TPWrite "Binary 1 (1) = "\Num:=arBinary{1};
            TPWrite "Binary 2 (2) = "\Num:=arBinary{2};
            TPWrite "Binary 3 (4) = "\Num:=arBinary{3};
            TPWrite "Binary 4 (8) = "\Num:=arBinary{4};
            TPReadFK nKey_Bin,"Change the binary input by select the bit. Click 'Done' when finished ","B1","B2","B3","B4","Done";
            FOR i FROM 1 TO 4 DO
                IF nKey_Bin = i THEN
                    IF arBinary{i} = 0 THEN
                        arBinary{i}:= 1;
                    ELSEIF arBinary{i} = 1 THEN
                        arBinary{i}:= 0;
                    ENDIF
                    GOTO Repeat;
                ENDIF
            ENDFOR
            
            IF nKey_Bin = 5 THEN
                SetDO DO01_Out, arBinary{1};
                SetDO DO02_Out, arBinary{2};
                SetDO DO03_Out, arBinary{3};
                SetDO DO04_Out, arBinary{4};
            ENDIF
            WaitTime 1;
            PrintNumber;
        
        ELSEIF nKey=2 THEN !*** Number option
            TPErase;
            TPWrite "You have chosen to input number";
            TPReadNum nNumber, "Select the number between 0-15";
            SetGO GDO_Out, nNumber;
            WaitTime 1;
            PrintBinary;
            
        ENDIF
    ENDPROC
    
    PROC PrintNumber()
        TPErase;
        TPWrite "Your number is "\Num:=GDI_In;
        TPReadFK nKey,"Do you want to see the binary?","Yes","No","","","";
        IF nKey=1 THEN
            TPWrite "Binary 1 (1) = "\Num:=DI01_In;
            TPWrite "Binary 2 (2) = "\Num:=DI02_In;
            TPWrite "Binary 3 (4) = "\Num:=DI03_In;
            TPWrite "Binary 4 (8) = "\Num:=DI04_In;
            TPReadFK reg1, " ", stEmpty, stEmpty, stEmpty, stEmpty, "Done";
            RETURN;
        ELSEIF nKey = 2 THEN
            RETURN;
        ENDIF
    ENDPROC

    PROC PrintBinary()
        TPErase;
        TPWrite "Binary 1 (1) = "\Num:=DI01_In;
        TPWrite "Binary 2 (2) = "\Num:=DI02_In;
        TPWrite "Binary 3 (4) = "\Num:=DI03_In;
        TPWrite "Binary 4 (8) = "\Num:=DI04_In;
        Repeat:
        TPReadFK nKey,"Do you want to see the number?","Yes","No","","","";
        IF nKey=1 THEN
            TPWrite "Your number is "\Num:=GDI_In;
            TPReadFK reg1, " ", stEmpty, stEmpty, stEmpty, stEmpty, "Done";
            RETURN;
        ELSEIF nKey = 2 THEN
            RETURN;
        ENDIF
    ENDPROC
    
    
    
!	PROC main()
!		!MoveJ [[393.54,-206.56,395.56],[0.482746,0.482724,-0.516694,0.516683],[-1,-2,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, tool0;
!		!MoveL [[393.56,-278.78,395.54],[0.482627,0.482886,-0.516652,0.516685],[-1,-2,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, tool0;
!		!MoveL [[393.54,-206.56,395.56],[0.482746,0.482724,-0.516694,0.516683],[-1,-2,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, tool0;
!		!MoveJ [[456.17,-78.77,222.32],[1.61643E-05,0.679211,-0.733943,-1.53321E-05],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, tool0;
!		!MoveL [[456.17,-78.77,133.60],[1.06574E-05,-0.679203,0.73395,-1.24899E-05],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, tool0;
!		!MoveL [[456.17,-78.77,222.32],[1.61643E-05,0.67921,-0.733944,-1.53321E-05],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, tool0;
!		!MoveJ [[348.78,219.41,401.25],[0.499611,-0.49961,0.500385,0.500394],[0,1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, tool0;
!		!MoveJ [[456.19,60.91,153.69],[6.04029E-05,-0.679231,0.733925,-3.40472E-05],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, tool0;
!		!AbsZero;
!		!RB1_01_01;
!		!RB1_01_02;
!		!RB1_01_03;
!		RB_01;
!		Routine1;
!	ENDPROC
!	PROC AbsZero()
!		MoveAbsJ [[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]]\NoEOffs, v1000, z50, tool0;
!	ENDPROC
ENDMODULE