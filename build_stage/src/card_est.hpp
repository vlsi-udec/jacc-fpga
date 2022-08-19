#include "hllpp.hpp"
#include <algorithm>

#ifndef CARD_EST_H
#define CARD_EST_H

double get_threshold(int p)
{
    return THRESHOLD_DATA[p - 4];
}

std::vector<int> get_nearest_neighbors(double E, std::vector<double> estimate)
{
    std::vector< std::pair<double,int> > distance_map;
    std::vector<int> nearest;

    int i = 0;
    for (auto v: estimate) {
        std::pair<double, int> p(pow(E - v, 2.0), i);
        distance_map.push_back(p);
        i++;
    }

    sort(begin(distance_map), end(distance_map));

    for(int k=0; k < 6; k++) {
        nearest.push_back(distance_map[k].second);
    }

    return nearest;
}

double estimate_bias(double E, int p)
{
    std::vector<int> nearest = get_nearest_neighbors(E, rawEstimateData[p]);
    double estimate = 0.0;

    for (auto v: nearest) {
        estimate += biasData[p][v];
    }
    return estimate / nearest.size();
}

template<size_t precision>
double hll_estimate (uint32_t sum_, uint16_t zeros)
{
	const size_t buckets = 1 << precision;
	const double m = buckets * buckets;
	// double sum_ = sum;
	double m_ = (1 << 16) * m / sum_;

	double alpha;

	switch (precision) {
		case 4: alpha = 0.673; break;
		case 5: alpha = 0.697; break;
		case 6: alpha = 0.709; break;
		default:
			alpha = (0.7213 / (1.0 + (1.079 / double(1ULL << precision))));
	}

	double C = alpha * m_;
	if (zeros > 0 && C <= 2.5 * buckets)
	{
		C = 2.5 * std::log2 (buckets / zeros);
	}

	return C;
}


double jaccard_index (uint u_card, uint i_card)
{
	if (i_card > u_card) return 0;
	return i_card / double (u_card);
}

#endif // CARD_EST_H
