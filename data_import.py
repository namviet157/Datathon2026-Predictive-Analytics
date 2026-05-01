import pandas as pd
from sqlalchemy import create_engine
import glob
import os

engine = create_engine("postgresql://postgres:minhanh237@localhost:5432/datathon_v1")

for f in glob.glob(os.path.join('data', '*.csv')):
    table = os.path.basename(f).removesuffix('.csv')
    df = pd.read_csv(f)
    df.to_sql(table, engine, if_exists="replace", index=False)
    print(f"Imported {table} into database.")