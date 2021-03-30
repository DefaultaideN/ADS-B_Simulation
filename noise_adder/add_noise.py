import pandas as pd 
import os
PATH = ''
CSV_FILE_PATH = 'E:/RTCA DO-365 MOPS_Test_Vectors/converging/C1/Intruder/C1_Truth_TVInt1.csv'
df = pd.read_csv(CSV_FILE_PATH)
print(df['Alt(ft)'])