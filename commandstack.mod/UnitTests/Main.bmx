SuperStrict

Framework muttley.commandstack

Import bah.maxunit

Include "Source\TCommandStackTests.bmx"
Include "Source\TUnitTestCommand.bmx"
Include "Source\TUndoableUnitTestCommand.bmx"
Include "Source\TMergeableUnitTestCommand.bmx"

exit_ (New TTestSuite.run())
