# The Smallest Possible EXE and related files
The smallest runnable EXE on 64-bit Windows is 268 bytes, this is a limitation with the Windows operating system, and not the Portable Executable file itself. 
An example of a 268 byte PE file can be found within the 268B folder of this repository. 

**268.asm** can be compiled using the [Netwide Assembler](https://www.nasm.us/) using the following command:
```
nasm -f bin -o 268.exe 268.asm
```
The assembled program can be run as normal, either by double clicking the icon of the 268.exe file, or by using the following command in the Windows Command Prompt:
```
268.exe
```
If there was no large blue box stating that "This app can't run on your PC" then it was executed correctly (this program has no visual output).

## Doomsday - A small Console Game
Press **Enter** to start or restart

To compile with MASM:
```
ml doomsday.asm /link /NOLOGO /NODEFAULTLIB /SUBSYSTEM:CONSOLE /ENTRY:START /MERGE:.rdata=. /MERGE:.pdata=. /MERGE:.text=. /SECTION:.,ER /ALIGN:16 kernel32.lib Advapi32.lib
```
To compile with [Crinkler](https://github.com/runestubbe/Crinkler) it requires two steps, as Crinkler takes the place of the standard Microsoft Linker. First Assemble using MASM, but only create the object file, using the /c flag. Then create the compressed EXE using crinkler.exe. 
```
ml /c /coff doomsday.asm
crinkler.exe /NODEFAULTLIB /ENTRY:START /SUBSYSTEM:CONSOLE /TINYHEADER /NOINITIALIZERS /UNSAFEIMPORT /ORDERTRIES:1000 /TINYIMPORT kernel32.lib Advapi32.lib doomsday.obj
```
**Note:** these compressed programs created by Crinkler may trigger your anti-virus software, that's normal. 

## Small Piano - World's Smallest Piano App
To compile with MASM:
```
ml piano.asm /link /NOLOGO /NODEFAULTLIB /SUBSYSTEM:CONSOLE /ENTRY:START /MERGE:.rdata=. /MERGE:.pdata=. /MERGE:.text=. /SECTION:.,ER /ALIGN:16 kernel32.lib
```
To compile with [Crinkler](https://github.com/runestubbe/Crinkler) it requires two steps, as Crinkler takes the place of the standard Microsoft Linker. First Assemble using MASM, but only create the object file, using the /c flag. Then create the compressed EXE using crinkler.exe. 
```
ml /c /coff pian.asm
crinkler.exe /NODEFAULTLIB /ENTRY:START /SUBSYSTEM:CONSOLE /TINYHEADER /NOINITIALIZERS /UNSAFEIMPORT /ORDERTRIES:1000 /TINYIMPORT kernel32.lib piano.obj
```
The Piano has 8 keys, ranging from C to C the notes of the Piano correspond to the following keyboard keys:
```
|Z|X|C|V|B|N|M|L|
|C|D|E|F|G|A|B|C|
```
The scale of the piano can be shifted up or down an octave by **a single press of the up or down keys**. There is no audio or visual feedback for this change.
The initial frequencies of each note are found in the **SCALE** variable in the data section, this is bit shifted to the left equivlent to the value in the **SHIFT** variable, which is initialized to 4. 

### Scanning the QR codes
The programs can be decoded from their relevant QR codes through **zbarimg** 
```
zbarimg --oneshot -Sbinary --raw QR.png > out.exe
```
