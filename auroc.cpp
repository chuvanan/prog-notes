#include <Rcpp.h>
#include <omp.h>
using namespace Rcpp;

// [[Rcpp::export]]
double auc_roc_(NumericVector actual, NumericVector predicted) {
    NumericVector r;
    double n_pos, n_neg, sum_r = 0.0;
    double auc;

    r = match(predicted, predicted.sort());
    n_pos = sum(actual == 1);
    n_neg = actual.length() - n_pos;
    int N = actual.size();

    #pragma omp parallel for
    for (int i = 0; i < N; i++) {
        if (actual[i] == 1) {
            sum_r = sum_r + r[i];
        }
    }

    auc = (sum_r - n_pos * (n_pos + 1) / 2) / (n_pos * n_neg);
    return (auc);
}
