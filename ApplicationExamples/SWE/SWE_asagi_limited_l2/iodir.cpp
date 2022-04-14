#include "iodir.h"

std::string get_input(){
    const char* env_path = std::getenv("SHARED_DIR");
    if(env_path == NULL){
        env_path = "/tmp/";
        std::cout << "Shared directory path not set" <<std::endl;
    }
    std::string input(env_path);
    return inputsfile(input+"inputs.txt");
}

std::string get_output(){
    const char* env_path = std::getenv("SHARED_DIR");
    if(env_path == NULL){
        env_path = "/tmp/";
        std::cout << "Shared directory path not set" <<std::endl;
    }
    std::string output(env_path);
	return outputsfile(output+"outputs.txt");
}
