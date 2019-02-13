;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Demetrios Doumas  Project1 ASCII Table
;http://www.cdrummond.qc.ca/cegep/informat/professeurs/alain/files/ascii.htm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   .MODEL small
   .STACK 100h

   .DATA
    begintext db "ASCII TABLE BY DEMETRIOS DOUMAS"
    headerstring db "DEC | HEX | CHAR || DEC | HEX | CHAR | DEC | HEX | CHAR || DEC | HEX | CHAR"
     headerstring2 db "DEC | HEX | CHAR |"

    decList db "0123456789"
    hexList db "ABCDEF"

    


    PageArray dw 4 (( 25*160) )
    savedScr dw 25*160 dup(?)


    promptpg1 db " Next page Press <n> or Quit <q>"
    promptpg2 db " Previous page Press <p>     Next page Press <n>     Quit <q>"
    promptpg4 db " Prev page Press <p> or Quit <q>"

.CODE
   .startup
   prev:
         ;; clear screen
        ;clrScr proc
        mov     di, 0           ; Begin pointer at row 0 and column 0
        mov     cx, 4000 ;25*160
        mov     ax, 0B800h      
        mov     es, ax
       f: mov     es:[di], 2120h  
        add     di, 2 ; Update pointer to next character position
        loop f
        ;ret
       
        ; clrScr endp
        
   


   ;makeTable proc     
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  Title
   sub bx,bx
   mov ax, 0B800h      ; Set up ES to point to video segment
   mov es, ax
                    ;jmp over
                     ;begintext db "ASCII TABLE BY DEMETRIOS DOUMAS"
                      ;over:
   mov cx, 31
   sub si, si
   sub di,di
   .l:
   mov ah,  00100001b
   mov al, begintext[si] ;CS: begintext[si]

   mov es:[bx], ax
   add si,1
   add bx,2
   dec cx
   jnz short .l
    
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; Print header string
   mov bx, 484
   mov cx, 75
   sub si, si
   sub di,di
   L2:
   mov ah,  00100001b
   mov al, headerstring[si]                        ;CS: begintext[si]
   mov es:[bx], ax
   add si,1
   add bx,2
   dec cx
   jnz short L2
    



   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   mov es:[160], 21DAh  ; left corner table
   ;first row stright line
   mov bx, 162
   w:  mov es:[bx], 21C4h
      add bx, 2
      cmp bx, 318
       JNE w
       
   mov es:[318], 21BFh  ; right corner table

   ;;;;;;;;;;;;;;;;;;;;;;
   ; The left line in the table
   mov bx, 320
   w3:mov es:[bx], 21B3h
    add bx,160
    cmp bx,3840
    jNE w3
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; The right line in the table
   mov bx, 478
   w4: mov es:[bx], 21B3h
    add bx,160
    cmp bx,3998
    jNE w4
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    mov es:[322], 21DAh  ; inner left corner table
    mov es:[476], 21BFh  ; inner right corner table

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Second row stright line
    mov bx, 324
    w5: mov es:[bx], 21C4h
     add bx,2
     cmp bx, 476
     jNE w5
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;inner first line in the table 
    mov bx, 482         
    w6: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3842
    JNE w6
 
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;inner second line in the table
    mov bx, 652
    w8:mov es:[bx], 21B3h
    add bx, 160
    cmp bx,3852
    jNE w8 
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;inner third line in the table
    mov bx, 664
    w9: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3864
    jNE w9 
    ;inner fourth line in the table
    mov bx, 678
    wt: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3878
    jNE wt
    ;inner fifth line in the table
    mov bx, 680
    wy: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3880
    jNE wy 
    ;inner six line in the table
    mov bx, 692
    wu: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3892
    jNE wu
     ;inner seven line in the table
    mov bx, 704
    wi: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3904
    jNE wi
    ;inner eight line in the table
    mov bx, 718
    wo: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3918
    jNE wo
    ;inner ninth line in the table
    mov bx, 730
    wp: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3930
    jNE wp
     ;inner tenth line in the table
    mov bx, 742
    wl: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3942
    jNE wl
    ;inner 11th line in the table
    mov bx, 756
    wm: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3956
    jNE wm
      ;inner 12th line in the table
    mov bx, 758
    wn: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3958
    jNE wn

     ;inner 13th line in the table
    mov bx, 770
    wv: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3970
    jNE wv
    
     ;inner 14th line in the table
    mov bx, 782
    wc: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3982
    jNE wc
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;inner last line in the table
    mov bx, 636
    w7: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3996
    jnz w7 
    ;ret
    ;makeTable endp


   mov si, 0  
   mov bx, 3840
   mov ah,  01110001b
   wnm:mov al, promptpg1[si] 
   mov es:[bx], al
   add bx,2
   add si,1
   cmp si,32
   jne wnm







;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; printing integers

  ; 1st column of Dec
   mov bx, 648
   sub si,si
   mov ah,  00110001b
   a:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2248
   jNE a
   
   mov bx, 2248
   sub si,si
   mov ah,  00110001b
   as:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3848
   jNE as

   mov bx, 2246
   sub si,si
   mov ah,  00110001b
   ad:mov al, '1'  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3846
   jNE ad
   
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;2nd column of Dec
   mov bx, 688
   sub si,si
   mov ah,  00110001b
   aq:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2288
   jNE aq
   
   mov bx, 2288
   sub si,si
   mov ah,  00110001b
   aw:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3888
   jNE aw

   mov bx, 686
   sub si,si
   mov ah,  00110001b
   ae:mov al, '2'  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2286
   jNE ae

   mov bx, 2286
   sub si,si
   mov ah,  00110001b
   ar:mov al, '3' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3886
   jNE ar

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;3nd column of Dec
   mov bx, 726
   sub si,si
   mov ah,  00110001b
   at:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2326
   jNE at
   
   mov bx, 2326
   sub si,si
   mov ah,  00110001b
   ay:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3926
   jNE ay

   mov bx, 724
   sub si,si
   mov ah,  00110001b
   au:mov al, '4'  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2324
   jNE au

   mov bx, 2324
   sub si,si
   mov ah,  00110001b
   ai:mov al, '5' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3924
   jNE ai
   
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;4nd column of Dec
   mov bx, 766
   sub si,si
   mov ah,  00110001b
   ao:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2366
   jNE ao
   
   mov bx, 2366
   sub si,si
   mov ah,  00110001b
   ap:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3966
   jNE ap

   mov bx, 764
   sub si,si
   mov ah,  00110001b
   af:mov al, '6'  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2364
   jNE af

   mov bx, 2364
   sub si,si
   mov ah,  00110001b
   ag:mov al, '7' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3964
   jNE ag


   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; printing Hex 
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Hex for column 1
   mov bx, 660
   sub si,si
   mov ah,  00110001b
   an:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2260
   jNE an
 
   mov bx, 2260
   sub si,si
   mov ah,  00110001b
   ab:mov al, hexList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3220
   jNE ab

   mov bx, 3220
   sub si,si
   mov ah,  00110001b
   q:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3860
   jNE q

   mov bx, 658
   sub si,si
   mov ah,  00110001b
   qw:mov al, '0' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3218
   jNE qw

   mov bx, 3218
   sub si,si
   mov ah,  00110001b
   qe:mov al, '1' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3858
   jNE qe

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Hex for column 2
   mov bx, 700
   sub si,si
   mov si, 4
   mov ah,  00110001b
   qr:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 1660
   jNE qr
 
   mov bx, 1660
   sub si,si
   mov ah,  00110001b
   qt:mov al, hexList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3100
   jNE qt

   mov bx, 2620
   sub si,si
   mov ah,  00110001b
   qy:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3900
   jNE qy

   mov bx, 698
   sub si,si
   mov ah,  00110001b
   qu:mov al, '1' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3258
   jNE qu

   mov bx, 2618
   sub si,si
   mov ah,  00110001b
   qi:mov al, '2' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3898
   jNE qi

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Hex for column 3
   mov bx, 738
   sub si,si
   mov si, 8
   mov ah,  00110001b
   qo:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 1058
   jNE qo
 
   mov bx, 1058
   sub si,si
   mov ah,  00110001b
   qp:mov al, hexList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2018
   jNE qp

   mov bx, 2018
   sub si,si
   mov ah,  00110001b
   qs:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3618
   jNE qs

   mov bx, 736
   sub si,si
   mov ah,  00110001b
   qd:mov al, '2' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2016
   jNE qd

   mov bx, 2016
   sub si,si
   mov ah,  01110001b
   qf:mov al, '3' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3936
   jNE qf

   mov bx, 3618
   sub si,si
   mov ah,  00110001b
   qg:mov al, hexList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3938
   jNE qg
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Hex for column 4

   mov bx, 778
   sub si,si
   mov si, 2
   mov ah,  00110001b
   qk:mov al, hexList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 1578
   jNE qk

   mov bx, 1418
   sub si,si
   mov ah,  00110001b
   ql:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3018
   jNE ql

   mov bx, 3018
   sub si,si
   mov ah,  00110001b
   qz:mov al, hexList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3978
   jNE qz

   mov bx, 776
   sub si,si
   mov ah,  00110001b
   qx:mov al, '3' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 1416
   jNE qx

   mov bx, 1416
   sub si,si
   mov ah,  01110001b
   qj:mov al, '4' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3976
   jNE qj



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  char  page 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;char for column3
    mov bx, 752
      mov ah, 00100001b
      mov al, '('
      mov cx, 0
   j: mov es:[bx], ax
   add bx, 160
   add al,1
   inc cx
   cmp cx, 20
   JNE j
   
;char for column4
    mov bx, 792
      mov ah, 00100001b
      mov al, '<'
      mov cx, 0
   kl: mov es:[bx], ax
   add bx, 160
   add al,1
   inc cx
   cmp cx, 20
   JNE kl
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; save screen
   ;mov cx, 4000
   ;sub bx,bx
   ;mov ax, 0B800h
   ;mov es, ax
  ;h: mov ax, es:[bx]
  ; mov savedScr[bx],ax
  ; add bx,2
  ; dec cx
  ; loop h
  ; mov di,0
  ; mov ax, savedScr
  ; mov PageArray[di],ax
   

   ;; clear screen for page 2
   ;  mov     di, 0           ; Begin pointer at row 0 and column 0
   ;     mov     cx, 4000 ;25*160
   ;     mov     ax, 0B800h      
   ;     mov     es, ax
   ;    fl: mov     es:[di], 2120h  
   ;     add     di, 2 ; Update pointer to next character position
   ;     loop fl

  ;input
   jmp input

 input:                           ; read a key
    
      mov ah, 07                  ; wait for keyboard input
      int 21h
      mov bh, al                                                       
      cmp bh, 'n'                  ; if input is n, then go to next page
      je next
      cmp bh, 'q'                  ; if input is esc, then quit program
      je quit
      jmp input                   ; if any other key is pressed, wait for another key

quit:
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   int 16h
   mov  ah,4ch                 ;DOS terminate program function
   int  21h                    ;terminate the program
 

;Page 2 starts below
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  next:
  prev2:
   ;; clear screen for page 2
     mov     di, 0           ; Begin pointer at row 0 and column 0
        mov     cx, 4000 ;25*160
        mov     ax, 0B800h      
        mov     es, ax
       fl: mov     es:[di], 2120h  
        add     di, 2 ; Update pointer to next character position
        loop fl


        

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  Title
   sub bx,bx
   mov ax, 0B800h      ; Set up ES to point to video segment
   mov es, ax
                    ;jmp over
                     ;begintext db "ASCII TABLE BY DEMETRIOS DOUMAS"
                      ;over:
   mov cx, 31
   sub si, si
   sub di,di
   .lw:
   mov ah,  00100001b
   mov al, begintext[si] ;CS: begintext[si]

   mov es:[bx], ax
   add si,1
   add bx,2
   dec cx
   jnz short .lw
    
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; Print header string
   mov bx, 484
   mov cx, 75
   sub si, si
   sub di,di
   L2w:
   mov ah,  00100001b
   mov al, headerstring[si]                        ;CS: begintext[si]
   mov es:[bx], ax
   add si,1
   add bx,2
   dec cx
   jnz short L2w
    



   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   mov es:[160], 21DAh  ; left corner table
   ;first row stright line
   mov bx, 162
   ww:  mov es:[bx], 21C4h
      add bx, 2
      cmp bx, 318
       JNE ww
       
   mov es:[318], 21BFh  ; right corner table

   ;;;;;;;;;;;;;;;;;;;;;;
   ; The left line in the table
   mov bx, 320
   w3q:mov es:[bx], 21B3h
    add bx,160
    cmp bx,3840
    jNE w3q
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; The right line in the table
   mov bx, 478
   w4q: mov es:[bx], 21B3h
    add bx,160
    cmp bx,3998
    jNE w4q
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    mov es:[322], 21DAh  ; inner left corner table
    mov es:[476], 21BFh  ; inner right corner table

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Second row stright line
    mov bx, 324
    w5u: mov es:[bx], 21C4h
     add bx,2
     cmp bx, 476
     jNE w5u
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;inner first line in the table 
    mov bx, 482         
    w6u: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3842
    JNE w6u
 
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;inner second line in the table
    mov bx, 652
    w8u:mov es:[bx], 21B3h
    add bx, 160
    cmp bx,3852
    jNE w8u 
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;inner third line in the table
    mov bx, 664
    w9q: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3864
    jNE w9q 
    ;inner fourth line in the table
    mov bx, 678
    wtq: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3878
    jNE wtq
    ;inner fifth line in the table
    mov bx, 680
    wyq: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3880
    jNE wyq 
    ;inner six line in the table
    mov bx, 692
    wuq: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3892
    jNE wuq
     ;inner seven line in the table
    mov bx, 704
    wiq: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3904
    jNE wiq
    ;inner eight line in the table
    mov bx, 718
    woq: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3918
    jNE woq
    ;inner ninth line in the table
    mov bx, 730
    wpq: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3930
    jNE wpq
     ;inner tenth line in the table
    mov bx, 742
    wlq: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3942
    jNE wlq
    ;inner 11th line in the table
    mov bx, 756
    wmq: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3956
    jNE wmq
      ;inner 12th line in the table
    mov bx, 758
    wnq: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3958
    jNE wnq

     ;inner 13th line in the table
    mov bx, 770
    wvq: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3970
    jNE wvq
    
     ;inner 14th line in the table
    mov bx, 782
    wcq: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3982
    jNE wcq
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;inner last line in the table
    mov bx, 636
    w7q: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3996
    jnz w7q 


   ;; second prompt message
    mov si, 0  
   mov bx, 3840
   mov ah,  01110001b
   m:mov al, promptpg2[si] 
   mov es:[bx], al
   add bx,2
   add si,1
   cmp si,62
   jne m


; Iterating DEC again
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; 1st column of Dec
   mov bx, 648
   sub si,si
   mov ah,  00110001b
   aeg:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2248
   jNE aeg

   mov bx, 646
   sub si,si
   mov ah,  00110001b
   ash:mov al, '8'
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2246
   jNE ash

 
   mov bx, 2248
   sub si,si
   mov ah,  00110001b
   ase:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3848
   jNE ase

   mov bx, 2246
   sub si,si
   mov ah,  00110001b
   ade:mov al, '9'  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3846
   jNE ade

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;2nd column of Dec
   mov bx, 688
   sub si,si
   mov ah,  00110001b
   aqh:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2288
   jNE aqh
   
   mov bx, 2288
   sub si,si
   mov ah,  00110001b
   awh:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3888
   jNE awh

   mov bx, 686
   sub si,si
   mov ah,  00110001b
   aeh:mov al, '0'  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2286
   jNE aeh

   mov bx, 2286
   sub si,si
   mov ah,  00110001b
   arh:mov al, '1' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3886
   jNE arh

   mov bx, 684
   sub si,si
   mov ah,  00110001b
   arhe:mov al, '1' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3884
   jNE arhe

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;3nd column of Dec
   mov bx, 726
   sub si,si
   mov ah,  00110001b
   atg:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2326
   jNE atg
   
   mov bx, 2326
   sub si,si
   mov ah,  00110001b
   ayg:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3926
   jNE ayg

   mov bx, 724
   sub si,si
   mov ah,  00110001b
   aug:mov al, '2'  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2324
   jNE aug

   mov bx, 2324
   sub si,si
   mov ah,  00110001b
   aig:mov al, '3' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3924
   jNE aig

   mov bx, 722
   sub si,si
   mov ah,  00110001b
   aik:mov al, '1' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3922
   jNE aik

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;4nd column of Dec
   mov bx, 766
   sub si,si
   mov ah,  00110001b
   aog:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2366
   jNE aog
   
   mov bx, 2366
   sub si,si
   mov ah,  00110001b
   apg:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3966
   jNE apg

   mov bx, 764
   sub si,si
   mov ah,  00110001b
   afg:mov al, '4'  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2364
   jNE afg

   mov bx, 2364
   sub si,si
   mov ah,  00110001b
   agg:mov al, '5' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3964
   jNE agg

   mov bx, 762
   sub si,si
   mov ah,  00110001b
   aid:mov al, '1' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3962
   jNE aid

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; printing Hex 
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Hex for column 1
   mov bx, 660
   sub si,si
   mov ah,  00110001b
   anf:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2260
   jNE anf
 
   mov bx, 2260
   sub si,si
   mov ah,  00110001b
   abf:mov al, hexList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3220
   jNE abf

   mov bx, 3220
   sub si,si
   mov ah,  00110001b
   qkg:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3860
   jNE qkg

   mov bx, 658
   sub si,si
   mov ah,  00110001b
   qwf:mov al, '5' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3218
   jNE qwf

   mov bx, 3218
   sub si,si
   mov ah,  00110001b
   qef:mov al, '6' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3858
   jNE qef

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Hex for column 2
   mov bx, 700
   sub si,si
   mov si, 4
   mov ah,  00110001b
   bqr:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 1660
   jNE bqr
 
   mov bx, 1660
   sub si,si
   mov ah,  00110001b
   bqt:mov al, hexList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3100
   jNE bqt

   mov bx, 2620
   sub si,si
   mov ah,  00110001b
   bqy:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3900
   jNE bqy

   mov bx, 698
   sub si,si
   mov ah,  00110001b
   bqu:mov al, '6' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3258
   jNE bqu

   mov bx, 2618
   sub si,si
   mov ah,  00110001b
   bqi:mov al, '7' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3898
   jNE bqi

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Hex for column 3
   mov bx, 738
   sub si,si
   mov si, 8
   mov ah,  00110001b
   vqo:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 1058
   jNE vqo
 
   mov bx, 1058
   sub si,si
   mov ah,  00110001b
   vqp:mov al, hexList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2018
   jNE vqp

   mov bx, 2018
   sub si,si
   mov ah,  00110001b
   vqs:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3618
   jNE vqs

   mov bx, 736
   sub si,si
   mov ah,  00110001b
   vqd:mov al, '7' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2016
   jNE vqd

   mov bx, 2016
   sub si,si
   mov ah,  01110001b
   vqf:mov al, '8' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3936
   jNE vqf

   mov bx, 3618
   sub si,si
   mov ah,  00110001b
   vqg:mov al, hexList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3938
   jNE vqg

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Hex for column 4

   mov bx, 778
   sub si,si
   mov si, 2
   mov ah,  00110001b
   dqk:mov al, hexList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 1578
   jNE dqk

   mov bx, 1418
   sub si,si
   mov ah,  00110001b
   dql:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3018
   jNE dql

   mov bx, 3018
   sub si,si
   mov ah,  00110001b
   dqz:mov al, hexList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3978
   jNE dqz

   mov bx, 776
   sub si,si
   mov ah,  00110001b
   dqx:mov al, '8' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 1416
   jNE dqx

   mov bx, 1416
   sub si,si
   mov ah,  01110001b
   dqj:mov al, '9' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3976
   jNE dqj

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  char  page 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 


;char for column1
    mov bx, 674
      mov ah, 00100001b
      mov al, 'P'
      mov cx, 0
   ju: mov es:[bx], ax
   add bx, 160
   add al,1
   inc cx
   cmp cx, 20
   JNE ju
   
;char for column2
    mov bx, 714
      mov ah, 00100001b
      mov al, 'd'
      mov cx, 0
   klu: mov es:[bx], ax
   add bx, 160
   add al,1
   inc cx
   cmp cx, 20
   JNE klu

 ;char for column3
    mov bx, 752
      mov ah, 00100001b
      mov al, 'x'
      mov cx, 0
   mj: mov es:[bx], ax
   add bx, 160
   add al,1
   inc cx
   cmp cx, 20
   JNE mj

 ;char for column4
    mov bx, 792
      mov ah, 00100001b
      mov al, 8Ch
      mov cx, 0
   rj: mov es:[bx], ax
   add bx, 160
   add al,1
   inc cx
   cmp cx, 20
   JNE rj

 ;input
   jmp input2

 input2:                           ; read a key
    
      mov ah, 07                  ; wait for keyboard input
      int 21h
      mov bh, al
      cmp bh, 'n'                  ; if input is n, then go to next page
      je next2
      cmp bh, 'q'                  ; if input is esc, then quit program
      jmp quit2
      cmp bh, 'p'
      jmp prev                                                       
      
      jmp input2                   ; if any other key is pressed, wait for another key


   quit2:
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   int 16h
   mov  ah,4ch                 ;DOS terminate program function
   int  21h                    ;terminate the program




;; Page3 below
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
next2:

prev4:
  ;; clear screen for page 3
     mov     di, 0           ; Begin pointer at row 0 and column 0
        mov     cx, 4000 ;25*160
        mov     ax, 0B800h      
        mov     es, ax
       fe: mov     es:[di], 2120h  
        add     di, 2 ; Update pointer to next character position
        loop fe


        

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  Title
   sub bx,bx
   mov ax, 0B800h      ; Set up ES to point to video segment
   mov es, ax
   mov cx, 31
   sub si, si
   sub di,di
   .lkj:
   mov ah,  00100001b
   mov al, begintext[si] ;CS: begintext[si]

   mov es:[bx], ax
   add si,1
   add bx,2
   dec cx
   jnz short .lkj
    
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; Print header string
   mov bx, 484
   mov cx, 75
   sub si, si
   sub di,di
   Lyt:
   mov ah,  00100001b
   mov al, headerstring[si]              
   mov es:[bx], ax
   add si,1
   add bx,2
   dec cx
   jnz short Lyt

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   mov es:[160], 21DAh  ; left corner table
   ;first row stright line
   mov bx, 162
   wwj:  mov es:[bx], 21C4h
      add bx, 2
      cmp bx, 318
       JNE wwj
       
   mov es:[318], 21BFh  ; right corner table

   ;;;;;;;;;;;;;;;;;;;;;;
   ; The left line in the table
   mov bx, 320
   w3j:mov es:[bx], 21B3h
    add bx,160
    cmp bx,3840
    jNE w3j
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; The right line in the table
   mov bx, 478
   w4g: mov es:[bx], 21B3h
    add bx,160
    cmp bx,3998
    jNE w4g
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    mov es:[322], 21DAh  ; inner left corner table
    mov es:[476], 21BFh  ; inner right corner table

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Second row stright line
    mov bx, 324
    w5h: mov es:[bx], 21C4h
     add bx,2
     cmp bx, 476
     jNE w5h
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;inner first line in the table 
    mov bx, 482         
    w6t: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3842
    JNE w6t
 
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;inner second line in the table
    mov bx, 652
    w8w:mov es:[bx], 21B3h
    add bx, 160
    cmp bx,3852
    jNE w8w 
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;inner third line in the table
    mov bx, 664
    w9t: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3864
    jNE w9t 
    ;inner fourth line in the table
    mov bx, 678
    wtj: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3878
    jNE wtj
    ;inner fifth line in the table
    mov bx, 680
    wyp: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3880
    jNE wyp 
    ;inner six line in the table
    mov bx, 692
    wuu: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3892
    jNE wuu
     ;inner seven line in the table
    mov bx, 704
    wir: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3904
    jNE wir
    ;inner eight line in the table
    mov bx, 718
    wuy: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3918
    jNE wuy
    ;inner ninth line in the table
    mov bx, 730
    wpl: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3930
    jNE wpl
     ;inner tenth line in the table
    mov bx, 742
    wlk: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3942
    jNE wlk
    ;inner 11th line in the table
    mov bx, 756
    wmk: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3956
    jNE wmk
      ;inner 12th line in the table
    mov bx, 758
    wnh: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3958
    jNE wnh

     ;inner 13th line in the table
    mov bx, 770
    wvy: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3970
    jNE wvy
    
     ;inner 14th line in the table
    mov bx, 782
    wce: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3982
    jNE wce
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; last line in the table
    mov bx, 636
    w7w: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3996
    jnz w7w 



    ; Iterating DEC again
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; 1st column of Dec
   mov bx, 648
   sub si,si
   mov ah,  00110001b
   aej:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2248
   jNE aej

    mov bx, 646
   sub si,si
   mov ah,  00110001b
   asq:mov al, '6'
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2246
   jNE asq

 
  mov bx, 2248
   sub si,si
   mov ah,  00110001b
   asy:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3848
   jNE asy

   mov bx, 2246
   sub si,si
   mov ah,  00110001b
   adw:mov al, '7'  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3846
   jNE adw

   mov bx, 644
   sub si,si
   mov ah,  00110001b
   adr:mov al, '1'  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3844
   jNE adr

       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;2nd column of Dec
   mov bx, 688
   sub si,si
   mov ah,  00110001b
   aqhf:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2288
   jNE aqhf
   
   mov bx, 2288
   sub si,si
   mov ah,  00110001b
   awhgh:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3888
   jNE awhgh

   mov bx, 686
   sub si,si
   mov ah,  00110001b
   aehkl:mov al, '8'  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2286
   jNE aehkl

   mov bx, 2286
   sub si,si
   mov ah,  00110001b
   arhj:mov al, '9' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3886
   jNE arhj

   mov bx, 684
   sub si,si
   mov ah,  00110001b
   arhej:mov al, '1' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3884
   jNE arhej

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;3nd column of Dec
   mov bx, 726
   sub si,si
   mov ah,  00110001b
   aty:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2326
   jNE aty
   
   mov bx, 2326
   sub si,si
   mov ah,  00110001b
   aerj:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3926
   jNE aerj

   mov bx, 724
   sub si,si
   mov ah,  00110001b
   att:mov al, '0'  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2324
   jNE att

   mov bx, 2324
   sub si,si
   mov ah,  00110001b
   aer:mov al, '1' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3924
   jNE aer

   mov bx, 722
   sub si,si
   mov ah,  00110001b
   alkf:mov al, '2' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3922
   jNE alkf

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;4nd column of Dec
   mov bx, 766
   sub si,si
   mov ah,  00110001b
   akg:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2366
   jNE akg
   
   mov bx, 2366
   sub si,si
   mov ah,  00110001b
   apd:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3966
   jNE apd

   mov bx, 764
   sub si,si
   mov ah,  00110001b
   afj:mov al, '2'  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2364
   jNE afj

   mov bx, 2364
   sub si,si
   mov ah,  00110001b
   acg:mov al, '3' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3964
   jNE acg

   mov bx, 762
   sub si,si
   mov ah,  00110001b
   vc:mov al, '2' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3962
   jNE vc



      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; printing Hex 
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Hex for column 1
   mov bx, 660
   sub si,si
   mov ah,  00110001b
   anfq:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2260
   jNE anfq
 
   mov bx, 2260
   sub si,si
   mov ah,  00110001b
   abfg:mov al, hexList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3220
   jNE abfg

   mov bx, 3220
   sub si,si
   mov ah,  00110001b
   qkgd:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3860
   jNE qkgd

   mov bx, 658
   sub si,si
   mov ah,  00110001b
   qwfd:mov al, 'A' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3218
   jNE qwfd

   mov bx, 3218
   sub si,si
   mov ah,  00110001b
   qefd:mov al, 'B' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3858
   jNE qefd

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Hex for column 2
   mov bx, 700
   sub si,si
   mov si, 4
   mov ah,  00110001b
   bqd:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 1660
   jNE bqd
 
   mov bx, 1660
   sub si,si
   mov ah,  00110001b
   bqth:mov al, hexList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3100
   jNE bqth

   mov bx, 2620
   sub si,si
   mov ah,  00110001b
   bqyh:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3900
   jNE bqyh

   mov bx, 698
   sub si,si
   mov ah,  00110001b
   bqug:mov al, 'B' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3258
   jNE bqug

   mov bx, 2618
   sub si,si
   mov ah,  00110001b
   bqig:mov al, 'C' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3898
   jNE bqig

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Hex for column 3
   mov bx, 738
   sub si,si
   mov si, 8
   mov ah,  00110001b
   vqog:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 1058
   jNE vqog
 
   mov bx, 1058
   sub si,si
   mov ah,  00110001b
   vqpg:mov al, hexList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2018
   jNE vqpg

   mov bx, 2018
   sub si,si
   mov ah,  00110001b
   vqsg:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3618
   jNE vqsg

   mov bx, 736
   sub si,si
   mov ah,  00110001b
   vqdg:mov al, 'C' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2016
   jNE vqdg

   mov bx, 2016
   sub si,si
   mov ah,  01110001b
   vqfg:mov al, 'D' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3936
   jNE vqfg

   mov bx, 3618
   sub si,si
   mov ah,  00110001b
   vqgg:mov al, hexList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3938
   jNE vqgg

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Hex for column 4

   mov bx, 778
   sub si,si
   mov si, 2
   mov ah,  00110001b
   dqkg:mov al, hexList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 1578
   jNE dqkg

   mov bx, 1418
   sub si,si
   mov ah,  00110001b
   dqlg:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3018
   jNE dqlg

   mov bx, 3018
   sub si,si
   mov ah,  00110001b
   dqzg:mov al, hexList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3978
   jNE dqzg

   mov bx, 776
   sub si,si
   mov ah,  00110001b
   dqxg:mov al, 'D' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 1416
   jNE dqxg

   mov bx, 1416
   sub si,si
   mov ah,  01110001b
   dqjg:mov al, 'E' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3976
   jNE dqjg

   ;; Third prompt message
    mov si, 0  
   mov bx, 3840
   mov ah,  01110001b
   mt:mov al, promptpg2[si] 
   mov es:[bx], al
   add bx,2
   add si,1
   cmp si,62
   jne mt

      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  char  page 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 


;char for column1
    mov bx, 674
      mov ah, 00100001b
      mov ax, 21A0h
     
      mov cx, 0
   fju: mov es:[bx], ax
   add bx, 160
   add ax,1
   inc cx
   cmp cx, 20
   JNE fju
   
;char for column2
    mov bx, 714
      mov ah, 00100001b
      mov ax, 21B4h
      mov cx, 0
   fklu: mov es:[bx], ax
   add bx, 160
   add ax,1
   inc cx
   cmp cx, 20
   JNE fklu

 ;char for column3
    mov bx, 752
      mov ah, 00100001b
      mov ax, 21C8h
      mov cx, 0
   fmj: mov es:[bx], ax
   add bx, 160
   add ax,1
   inc cx
   cmp cx, 20
   JNE fmj

 ;char for column4
    mov bx, 792
      mov ah, 00100001b
      mov ax, 21DCh
      mov cx, 0
   frj: mov es:[bx], ax
   add bx, 160
   add ax,1
   inc cx
   cmp cx, 20
   JNE frj


   ;input
   jmp input3

 input3:                           ; read a key
    
      mov ah, 07                  ; wait for keyboard input
      int 21h
      mov bh, al
      cmp bh, 'n'                  ; if input is n, then go to next page
      je next3
      cmp bh, 'q'                  ; if input is esc, then quit program
      jmp quit3
      cmp bh, 'p'
      jmp prev2                                                       
      
      jmp input3                   ; if any other key is pressed, wait for another key


   quit3:
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   int 16h
   mov  ah,4ch                 ;DOS terminate program function
   int  21h                    ;terminate the program

   next3:

   ;; Page4 below
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



  ;; clear screen for page 3
     mov     di, 0           ; Begin pointer at row 0 and column 0
        mov     cx, 4000 ;25*160
        mov     ax, 0B800h      
        mov     es, ax
       fer: mov     es:[di], 2120h  
        add     di, 2 ; Update pointer to next character position
        loop fer


        

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  Title
   sub bx,bx
   mov ax, 0B800h      ; Set up ES to point to video segment
   mov es, ax
   mov cx, 31
   sub si, si
   sub di,di
   .lktj:
   mov ah,  00100001b
   mov al, begintext[si] ;CS: begintext[si]

   mov es:[bx], ax
   add si,1
   add bx,2
   dec cx
   jnz short .lktj
    
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; Print header string
   mov bx, 484
   mov cx, 18
   sub si, si
   sub di,di
   Lyte:
   mov ah,  00100001b
   mov al, headerstring2[si]              
   mov es:[bx], ax
   add si,1
   add bx,2
   dec cx
   jnz short Lyte

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   mov es:[160], 21DAh  ; left corner table
   ;first row stright line
   mov bx, 162
   wwjq:  mov es:[bx], 21C4h
      add bx, 2
      cmp bx, 318
       JNE wwjq
       
   mov es:[318], 21BFh  ; right corner table

   ;;;;;;;;;;;;;;;;;;;;;;
   ; The left line in the table
   mov bx, 320
   w3je:mov es:[bx], 21B3h
    add bx,160
    cmp bx,3840
    jNE w3je
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; The right line in the table
   mov bx, 478
   w4gr: mov es:[bx], 21B3h
    add bx,160
    cmp bx,3998
    jNE w4gr
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    mov es:[322], 21DAh  ; inner left corner table
    mov es:[476], 21BFh  ; inner right corner table

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Second row stright line
    mov bx, 324
    w5hr: mov es:[bx], 21C4h
     add bx,2
     cmp bx, 476
     jNE w5hr
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;inner first line in the table 
    mov bx, 482         
    gw6t: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3842
    JNE gw6t
 
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;inner second line in the table
    mov bx, 652
    rw8w:mov es:[bx], 21B3h
    add bx, 160
    cmp bx,3852
    jNE rw8w 
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;inner third line in the table
    mov bx, 664
    w9tc: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3864
    jNE w9tc 
    ;inner fourth line in the table
    mov bx, 678
    wtjj: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3878
    jNE wtjj


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; last line in the table
    mov bx, 636
    w7wz: mov es:[bx], 21B3h
    add bx, 160
    cmp bx, 3996
    jnz w7wz 


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; 1st column of Dec
   mov bx, 648
   sub si,si
   mov ah,  00110001b
   qaej:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2248
   jNE qaej

    mov bx, 646
   sub si,si
   mov ah,  00110001b
   asqq:mov al, '4'
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2246
   jNE asqq

 
  mov bx, 2248
   sub si,si
   mov ah,  00110001b
   qasy:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3208
   jNE qasy

   mov bx, 2246
   sub si,si
   mov ah,  00110001b
   qadw:mov al, '5'  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3206
   jNE qadw

   mov bx, 644
   sub si,si
   mov ah,  00110001b
   adrq:mov al, '2'  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3204
   jNE adrq

    
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Hex for column 1
   mov bx, 660
   sub si,si
   mov ah,  00110001b
   ranfq:mov al, decList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 2260
   jNE ranfq
 
   mov bx, 2260
   sub si,si
   mov ah,  00110001b
   aabfg:mov al, hexList[si]  
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3220
   jNE aabfg

   mov bx, 658
   sub si,si
   mov ah,  00110001b
   qqwfd:mov al, 'F' 
   mov es:[bx], al
   inc si
   add bx,160
   cmp bx, 3218
   jNE qqwfd

   ;char for column1
    mov bx, 674
      mov ah, 00100001b
      mov ax, 21F0h
      mov cx, 0
   fjur: mov es:[bx], ax
   add bx, 160
   add ax,1
   inc cx
   cmp cx, 25
   JNE fjur

    ;mov WORD PTR es:[3360], 21FFh
    
   ;; last prompt message
    mov si, 0  
   mov bx, 3840
   mov ah,  01110001b
   mw:mov al, promptpg4[si] 
   mov es:[bx], al
   add bx,2
   add si,1
   cmp si,62
   jne mw   


   ;input
   jmp input4

 input4:                           ; read a key
    
      mov ah, 07                  ; wait for keyboard input
      int 21h
      mov bh, al
      cmp bh, 'q'                  ; if input is esc, then quit program
      jmp quit4
      cmp bh, 'p'
      jmp prev4                                                       
      
      jmp input4                   ; if any other key is pressed, wait for another key


   quit4:
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   int 16h
   mov  ah,4ch                 ;DOS terminate program function
   int  21h                    ;terminate the program







  
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   int 16h
   mov  ah,4ch                 ;DOS terminate program function
   int  21h                    ;terminate the program
  
   end