MODULE fortui
    IMPLICIT NONE
    !===== VISIBILITY =============================================================================!
    PRIVATE
    PUBLIC :: tui_write_text, tui_draw_rect, clear_screen
    !===== VISIBILITY =============================================================================!


    !===== MODULE PARAMETERS ======================================================================!
    CHARACTER(LEN=*), PARAMETER :: ESC = ACHAR(27)
    INTEGER, PUBLIC, PARAMETER  :: COLOR_BLACK   = 0
    INTEGER, PUBLIC, PARAMETER  :: COLOR_RED     = 1
    INTEGER, PUBLIC, PARAMETER  :: COLOR_GREEN   = 2
    INTEGER, PUBLIC, PARAMETER  :: COLOR_YELLOW  = 3
    INTEGER, PUBLIC, PARAMETER  :: COLOR_BLUE    = 4
    INTEGER, PUBLIC, PARAMETER  :: COLOR_MAGENTA = 5
    INTEGER, PUBLIC, PARAMETER  :: COLOR_CYAN    = 6
    INTEGER, PUBLIC, PARAMETER  :: COLOR_WHITE   = 7
    INTEGER, PUBLIC, PARAMETER  :: COLOR_STD     = 9
    !===== MODULE PARAMETERS ======================================================================!

CONTAINS

    SUBROUTINE tui_write_text(text, x, y, cf, cb)
        !===== PARAMETERS =========================================================================!
        CHARACTER(LEN=*), INTENT(IN) :: text
        INTEGER, INTENT(IN)          :: x
        INTEGER, INTENT(IN)          :: y
        INTEGER, INTENT(IN)          :: cf !---> Color for the Foreground
        INTEGER, INTENT(IN)          :: cb !---> Color for the Background
        !===== PARAMETERS =========================================================================!

        CALL move_to(y, x)
        CALL color_foreground(cf)
        CALL color_background(cb)
        WRITE(*, '(A)', advance="no") text
        CALL clear_all_colors_and_attributes()
    END SUBROUTINE


    SUBROUTINE tui_draw_rect(xul, yul, xlr, ylr, symbol, cf, cb)
        !===== PARAMETERS =========================================================================!
        INTEGER, INTENT(IN)   :: xul !---> x upper left
        INTEGER, INTENT(IN)   :: yul !---> y upper left
        INTEGER, INTENT(IN)   :: xlr !---> x lower right
        INTEGER, INTENT(IN)   :: ylr !---> y lower right
        CHARACTER, INTENT(IN) :: symbol
        INTEGER, INTENT(IN)   :: cf  !---> Color for the Foreground
        INTEGER, INTENT(IN)   :: cb  !---> Color for the Background
        !----- INTERNALS --------------------------------------------------------------------------!
        INTEGER :: x
        INTEGER :: y
        !===== PARAMETERS =========================================================================!

        DO x = xul, xlr
            DO y = yul, ylr
                CALL move_to(y, x)
                IF (x == xul .OR. x == xlr .OR. y == yul .OR. y == ylr) THEN
                    CALL color_foreground(cf)
                    CALL color_background(cb)
                    WRITE(*, '(A)', advance="no") symbol
                    CALL clear_all_colors_and_attributes()
                ENDIF
            ENDDO
        ENDDO
    END SUBROUTINE

    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    !                                                                                              !
    !     Escape Sequence Helper                                                                   !
    !                                                                                              !
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    SUBROUTINE clear_screen()
        WRITE(*, '(A)', advance="no") ESC // "[2J"
    END SUBROUTINE


    SUBROUTINE move_to(row, col)
        !===== PARAMETERS =========================================================================!
        INTEGER, INTENT(IN) :: row
        INTEGER, INTENT(IN) :: col
        !===== PARAMETERS =========================================================================!

        WRITE(*, '(A, I0, A, I0, A)', advance="no") ESC // "[", row, ";", col, "H"
    END SUBROUTINE


    SUBROUTINE clear_all_colors_and_attributes()
        WRITE(*, '(A)', advance="no") ESC // "[0m"
    END SUBROUTINE


    SUBROUTINE bold()
        WRITE(*, '(A)', advance="no") ESC // "[1m"
    END SUBROUTINE


    SUBROUTINE color_foreground(color)
        !===== PARAMETERS =========================================================================!
        INTEGER, INTENT(IN) :: color
        !===== PARAMETERS =========================================================================!

        WRITE(*, '(A, I0, A)', advance="no") ESC // "[3", color, "m"
    END SUBROUTINE


    SUBROUTINE color_background(color)
        !===== PARAMETERS =========================================================================!
        INTEGER, INTENT(IN) :: color
        !===== PARAMETERS =========================================================================!

        WRITE(*, '(A, I0, A)', advance="no") ESC // "[4", color, "m"
    END SUBROUTINE


    SUBROUTINE show_cursor(state)
        !===== PARAMETERS =========================================================================!
        LOGICAL, INTENT(IN) :: state
        !===== PARAMETERS =========================================================================!

        IF (state) THEN
            WRITE(*, '(A)', advance="no") ESC // "[?25h"
        ELSE
            WRITE(*, '(A)', advance="no") ESC // "[?25l"
        ENDIF
    END SUBROUTINE


    SUBROUTINE alt_screen(state)
        !===== PARAMETERS =========================================================================!
        LOGICAL, INTENT(IN) :: state
        !===== PARAMETERS =========================================================================!

        IF (state) THEN
            WRITE(*, '(A)', advance="no") ESC // "[?1049h"
        ELSE
            WRITE(*, '(A)', advance="no") ESC // "[?1049l"
        ENDIF
    END SUBROUTINE

END MODULE
