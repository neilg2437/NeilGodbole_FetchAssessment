#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import pandas as pd


brands = pd.read_csv("/Users/neilgodbole/Desktop/brands.csv")
receipts = pd.read_csv("/Users/neilgodbole/Desktop/receipts.csv")
receipt_items = pd.read_csv("/Users/neilgodbole/Desktop/receipt_items.csv")
users = pd.read_csv("/Users/neilgodbole/Desktop/users.csv")

def check_data_quality(df, table_name):
    print(f"\n--- Data Quality Report for {table_name} ---\n")
    
    # Check for missing values
    missing = df.isnull().sum()
    if missing.any():
        print("Missing Values:")
        print(missing[missing > 0])
    else:
        print("No missing values found.")
    
    # Check for duplicate rows
    duplicate_rows = df.duplicated().sum()
    print(f"Duplicate Rows: {duplicate_rows}")
    
    # Check for unique values in potential primary keys
    for column in df.columns:
        unique_count = df[column].nunique()
        if unique_count == len(df):
            print(f"Column '{column}' is unique and may be a primary key.")
        elif unique_count < len(df):
            print(f"Column '{column}' has {len(df) - unique_count} duplicate values.")
    
    # Check data types
    print("\nData Types:")
    print(df.dtypes)
    
    # Check for unexpected or inconsistent values
    for column in df.columns:
        if df[column].dtype == 'object':  # Strings
            unique_values = df[column].dropna().unique()
            if len(unique_values) > 50:
                print(f"Column '{column}' has more than 50 unique values. Example values: {unique_values[:5]}")
        elif df[column].dtype in ['int64', 'float64']:  # Numeric
            min_val = df[column].min()
            max_val = df[column].max()
            print(f"Column '{column}' has range {min_val} to {max_val}.")
    
    #  checks based on barcode logic
    if "barcode" in df.columns:
        invalid_barcodes = df[df["barcode"].astype(str).str.len() < 5]
        if not invalid_barcodes.empty:
            print(f"Found invalid barcodes with fewer than 5 characters:\n{invalid_barcodes}")
    
    print("\n--------------------------------------------\n")

# Run data quality checks on all tables
check_data_quality(brands, "brands")
check_data_quality(receipts, "receipts")
check_data_quality(receipt_items, "receipt_items")
check_data_quality(users, "users")
