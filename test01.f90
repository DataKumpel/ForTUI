PROGRAM test01
    !===== IMPORTS ================================================================================!
    USE fortui
    !===== IMPORTS ================================================================================!

    IMPLICIT NONE

    !===== GLOBALS ================================================================================!
    !===== GLOBALS ================================================================================!
    
    CALL tui_init()
    CALL tui_write_text("This is some fine text!", 5, 10, COLOR_RED, COLOR_BLACK)
    CALL tui_write_text("This text should appear green!", 5, 20, COLOR_GREEN, COLOR_BLACK)
    CALL tui_write_text("This is the last one...", 15, 40, COLOR_BLUE, COLOR_WHITE)

    CALL tui_draw_rect(0, 0, 20, 5, "#", COLOR_RED, COLOR_BLACK)
    CALL tui_draw_rect(4, 9, 40, 21, "!", COLOR_GREEN, COLOR_BLACK)
    CALL tui_draw_rect(13, 13, 50, 100, "/", COLOR_CYAN, COLOR_STD)

    CALL tui_write_text("This is where it goes on> ", 0, 50, COLOR_CYAN, COLOR_STD)
    CALL EXECUTE_COMMAND_LINE("sleep 1")
    CALL tui_write_text("5...", 0, 51, COLOR_STD, COLOR_STD)
    CALL EXECUTE_COMMAND_LINE("sleep 1")
    CALL tui_write_text("4...", 0, 52, COLOR_STD, COLOR_STD)
    CALL EXECUTE_COMMAND_LINE("sleep 1")
    CALL tui_write_text("3...", 0, 53, COLOR_STD, COLOR_STD)
    CALL EXECUTE_COMMAND_LINE("sleep 1")
    CALL tui_write_text("2...", 0, 54, COLOR_STD, COLOR_STD)
    CALL EXECUTE_COMMAND_LINE("sleep 1")
    CALL tui_write_text("1...", 0, 55, COLOR_STD, COLOR_STD)
    CALL EXECUTE_COMMAND_LINE("sleep 1")

    CALL tui_close()

END PROGRAM
