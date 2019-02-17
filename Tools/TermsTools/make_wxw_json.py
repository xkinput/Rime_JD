#!/usr/bin/env python3
# coding:utf-8

# import numpy as np
import pandas as pd
import os
import io
import sys
import time
import re


def ImportFile(filepath, colsname=['phr', 'code'], rowsname=False):
    input_file = os.path.expandvars(filepath)
    with open(input_file, 'r', encoding='utf8') as lookup_file:
        df = pd.read_csv(lookup_file, delimiter='\t', names=colsname,
                         index_col=rowsname)
    return df


def ConvertYaml2Df(filepath, col_name=['phr', 'sbb']):
    input_file = os.path.expandvars(filepath)
    lst_keep = []
    with open(input_file, 'r') as f:
        regexp = re.compile(r'#|---|\.\.\.|^[a-z]+\s?:')
        for line in f:
            if regexp.search(line):
                pass
            else:
                line = line.rstrip().split("\t")
                lst_keep.extend([line])

    df = pd.DataFrame.from_records(lst_keep, columns=col_name)
    return df


# =============================================================================
dir_dict = os.getcwd()
schema = ['xkjd6', 'xkyb']
lang = ['', '_tc']
sel_schema = schema[0]
sel_lang = lang[0]
sel = sel_schema + sel_lang

df_wxw = ConvertYaml2Df(os.path.join(dir_dict, sel + ".wxw.dict.yaml"))
df_wxw.sort_values(by='sbb', inplace=True)
df_buchong = ConvertYaml2Df(os.path.join(dir_dict, sel + ".buchong.dict.yaml"))
df_cizu = ConvertYaml2Df(os.path.join(dir_dict, sel + ".cizu.dict.yaml"),
                         ['phr', 'sybbbb'])

df_ss = df_buchong[ (df_buchong.phr.str.len() == 2) &
                    (df_buchong.sbb.str.len() == 2)]
df_concat = pd.concat([df_wxw, df_ss], axis=0)
df_mg = pd.merge(how='left', left=df_concat, right=df_cizu, on='phr',
                 sort=False).drop_duplicates(['phr'], keep='first')
df_mg.fillna(value="", inplace=True)
df_mg['value'] = df_mg.loc[:, ['sybbbb', 'sbb']].apply("_".join, axis=1)
df_final = df_mg.loc[:, ['phr', 'value']]
df_final.to_csv("../../rime/opencc/WXWPrompt" + sel_lang + ".txt", sep='\t',
                index=0, header=0)
df_cizu.to_csv("../../rime/opencc/WXWPromptFilters" + sel_lang + ".txt",
               sep='\t', index=0, header=0)
