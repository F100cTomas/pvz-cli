#ifndef PVZ_CLI_FRONTEND_H
#define PVZ_CLI_FRONTEND_H
#ifdef __cplusplus
#include <cstdint>
extern "C" {
#else
#include <stdint.h>
#endif

void pvz_cli_frontend_init();

void pvz_cli_frontend_update();

void pvz_cli_frontend_close();

#ifdef __cplusplus
}
#endif
#endif
