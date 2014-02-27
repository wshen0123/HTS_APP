00DC15BA    PUSH app18win.00DC3344              ; /mode = "rb"
00DC15BF    PUSH EAX                            ; |path
00DC15C0    CALL DWORD PTR DS:[<&MSVCR90.fopen>>; \fopen
00DC15C6    ADD ESP,1C
00DC15C9    MOV DWORD PTR SS:[EBP-5C],EAX
00DC15CC    TEST EAX,EAX
00DC15CE    JE app18win.00DC18F9                ;  JMP fopen failed ("app18win.lic")
00DC15D4    PUSH EAX                            ; /stream
00DC15D5    PUSH 20                             ; |n = 20 (32.)
00DC15D7    PUSH 1                              ; |size = 1
00DC15D9    PUSH ESI                            ; |ptr
00DC15DA    CALL DWORD PTR DS:[<&MSVCR90.fread>>; \fread
00DC15E0    ADD ESP,10
00DC15E3    CMP EAX,20
00DC15E6    JNZ app18win.00DC18E6               ;  JMP fread failed (0x20)
00DC15EC    CMP BYTE PTR DS:[ESI],0
00DC15EF    JE app18win.00DC18E6
00DC15F5    CMP BYTE PTR DS:[ESI+4],0
00DC15F9    JE app18win.00DC18E6
00DC15FF    LEA EDI,DWORD PTR DS:[ESI+8]
00DC1602    CMP BYTE PTR DS:[EDI],0
00DC1605    JE app18win.00DC18E6
00DC160B    PUSH EDI                            ; /s
00DC160C    CALL <JMP.&MSVCR90.strlen>          ; \strlen
00DC1611    POP ECX
00DC1612    CMP EAX,9
00DC1615    JNZ app18win.00DC18E6
00DC161B    LEA EAX,DWORD PTR DS:[ESI+12]
00DC161E    CMP BYTE PTR DS:[EAX],0
00DC1621    JE app18win.00DC18E6
00DC1627    PUSH EAX                            ; /s
00DC1628    CALL <JMP.&MSVCR90.strlen>          ; \strlen
00DC162D    POP ECX
00DC162E    CMP EAX,9
00DC1631    JNZ app18win.00DC18E6
00DC1637    LEA EBX,DWORD PTR DS:[ESI+1C]
00DC163A    CMP BYTE PTR DS:[EBX],0
00DC163D    JE app18win.00DC18E6
00DC1643    PUSH app18win.00DC3340              ; /s2 = "LIC"
00DC1648    PUSH ESI                            ; |s1
00DC1649    CALL <JMP.&MSVCR90.strcmp>          ; \strcmp
00DC164E    POP ECX
00DC164F    POP ECX
00DC1650    TEST EAX,EAX
00DC1652    JNZ app18win.00DC18E6
00DC1658    LEA EAX,DWORD PTR DS:[ESI+4]
00DC165B    PUSH app18win.00DC333C              ; /s2 = "1.8"
00DC1660    PUSH EAX                            ; |s1
00DC1661    CALL <JMP.&MSVCR90.strcmp>          ; \strcmp
00DC1666    POP ECX
00DC1667    POP ECX
00DC1668    TEST EAX,EAX
00DC166A    JNZ app18win.00DC18E6
00DC1670    PUSH app18win.00DC3338              ; /s2 = "HTS"
00DC1675    PUSH EBX                            ; |s1
00DC1676    CALL <JMP.&MSVCR90.strcmp>          ; \strcmp
00DC167B    POP ECX
00DC167C    POP ECX
00DC167D    TEST EAX,EAX
00DC167F    JNZ app18win.00DC18E6

00DC1685    PUSH 0A                             ; /radix = A (10.)
00DC1687    PUSH EAX                            ; |endptr
00DC1688    PUSH EDI                            ; |s=buf[8]
00DC1689    MOV EDI,DWORD PTR DS:[<&MSVCR90.str>; |MSVCR90.strtoul
00DC168F    CALL EDI                            ; \strtoul
00DC1691    ADD ESP,0C
00DC1694    CMP EAX,15
00DC1697    MOV DWORD PTR SS:[EBP-54],EAX
00DC169A    JG SHORT app18win.00DC16A7
00DC169C    PUSH 4
00DC169E    POP EAX
00DC169F    CMP DWORD PTR SS:[EBP-54],EAX
00DC16A2    JGE SHORT app18win.00DC16A7
00DC16A4    MOV DWORD PTR SS:[EBP-54],EAX

00DC16A7    PUSH 0A
00DC16A9    LEA EAX,DWORD PTR DS:[ESI+12]
00DC16AC    PUSH 0
00DC16AE    PUSH EAX                            ; |s=buffer[18]
00DC16AF    CALL EDI                            ; \strtoul
00DC16B1    ADD ESP,0C
00DC16B4    CMP EAX,14
00DC16B7    MOV DWORD PTR SS:[EBP-58],EAX
00DC16BA    JL SHORT app18win.00DC16C9
00DC16BC    MOV EAX,800
00DC16C1    CMP DWORD PTR SS:[EBP-58],EAX
00DC16C4    JLE SHORT app18win.00DC16C9
00DC16C6    MOV DWORD PTR SS:[EBP-58],EAX

00DC16C9    MOV EDI,DWORD PTR SS:[EBP-54]
00DC16CC    INC EDI
00DC16CD    PUSH EDI
00DC16CE    CALL app18win.00DC1F8B
00DC16D3    MOV EBX,DWORD PTR SS:[EBP-58]
00DC16D6    INC EBX
00DC16D7    PUSH EBX
00DC16D8    MOV DWORD PTR DS:[ESI+20],EAX
00DC16DB    CALL app18win.00DC1F8B

00DC16E0    PUSH EDI                            ; /n
00DC16E1    PUSH 0                              ; |c = 00
00DC16E3    PUSH DWORD PTR DS:[ESI+20]          ; |s
00DC16E6    MOV DWORD PTR DS:[ESI+24],EAX       ; |
00DC16E9    CALL <JMP.&MSVCR90.memset>          ; \memset

00DC16EE    PUSH EBX                            ; /n
00DC16EF    PUSH 0                              ; |c = 00
00DC16F1    PUSH DWORD PTR DS:[ESI+24]          ; |s
00DC16F4    CALL <JMP.&MSVCR90.memset>          ; \memset

00DC16F9    PUSH DWORD PTR SS:[EBP-5C]          ; /stream
00DC16FC    PUSH EDI                            ; |n
00DC16FD    PUSH 1                              ; |size = 1
00DC16FF    PUSH DWORD PTR DS:[ESI+20]          ; |ptr
00DC1702    CALL DWORD PTR DS:[<&MSVCR90.fread>>; \fread
00DC1708    ADD ESP,30
00DC170B    CMP EAX,EDI
00DC170D    JNZ app18win.00DC18D4
00DC1713    PUSH DWORD PTR SS:[EBP-5C]          ; /stream
00DC1716    MOV EDI,DWORD PTR DS:[<&MSVCR90.fre>; |MSVCR90.fread
00DC171C    PUSH EBX                            ; |n
00DC171D    PUSH 1                              ; |size = 1
00DC171F    PUSH DWORD PTR DS:[ESI+24]          ; |ptr
00DC1722    CALL EDI                            ; \fread
00DC1724    ADD ESP,10
00DC1727    CMP EAX,EBX
00DC1729    JNZ app18win.00DC18D4
00DC172F    MOV EAX,DWORD PTR DS:[ESI+20]
00DC1732    CMP BYTE PTR DS:[EAX],0
00DC1735    JE app18win.00DC18D4
00DC173B    MOV ECX,DWORD PTR DS:[ESI+24]
00DC173E    CMP BYTE PTR DS:[ECX],0
00DC1741    JE app18win.00DC18D4
00DC1747    PUSH EAX                            ; /s
00DC1748    CALL <JMP.&MSVCR90.strlen>          ; \strlen
00DC174D    POP ECX
00DC174E    CMP EAX,DWORD PTR SS:[EBP-54]
00DC1751    JNZ app18win.00DC18D4
00DC1757    PUSH DWORD PTR DS:[ESI+24]          ; /s
00DC175A    CALL <JMP.&MSVCR90.strlen>          ; \strlen
00DC175F    POP ECX
00DC1760    CMP EAX,DWORD PTR SS:[EBP-58]
00DC1763    JNZ app18win.00DC18D4
00DC1769    PUSH DWORD PTR SS:[EBP-5C]
00DC176C    LEA EBX,DWORD PTR DS:[ESI+28]
00DC176F    PUSH 1B
00DC1771    PUSH 1
00DC1773    PUSH EBX
00DC1774    CALL EDI
00DC1776    ADD ESP,10
00DC1779    CMP EAX,1B
00DC177C    JNZ app18win.00DC18D4
00DC1782    XOR EAX,EAX
00DC1784    /CMP BYTE PTR DS:[EBX+EAX],0
00DC1788    |JNZ app18win.00DC1900
00DC178E    |CMP BYTE PTR DS:[EAX+ESI+39],0
00DC1793    |JNZ app18win.00DC1900
00DC1799    |INC EAX
00DC179A    |CMP EAX,0A
00DC179D    \JB SHORT app18win.00DC1784
00DC179F    LEA EAX,DWORD PTR DS:[ESI+32]
00DC17A2    PUSH app18win.00DC3330              ; /s2 = "HTS_NQ"
00DC17A7    PUSH EAX                            ; |s1
00DC17A8    CALL <JMP.&MSVCR90.strcmp>          ; \strcmp
00DC17AD    POP ECX
00DC17AE    POP ECX
00DC17AF    TEST EAX,EAX
00DC17B1    JNZ app18win.00DC18D4
00DC17B7    MOV BYTE PTR SS:[EBP+B8],AL
00DC17BD    LEA EDI,DWORD PTR SS:[EBP+B9]
00DC17C3    STOS DWORD PTR ES:[EDI]
00DC17C4    STOS DWORD PTR ES:[EDI]
00DC17C5    STOS BYTE PTR ES:[EDI]
00DC17C6    MOV EAX,DWORD PTR DS:[ESI+24]
00DC17C9    XOR EDI,EDI
00DC17CB    MOV DWORD PTR SS:[EBP-60],EDI
00DC17CE    MOV DWORD PTR SS:[EBP-64],EAX
00DC17D1    MOV DWORD PTR SS:[EBP-54],EDI
00DC17D4    /PUSH DWORD PTR DS:[ESI+20]         ; /s
00DC17D7    |XOR EBX,EBX                        ; |
00DC17D9    |CALL <JMP.&MSVCR90.strlen>         ; \strlen
00DC17DE    |POP ECX
00DC17DF    |TEST EAX,EAX
00DC17E1    |JBE SHORT app18win.00DC1827
00DC17E3    |/MOVSX ECX,BYTE PTR DS:[ESI+1C]
00DC17E7    ||MOVSX EAX,BYTE PTR DS:[ESI+1D]
00DC17EB    ||ADD EAX,ECX
00DC17ED    ||MOVSX ECX,BYTE PTR DS:[ESI+1E]
00DC17F1    ||ADD EAX,ECX
00DC17F3    ||SUB EDI,EAX
00DC17F5    ||LEA EAX,DWORD PTR DS:[ESI+4]
00DC17F8    ||PUSH EAX                          ; /s
00DC17F9    ||CALL DWORD PTR DS:[<&MSVCR90.atoi>; \atoi
00DC17FF    ||MOV ECX,DWORD PTR SS:[EBP-54]
00DC1802    ||PUSH DWORD PTR DS:[ESI+20]        ; /s
00DC1805    ||ADD EDI,EAX                       ; |
00DC1807    ||MOV EAX,DWORD PTR DS:[ESI+20]     ; |
00DC180A    ||MOVSX EAX,BYTE PTR DS:[EAX+EBX]   ; |
00DC180E    ||OR EDI,EAX                        ; |
00DC1810    ||MOV EAX,EDI                       ; |
00DC1812    ||SHR EAX,CL                        ; |
00DC1814    ||OR EAX,EBX                        ; |
00DC1816    ||XOR EDI,EAX                       ; |
00DC1818    ||IMUL EDI,EDI                      ; |
00DC181B    ||INC EBX                           ; |
00DC181C    ||CALL <JMP.&MSVCR90.strlen>        ; \strlen
00DC1821    ||POP ECX
00DC1822    ||POP ECX
00DC1823    ||CMP EBX,EAX
00DC1825    |\JB SHORT app18win.00DC17E3
00DC1827    |XOR EBX,EBX
00DC1829    |CMP DWORD PTR SS:[EBP-54],EBX
00DC182C    |JLE app18win.00DC18B2
00DC1832    |PUSH 10                            ; /radix = 10 (16.)
00DC1834    |LEA EAX,DWORD PTR SS:[EBP+B8]      ; |
00DC183A    |PUSH EAX                           ; |string
00DC183B    |PUSH EDI                           ; |value
00DC183C    |CALL DWORD PTR DS:[<&MSVCR90._itoa>; \_itoa
00DC1842    |LEA EAX,DWORD PTR SS:[EBP+B8]
00DC1848    |PUSH EAX                           ; /s
00DC1849    |MOV BYTE PTR SS:[EBP+C0],BL        ; |
00DC184F    |MOV BYTE PTR SS:[EBP-4D],BL        ; |
00DC1852    |MOV DWORD PTR SS:[EBP-58],EBX      ; |
00DC1855    |CALL <JMP.&MSVCR90.strlen>         ; \strlen
00DC185A    |ADD ESP,10
00DC185D    |TEST EAX,EAX
00DC185F    |JBE SHORT app18win.00DC18B2
00DC1861    |JMP SHORT app18win.00DC1866
00DC1863    |/MOV EBX,DWORD PTR SS:[EBP-58]
00DC1866    | CMP BYTE PTR SS:[EBP-4D],0
00DC186A    ||JNZ SHORT app18win.00DC1876
00DC186C    ||CMP BYTE PTR SS:[EBP+EBX+B8],30
00DC1874    ||JE SHORT app18win.00DC18B2
00DC1876    ||LEA EBX,DWORD PTR SS:[EBP+EBX+B8]
00DC187D    ||MOVSX EAX,BYTE PTR DS:[EBX]
00DC1880    ||PUSH EAX                          ; /c
00DC1881    ||MOV BYTE PTR SS:[EBP-4D],1        ; |
00DC1885    ||CALL DWORD PTR DS:[<&MSVCR90.toup>; \toupper
00DC188B    ||POP ECX
00DC188C    ||MOV ECX,DWORD PTR SS:[EBP-64]
00DC188F    ||INC DWORD PTR SS:[EBP-64]
00DC1892    ||MOV BYTE PTR DS:[EBX],AL
00DC1894    ||MOV CL,BYTE PTR DS:[ECX]
00DC1896    ||CMP CL,AL
00DC1898    ||JNZ SHORT app18win.00DC1900
00DC189A    ||INC DWORD PTR SS:[EBP-58]
00DC189D    ||INC DWORD PTR SS:[EBP-60]
00DC18A0    ||LEA EAX,DWORD PTR SS:[EBP+B8]
00DC18A6    ||PUSH EAX                          ; /s
00DC18A7    ||CALL <JMP.&MSVCR90.strlen>        ; \strlen
00DC18AC    ||POP ECX
00DC18AD    ||CMP DWORD PTR SS:[EBP-58],EAX
00DC18B0    |\JB SHORT app18win.00DC1863
00DC18B2    |INC DWORD PTR SS:[EBP-54]
00DC18B5    |CMP DWORD PTR SS:[EBP-54],32
00DC18B9    \JL app18win.00DC17D4
00DC18BF    PUSH DWORD PTR DS:[ESI+24]          ; /s
00DC18C2    CALL <JMP.&MSVCR90.strlen>          ; \strlen
00DC18C7    POP ECX
00DC18C8    CMP DWORD PTR SS:[EBP-60],EAX
00DC18CB    JNZ SHORT app18win.00DC1900
00DC18CD    MOV BYTE PTR DS:[DC5038],1
00DC18D4    PUSH DWORD PTR DS:[ESI+20]
00DC18D7    CALL <JMP.&MSVCR90.??_V@YAXPAX@Z>
00DC18DC    PUSH DWORD PTR DS:[ESI+24]
00DC18DF    CALL <JMP.&MSVCR90.??_V@YAXPAX@Z>
00DC18E4    POP ECX
00DC18E5    POP ECX
00DC18E6    PUSH DWORD PTR SS:[EBP-5C]          ; /stream
00DC18E9    CALL DWORD PTR DS:[<&MSVCR90.fclose>; \fclose
00DC18EF    POP ECX
00DC18F0    JMP SHORT app18win.00DC18F9
00DC18F2    MOV BYTE PTR DS:[DC5038],0
00DC18F9    PUSH ESI
00DC18FA    CALL <JMP.&MSVCR90.??3@YAXPAX@Z>
00DC18FF    POP ECX
00DC1900    MOV ECX,DWORD PTR SS:[EBP+C4]
00DC1906    POP EDI
00DC1907    POP ESI
00DC1908    XOR ECX,EBP
00DC190A    POP EBX
00DC190B    CALL app18win.00DC1F9C
00DC1910    ADD EBP,0C8
00DC1916    LEAVE
00DC1917    RETN
