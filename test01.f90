PROGRAM test01
    !===== IMPORTS ================================================================================!
    USE fortui
    !===== IMPORTS ================================================================================!

    IMPLICIT NONE

    !===== GLOBALS ================================================================================!
    !===== GLOBALS ================================================================================!
    
    CALL clear_screen()
    CALL tui_write_text("This is some fine text!", 5, 10, COLOR_RED, COLOR_BLACK)
    CALL tui_write_text("This text should appear green!", 5, 20, COLOR_GREEN, COLOR_BLACK)
    CALL tui_write_text("This is the last one...", 15, 40, COLOR_BLUE, COLOR_WHITE)
    CALL tui_write_text("This is where it goes on> ", 0, 50, COLOR_CYAN, COLOR_STD)

END PROGRAM
