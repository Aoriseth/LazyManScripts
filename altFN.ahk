#NoEnv
SetBatchLines -1
ListLines Off

#SingleInstance, force

!f:: Send {Up}
!s:: Send {Down}
!r:: Send {Left}
!t:: Send {Right}
!Escape:: Send !{F4}
!Space::Send !{space}
!SC038::Send !{space}

!SC035::Run, "https://www.autohotkey.com/docs/KeyList.htm"
!w::Send ^w
!n::Send {Enter}
!d::Send !{space}