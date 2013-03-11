Rem
'
' Copyright (c) 2009-2013 Paul Maskelyne <muttley@muttleyville.org>.
'
' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the LICENSE file
' distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'
EndRem

Rem
	bbdoc: Class representing #TCommand macros.
	about: A macro is two or more commands that are executed in sequence
EndRem
Type TMacroCommand Extends TCommand Final

	' The list of commands that make up this macro
	Field _commands:TList


	Rem
		bbdoc: Adds a command to the macro
	EndRem
	Method AddCommand (command:TCommand)
		_commands.AddLast (command)
	End Method



	Rem
		bbdoc: Returns whether this macro can be undone
		returns: True if the macro can be undone, otherwise False
		about: A macro command can only be undone if all the individual commands
		in the macro can also be undone
	EndRem
	Method CanBeUndone:Int()
		For Local command:TCommand = EachIn _commands
			If Not command.CanBeUndone()
				Return False
			End If
		Next

		Return True
	End Method



	Rem
		bbdoc: Returns a copy of the macro
	EndRem
	Method Copy:TCommand()
		Local macro:TMacroCommand = New TMacroCommand

		For Local command:TCommand = EachIn _commands
			macro.AddCommand (command.Copy())
		Next

		Return macro
	End Method



	Rem
		bbdoc: Creates a macro command from a provided TList of commands
		returns: TMacroCommand
	EndRem
	Function Create:TMacroCommand (commandList:TList)
		Local macro:TMacroCommand = New TMacroCommand

		For Local command:TCommand = EachIn commandList
			macro.AddCommand (command)
		Next

		Return macro
	End Function



	Rem
		bbdoc: Executes all commands in the macro
		returns: The number of commands executed
		about: This method performs each command in the macro and should be called
		via the command stack. If the command succeeds it will be added to the undo
		stack.
	EndRem
	Method Execute:Int()
		For Local command:TCommand = EachIn _commands
			command.Execute()
		Next

		Return _commands.Count()
	End Method



	Rem
		bbdoc: Attempts to merge two commands
		about: Macro commands by their very nature cannot be merged so this just returns False
	EndRem
	Method Merge:Int (command:TCommand)
		Return False
	End Method



	Rem
		bbdoc: Default constructor
	EndRem
	Method New()
		_commands = New TList
	End Method



	Rem
		bbdoc: Returns a human readable description of the macro command
	EndRem
	Method ToString:String()
		Local asString:String = "Macro Command:~n"

		For Local command:TCommand = EachIn _commands
			asString :+ "+ " + command.ToString() + "~n"
		Next

		Return asString
	End Method



	Rem
		bbdoc: Undoes the command
		about: Calls the unexecute method of each command in the macro in reverse order
	EndRem
	Method Unexecute:Int()
		Local reversedCommands:TList = _commands.Reversed()

		For Local command:TCommand = EachIn reversedCommands
			command.Unexecute()
		Next

		Return reversedCommands.Count()
	End Method

End Type
