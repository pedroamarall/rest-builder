# Editors

## Sublime

1. Launch Terminator.

1. Type ***osub \<FILE_NAME\>*** to open a file in Sublime.

1. Type ***osub \<FILE_NAME_1\> \<FILE_NAME_2\>*** to open more than one file in Sublime.

## Vi

1. Launch Terminator.

1. Type ***vi playing_with_vi.txt***. Look at the bottom left hand corner.

	```
	"playing_with_vi.txt" [New]
	```

1. Type ***i***. Look at the bottom left hand corner.

	```
	-- INSERT --
	```

	This mode allows you to type in text. Add some random text.

1. Type ***escape***. Look at the bottom left hand corner. It is blank.

1. Type ***:wq***. Look at the buttom left hand corner. Notice it has your command ***:wq***. Then hit ***\<Enter\>*** to save your changes and exit Vi.

1. Type ***more vi playing_with_vi.txt*** to see your changes.

1. ***vi playing_with_vi.txt*** and then ***i*** and add some random text.

1. Type ***escape*** and then ***:q!*** to quit without saving your changes.

1. Type ***more vi playing_with_vi.txt*** to verify that your changes were not saved.

1. ***vi playing_with_vi.txt*** and then ***i*** and add many lines of random text.

1. Type ***escape*** and then use your up and down keys to find a line.

1. Type ***dd*** to delete a line. Use your up and down keys to find another line. Type ***dd*** again.

1. Type ***u*** to undo. Type ***u*** to undo again.

1. Type ***<CONTROL+r>*** to redo by.

1. Get out of Vi.