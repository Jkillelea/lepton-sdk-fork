#include <stdio.h>
#include "Lepton_I2C.h"
#include "lepton-sdk-fork/LEPTON_SDK.h"
#include "lepton-sdk-fork/LEPTON_ErrorCodes.h"
#include "lepton-sdk-fork/LEPTON_SYS.h"
#include "lepton-sdk-fork/LEPTON_Types.h"
#include "lepton-sdk-fork/LEPTON_AGC.h"
#include "lepton-sdk-fork/LEPTON_RAD.h"
#include "lepton-sdk-fork/LEPTON_OEM.h"

bool _connected = 0;

LEP_CAMERA_PORT_DESC_T _port;
LEP_SYS_FPA_TEMPERATURE_KELVIN_T fpa_temp_kelvin;
LEP_RESULT result;

int i2c_port = 1;
unsigned i2c_speed = 100;

int lepton_connect() {
	int res = (int) LEP_OpenPort(i2c_port, LEP_CCI_TWI, i2c_speed, &_port);
	_connected = true;
	return res;
}

int lepton_enable_radiometry() {
    int res = 0;

    if (!_connected)
        res = lepton_connect();

    if (res != 0)
        return res;

    return (int) LEP_SetRadEnableState(&_port, LEP_RAD_ENABLE);

}

int lepton_temperature(){
	if(!_connected)
		lepton_connect();
	result = ((LEP_GetSysFpaTemperatureKelvin(&_port, &fpa_temp_kelvin)));
	printf("FPA temp kelvin: %i, code %i\n", fpa_temp_kelvin, result);
	return (fpa_temp_kelvin/100);
}


float raw2Celsius(float raw){
	float ambientTemperature = 25.0;
	float slope = 0.0217;
	return slope*raw+ambientTemperature-177.77;
}

void lepton_perform_ffc() {
	printf("performing FFC...\n");
	if(!_connected) {
		int res = lepton_connect();
		if (res != 0) {
			//check SDA and SCL lines if you get this error
			printf("I2C could not connect\n");
			printf("error code: %d\n", res);
		}
	}

    int res = (int)LEP_RunSysFFCNormalization(&_port);
    if (res != 0) {
        printf("FFC not successful\n");
        printf("error code: %d\n", res);
    } else {
        printf("FFC successful\n");
    }
}

void lepton_restart() {
	if(!_connected) {
		int res = lepton_connect();
		if (res != 0) {
			//check SDA and SCL lines if you get this error
			printf("I2C could not connect\n");
			printf("error code: %d\n", res);
		}
	}

	printf("restarting...\n");
	Result res = LEP_RunOemReboot(&_port);

	if(res != LEP_OK)
		printf("restart unsuccessful with error: %d\n", res);
	else
		printf("restart successful!\n");
}
