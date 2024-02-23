/*
 * Copyright (c) 2023 Space Cubics, LLC.
 */

/* A weak version of the function. Each IO board should define its own
 * function.  Note that XC8 for PIC16LF877 with C90 library doesn't
 * have weak attribute.  This will be linked at very last to full
 * fill if not defined. */
#include "ioboard.h"

int ioboard_init(void)
{
        UART_DE = 0;
        UART_RE_B = 1;
        VD3V3_SYS_EN = 1;

        return 0;
}
