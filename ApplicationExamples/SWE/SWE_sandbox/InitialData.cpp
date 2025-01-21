#include "InitialData.h"

#include "easi/YAMLParser.h"
#include "easi/ResultAdapter.h"
#include "reader/asagi_reader.h"
#include <cmath>
#include <vector>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <stdlib.h>
#include "iodir.h"

using namespace std;
///// 2D /////
std::vector<double> param = {0.0,0.0};

#ifdef Dim2

InitialData::InitialData()
	: scenario(){
		std::cout << "Initialising with ASAGI" << std::endl;

        auto inputs = get_input();
        std::ifstream inputsfile(inputs);
        for (int i = 0; i < 2; i++) {
			inputsfile >> param[i];
		}
		inputsfile.close();
		std::cout << "Read inputs in exahype:" << param[0] << " and " << param[1] << std::endl;

		asagiReader = new AsagiReader("");
		parser = new easi::YAMLParser(3, asagiReader);
		model  = parser->parse("data.yaml");
	}

InitialData::InitialData(int a_scenario, char* filename)
	: scenario(a_scenario){
		std::cout << "Initialising with ASAGI" << std::endl;

        auto inputs = get_input();
        std::ifstream inputsfile(inputs);
        for (int i = 0; i < 2; i++) {
			inputsfile >> param[i];
		}
		inputsfile.close();
		std::cout << "Read inputs in exahype:" << param[0] << " and " << param[1] << std::endl;

		asagiReader = new AsagiReader("");
		parser = new easi::YAMLParser(3, asagiReader);
		model  = parser->parse(filename);
	}

InitialData::~InitialData(){
	delete asagiReader;
	delete parser;
	delete model;
}


void InitialData::readAsagiData(const double* const x,double* Q){
	double bathymetry[1];
	bathymetry[0] = 0.0;

	easi::ArraysAdapter<double> adapter;
	adapter.addBindingPoint("b",bathymetry);

	easi::Query query(1,3);
	query.x(0,0)=x[0];
	query.x(0,1)=x[1];
	query.x(0,2)=0;
	model->evaluate(query,adapter);

	Q[0]=std::max(0.0,-bathymetry[0]);
	if(std::isnan(Q[0]))
		std::cout << "Error when reading bathymetry" << x[0] << "," << x[1] << std::endl;
	Q[1]= 0;
	Q[2]= 0;
	Q[3]= 100; //TODO 
}

void InitialData::getInitialData(const double* const x,double* Q) {
	readAsagiData(x, Q);
}

#endif
