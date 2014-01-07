intro
---

qv is similar to the OSX application Notational Velocity/NValt

installation
---

`gem install qv`

configuration
---

configuration is simple. default folder for notes is ~/notes
if your notes are somewhere else:

    echo "notes_dir = /somewhere/else" > ~/.nvalt

although i will probably change that filename soon

usage
---

make sure qv is somewhere in your path. 
run `qv`. start typing. results should update as you type.

qv will search the contents and the filenames of notes in your notes_dir for the string you input. most recently edited notes at the top.

select notes with ctrl-j/k, hit enter to edit. 

as of right now, qv does not create a note if no note exists. this is not permanent.

supply a search term from the command line to get a static list of matches

in the near future, i'm hoping to combine qv with dmenu or vim for increased flexibility/ubiquity.

todo
---

good command line options:

- specify a config file
- specify a notes_dir
- enable or disable "write-mode"
    - create note if no note exists
    - should be enabled by default
- render markdown->html and open with a browser 
