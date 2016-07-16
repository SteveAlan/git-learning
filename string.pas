uses crt,sysutils;

const
        //Length of notations
        STANDARN_LENGTH = 1000;
        ROUND_NOT       = 4000;
        WHITE_NOT       = 2000;
        BLACK_NOT       = 1000;
        CURVE_NOT       = 500;
        D_CURVE_NOT     = 250;
        T_CURVE_NOT     = 125;

        //Frequency of notations   //Option of frequency
        STANDARN_DOW  = 512;       UP   =   41;
        DOW           = 512;       LO   =  -41;
        REW           = 587;       SPACE=   75;
        MIW           = 662;       UPO  =  525;
        FAW           = 737;
        SOW           = 812;
        LAW           = 887;
        SIW           = 962;

function addDot(length: integer): double;
begin
        exit(length + length/2);
end;

procedure print(str: string; fore, back: integer);
begin
        Textcolor(fore);
        TextBackGround(back);
        write(str);
end;

procedure trackColor;
begin
        TextColor(white);
        Textbackground(black);
end;

procedure Bspace(n: integer);
var i: integer;
begin
        TrackColor;
        for i:= 1 to n do write(' ');
end;

procedure down;
begin
        TrackColor;
        writeln;
end;

function ran: string;
begin
        randomize;
        exit(inttostr(random(9)));
end;

procedure play(f,l: integer);
begin
        randomize;
        print(' SYSSPK ',white, lightgreen); bspace(1);
        write('NOT='); print(inttostr(f),lightred,0); bspace(3);
        write('LEG='); print(inttostr(l),cyan,0);
        Bspace(3); print('datatrack: ',lightgreen,0); trackColor;
        write(ran + ran + ' ' + ran + ran + ' ' + ran + ran + ' '); delay(1); print(ran + ran, red, 0); down;
        Sound(f); Delay(l);
end;

procedure comment(str: string);
begin
        print('// '+str, darkgray, 0); down;
end;

procedure test;
begin
        randomize;
        print(' MODULE ', lightred, blue); bspace(1);
        print(' TEST ', white, lightblue);
        print(' IO ',yellow, brown);trackcolor; writeln(' NULL  NULL  NULL  03xh');
        play(STANDARN_DOW, WHITE_NOT); comment('Standarn length and frequency notation');
        play(DOW, 240);
        play(REW, 240);
        play(MIW, 240);
        play(FAW, 240);
        play(SOW, 240);
        play(LAW, 240);
        play(SIW, 240);
        print(' MODULE ', lightred, blue); bspace(1); writeln(' NULL ');
end;



begin
        test;
        nosound;
        randomize;
        comment('Play random');
        repeat
        play(random(500)+500, random(300)+150);
        until keypressed;
        nosound;
        print(' MODULE ', lightred, blue); bspace(1); writeln(' NULL ');
        readln;
end.


