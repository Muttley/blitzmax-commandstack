Rem
'
' Copyright (c) 2009-2020 Paul Maskelyne <muttley@muttleyville.org>.

' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the LICENSE file
' distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'
EndRem

Rem
	bbdoc: Base class that represents commands
	about: Extend this class to provide command functions for your applications
EndRem
Type TCommand

	Rem
		bbdoc: Executes the command
		returns: True if successful, otherwise False
		about: This method should actually perform the command itself and should
		be called via the command stack. If the command succeeds it will be added
		to the undo stack.
	EndRem
	Method Execute:Int() Abstract



	Rem
		bbdoc: Returns whether the command can be undone or not
		returns: True if the command can be undone, otherwise False
		about: If a command makes destructive changes to your application
		you will need to return false here.
	EndRem
	Method CanBeUndone:Int() Abstract



	Rem
		bbdoc: Returns a copy of the command
		returns: TCommand
		about: Must return an exact copy of the TCommand pre-execution
	EndRem
	Method Copy:TCommand() Abstract



	Rem
		bbdoc: Attempts to merge two commands
		returns: True if the commands have been merged, otherwise False
		about: If two identical commands are performed in quick succession it is
		possible that they can be merged to save undo/redo stack space.  If they
		can, this method should perform that merge and return the appropriate
		response.  Commands that are merged with an existing command on the stack
		are not added to the stack themselves.
	EndRem
	Method Merge:Int (command:TCommand) Abstract



	Rem
		bbdoc: Determine whether the provided command is the same type as ourselves
		returns: True if the same type, otherwise false
	EndRem
	Method SameCommandType:Int (command:TCommand)
		If TTypeId.ForObject (Self) = TTypeId.ForObject (command)
			Return True
		Else
			Return False
		End If
	End Method



	Rem
		bbdoc: Returns a human readable description of the class
	EndRem
	Method ToString:String()
		Return "Command Pattern function object"
	End Method



	Rem
		bbdoc: Undoes the command
		about: This method should revert any change that was made by the
		Execute() method
	EndRem
	Method Unexecute() Abstract

End Type

