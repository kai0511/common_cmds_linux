#!/usr/bin/env python

import os
import pandas as pd

if __name__ == '__main__':
    os.chdir("/exeh_3/kai/GE_result/coefs")
    fileList = os.listdir(".")

    for f in fileList:
        rankedFileName = ''.join([f.split('.')[0], '_ranked.csv'])

        if f.endswith("weighted.csv"):
            coefs = pd.read_csv(f, header=None, usecols = [1,2,3,4,5], index_col = 0)
        else:
            continue
        coefs.columns = pd.Index(['coef1', 'coef2', 'coef3', 'avg_coef'])
        coefs['abs_avg_coef'] = coefs['avg_coef'].abs()
        coefs.sort_values(by = ['abs_avg_coef'], ascending = False)
        coefs.to_csv(rankedFileName)
