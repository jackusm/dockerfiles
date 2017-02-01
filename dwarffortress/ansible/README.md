ansible-dwarffortress
========================

Dwarf Fortress provisioned via ansible. Tested using the ansible/ubuntu14.04-ansible docker container

Usage
-----

Within the directory of this project:

    ansible-playbook dwarffortress.yml --connection=local

This installs the dependencies for dwarf fortress, and dwarf fortress itself which can be run using the command:

    dwarffortress

If you want dwarf fortress to be configured to run in text mode

    ansible-playbook textmode.yml --connection=local

This modifies the init.txt configuration file to set PRINT_MODE to TEXT.

### dwarffortress launcher ###

When launching dwarf fortress via the dwarffortress command, some settings in init.txt can be modified using command line arguments. For example to skip the intro:

    dwarffortress --skip-intro

To see the full list or possible options:

    dwarffortress --help

### DfHack ###

    ansible-playbook dfhack.yml --connection=local

As well as adding DfHack it also modifies the dwarffortress command to execute the dfhack script instead of the usual df.

### Tile sets ###

Currently only Phoebus is included, it can be configured by running:

    ansible-playbook tileset-phoebus.yml --connection=local

If you configure a tile set, but have already saved games that were using a previous one, then the raw directory should be updated within those saved games. The first time you run dwarffortress after changing tile set you can pass an option to update the saved games:

    dwarffortress --update-saves

### noVNC ###

For whatever reason (running in a docker container?) you might not want to control Dwarf Fortress on the host directly, but instead access from another machine. This is why you can provision noVNC so that DF can be accessed from another computer via the browser.

    ansible-playbook novnc.yml --connection=local

You can point your browser to http://localhost:6080/vnc.html and click connect (there is no password). Remember when running DF to set the DISPLAY, which by default is set to display 100:

    DISPLAY=:100 dwarffortress

### XPRA ###

Another option for remote viewing is using XPRA, as an alternative to using noVNC. It can be provisioned with:

    ansible-playbook xpra.yml --connection=local

You can connect using the username "df" and the password "changeme". Using XPRA comes with the following limitations:

* You must use the latest version of XPRA to connect, the version normally available through the package managers is out of date, instead get the latest version from https://winswitch.org.
* DO NOT USE FULLSCREEN, it will result in really high load, I suspect this is because Dwarf Fortress tries to scale to fit the window, and fullscreen in XPRA reports this in a quirky way.
* DO NOT PROVISION NOVNC, since that playbook already sets up an instance of Xvfb on DISPLAY 1, so the xpra process fails to start.
* The only reliable encoding I have found to work is "Raw RGB + zlib".

### Gitwatch ###

If you are like me (a clumsy perfectionist) then occasionally your grand plans of building a magma moat are shattered by a hoard of goblins just wandering through the hole under a wall that was accidentally left behind after draining a pond several saves ago (true story). This utility when provisioned will automatically make a git commit every time you save.

    ansible-playbook gitwatch.yml --connection=local

It will only commit if /df_linux/data/save is a git repository, so you will need to run the following command in that directory:

    git init

Dependencies
------------

Tested with ansible 1.8.2.

Todo
----

* Update existing saved games when the tile set changes.
* Add some more tile sets.
* Create a tutorial version, which adds a saved game that can be used to follow an online tutorial.
* Allow for more stuff to be configured, for example which user account to use.

Credits
-------

* Obviously Toady One at http://www.bay12games.com for Dwarf Fortress.
* All the guys that maintain the Dwarf Fortress wiki (http://dwarffortresswiki.org/index.php/DF2012:Installation)
* Chris Collins who's project inspired me to use noVNC (https://github.com/DockerDemos/DwarfFortressServer) and what I used to get started.
* Nevik Rehnel for gitwatch (https://github.com/nevik/gitwatch)