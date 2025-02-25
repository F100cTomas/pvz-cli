#include <cstdio>
#include "engine/engine.hpp"


namespace pvz_cli_engine {

void init_game() {
	printf("Initializing Engine\n");
	pvz_cli_frontend_init();
	pvz_cli_frontend_update();
	pvz_cli_frontend_close();
}

}
