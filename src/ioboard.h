/*
 * Copyright (c) 2023 Space Cubics, LLC.
 */

#pragma once

#include "trch.h"

#define UART_DE            UIO3_00
#define UART_RE_B          UIO3_01
#define VD3V3_SYS_EN       UIO3_02

int ioboard_init(void);
