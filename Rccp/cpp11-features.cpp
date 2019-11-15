/* create vector */
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector create_vector() {

    NumericVector v1 = NumericVector::create(1.0, 2.0, 3.0);
    NumericVector v2 = {1.0, 2.0, 3.0};
    NumericVector v3 {1.0, 2.0, 3.0};

    return(v1 + v2 + v3);
}

// [[Rcpp::export]]
NumericVector rcpp_lambda(NumericVector v) {
    /* NumericVector v = {1, 2, 3, 4, 5}; */
    double a = 2.0;
    NumericVector res = sapply(v, [&](double x){return a * x; });
    return(res);
}
