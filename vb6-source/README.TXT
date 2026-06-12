Hi!                                        2000/01/20


The Cyberspace/Matrix program package for Shadowrun (TM) let's
your decker run through a 3D DOOM (TM) like environment 
preserving all the rules from VR 1.0 and SR 2.01 (not VR 2.0!!).
It's a blast! Read the users' comments on my WWW-pages :-)

Newest infos and download on WWW-pages (including screenshots):
---------------------------------------------------------------
  http://www.geocities.com/TimesSquare/5245/

FTP-download from my WWW-pages, or directly from:
-------------------------------------------------
OLDER VERSIONS!!!! DO NOT USE
    ftp://ftp.uni-erlangen.de/pub/games/roleplay/shadowrun
or  ftp://ftp.funet.fi/pub/doc/games/roleplay/systems/shadowrun-II/programs


The program package consists of:
--------------------------------
 1) The Cyberspace Emulator     (short description at by WWW-pages)
 2) The Matrix Construction Set (graphical design of nodes/ICE/data)
 3) The Cyberdeck Designer      (lets you create your own cyberdecks)
 4) The Decker Biomonitor       (lets you manipulate your decker)

It's Freeware:
-------------------------
I have spend one year extensive programming and rendering time in this
project, but I release it to the public without any restrictions.
I even release the source for free.

HARD- AND SOFTWARE REQUIREMENTS:
--------------------------------
Minimal system: 386 PC, MS-Windows 3.x, Windows 95, OS/2-Win, VGA
graphic (at least 16 colors which might look poor. Recommended are 256
or more colors). A higher resolution as 640x480 is recommended, because of
additional subwindows. A soundcard would be nice, but is not
required.


Frequently asked questions:
===========================
DOWNLOAD:
---------
1) I cannot download the program package (connect failed, corrupt archive)!

   Try non-business hours (Germany 18:00-8:00 w/ DST = UTC+2,
   = 12:00-2:00 EST) or hours with low network traffic. In hopeless cases 
   contact me for direct access. If you want to upload the program
   on a different server, please drop me a note, so that I can keep you 
   up to date with updates (if there will be any).


INSTALLATION/DEINSTALLATION:
----------------------------
2) How do I install/de-install the program (Demo-Version)?
   
   Read INSTALL.TXT for installation instructions and related problems.


BUGS AND REPORTS:
-----------------
6) When I meet ICE, the node background image is missing (grey background).

   When you use 32bit colors (16 Mill. colors) on your graphic adapter
   try to use the 16bit (65536 colors) version of your driver. This effect
   might be a bug in the graphic driver.

7) The buttons and the placing for the nodes in the Matrix Construction Set
   looks weird. What can I do ?
   
   Use the normal small (not large!!) system font for Windows.

8) The Cyberspc.exe crashed on my computer. Help me!

    a) (Demo) Has the pkunzip-program (or setup) reported some errors?
      Get a new archive. Yours is corrupted.
    b) Has the setup-program reported some errors or asked some
       strange questions?
      Examine the questions/errors and get rid of them.
    d) Try out the program with a different desktop- and color-
       resolution. Does the Cyberspace program work with these
       resolutions? Yes?
      Unbelievable many graphic drivers have bugs which cause
      crashes. Get a newer, bugfree driver from the internet or
      your graphic adapter vendor.
    e) Do you use some desktop-enhancements, e.g. an autostart 
       program which changes the layout?
      Try to start the program in a plain windows environment.
      I observed a crash which occured using a autostart program which
      places a little clock in the title line of each program. This
      crash occured, because the clock program overwrites some 
      important program data, because the title string is to small
      to hold the clock data.
    f) No to a-d)?
      Contact me (Email or telephone calls prefered) to describe the
      problem and your configuration in more detail so that we can fix
      that.

9) I am an unregistered user, but I want on the mailing list/provide bug
    reports/like to contribute new sounds or images.

    No problem. Be free to contact me. Email prefered.


COLOR PROBLEMS:
---------------
6) see above

10) When meeting ICE, the colors sometimes look somewhat strange.

   Sometimes on 256 color displays you have this problem.
   Use 65536 colors (be aware that many graphic drivers have bugs
   in this and higher color resolutions) or wait for me to 
   program a workaround to the W*ndows st*pid color palette 
   handling.

11) I was wondering if Cyberspace will be able to be configured to run on
   a vga 16c (maximum: 16 colors) graphic card?

   Yes it is possible right out of the box, but the images quality might
   be poor. To receive better image quality, you may use some graphic
   program and scale the color palettes of the images down to the 16
   windows colors.
   The images have the extension "*.bmp". You may even replace 
   them with your own pictures. The ICE-pictures have the file naming
   convention "ic*.bmp". The color white in these ICE-bmps is used
   to become a transparent color in the overlaying process with the node
   picture.


ANNOYING:
---------
12) I cannot load my own LTGs, cannot hear sounds,... (Demo version)
 
   Order the registered version. The registered version contains about
   1200 KB additional images and 700 KB sound and can load LTGs.

13) Sometimes during the run, the program shows the order info!

    a) Probably, you are dumped by Trace-ICE. The corporation got your
    login adress and will send a high response team to catch you! 
    Look in the gamemasters info box (menu miscellaneous).
    b) In the unregistered version, the order info is displayed
    automatically in the external Matrix. Therefore you may have chosen
    an exit in the Matrix which leads to the external Matrix grid.

14) What does "hackpool = MatR +Comp does not fit this decker" mean?

    This warning message should make the GM aware of some inconsistencies 
    of the decker. The Hacking pool should be the result of Matrix
    Reaction plus Computer skill.


BUGS IN RULE IMPLEMENTATION?
----------------------------
15) I can use the Cloak program only once!
    
    Yes, consult the SR rules. It's not a bug, it's a feature.

16) Even undeceived Scramble ICE does not prevent me from downloading!

    Yes, consult the SR rules. It's not a bug, it's a feature.
    However the target number is higher then. Additionally ICE-code
    is attached to the file (+Iced in storage-mem list) and its size is larger.

17) Scramble ICE do not erase files, when I failed with deception!

    Scramble-ICE erases files one after the other (at each action
    one). The file, which you actually download is "locked" and could not
    be removed, as soon as transfer ends. However the ICE may trigger
    alerts and activate other ICE.

18) There is ICE in observation range, which I could not attack!

    Yes, go to Sensor Range. The ICE in observation should mark
    ICE which enters this node in observation range, but not at same the
    position as the decker. Therefore you could not attack it and it will
    not block your way.

19) I need to do a resleaze, even when I want to exit the node.

    This last resleaze does not count. Even when you fail, the ICE would
    not notice you. This mechanism has changed in 1.01.

20) I cannot use the team pool for karma tests.

    Yes, this is handled different in different SR groups. If your group
    allows you to use the team's karma, then add it to your own karma with
    the decker's biomonitor, before or during the run (save decker and
    Matrix, load decker and Matrix).

21) My second Analyse test failed, but I had enough successes!
  
    No, you had not. The target number increases by +2 each time a test
    fails.

22) My resleazing failed, but I had enough successes!

    No, you had not. The target number increases at each Resleaze test.

23) When using manual input of dices, I have to input a new initiative
    even when no ICE is there. Why?

    Some ICE may migrate through the Matrix (chasing you?), therefore
    the program needs to know, how fast you are.
 
24) My decker never get any damage.

    Yes, a hot decker with high hardening has a good defense, which is 
    not easy to overcome for the ICE. However, there are some combinations
    which should help the gamemaster to challenge the decker:
    a) Use Acid-ICE to reduce the BOD-Target. Then use killer ICE.
    b) Trace-ICE is even more dangerous than other ICE, because it reports
       the decker's real address. 
    c) Use ICE with higher staging.
    d) Use Emergency feature to limit the time until system shutdown is
       triggered as "final response".

25) Trace ICE traces to fast!

    No. Trace ICE tracing time is measured in ACTIONS of the ICE not in
    turns.


MISCELLANEOUS PROS:
-------------------
26) Could I change the display of the ICE and nodes?

    Yes, you can create own images. Look at *.bmp images.
    ICE has different display modes (even VRML, so that Killer ICE looks 
    different from Acid or Trace...). The CDROM version comes with 
    a POVRAY description library for ICE, which you can use to raytrace
    own ICE images. POVRAY is a freeware raytracer.

27) Could I change the sounds?
 
    Yes. In the registered version there are over 50 different sound events
    in *.wav format. You can use your own audio files if you like.

28) How do I use a satellite uplink?

    In the registered version this is possible.
    Satellites have different node images. With the Matrix Construction
    Set you may even create a large orbital matrix grid.


Viel Spass, have fun,
	Stefan Markgraf
	e-mail: icetoaster@gmx.de



