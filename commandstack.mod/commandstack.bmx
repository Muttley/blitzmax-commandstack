Rem
'
' Copyright (c) 2009-2013 Paul Maskelyne <muttley@muttleyville.org>.

' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the LICENSE file
' distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'
EndRem

SuperStrict

Rem
    bbdoc:muttley\commandstack
End Rem
Module muttley.commandstack

ModuleInfo "Version: 1.0.2"
ModuleInfo "License: Artistic License 2.0"
ModuleInfo "Author: Paul Maskelyne (Muttley)"
ModuleInfo "Copyright: (c) 2009-2013 Paul Maskelyne"
ModuleInfo "E-Mail: muttley@muttleyville.org"
ModuleInfo "Website: http://www.muttleyville.org"

ModuleInfo "History: 1.0.2"
ModuleInfo "History: Add Unit Test dependencies to documentation"
ModuleInfo "History: 1.0.1"
ModuleInfo "History: Code tidy and migration to Bitbucket"
ModuleInfo "History: 1.0.0"
ModuleInfo "History: Initial Release"

Import brl.linkedlist
Import brl.reflection

Import muttley.stack

Include "Source\TCommand.bmx"
Include "Source\TCommandStack.bmx"
Include "Source\TMacroCommand.bmx"
