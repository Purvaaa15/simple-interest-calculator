#!/bin/bash

# -----------------------------------------
# 💰 Simple Interest Calculator (Improved)
# -----------------------------------------
# Calculates Simple Interest based on:
# Principal (P), Rate of Interest (R), and Time (T)
# Formula: SI = (P * R * T) / 100
# -----------------------------------------

echo "===================================="
echo "     Simple Interest Calculator     "
echo "===================================="

# Read input values
read -p "Enter Principal Amount (₹): " principal
read -p "Enter Rate of Interest (% per annum): " rate
read -p "Enter Time (in years): " time

# Validate inputs (check if numeric)
if ! [[ "$principal" =~ ^[0-9]*\.?[0-9]+$ ]] || \
   ! [[ "$rate" =~ ^[0-9]*\.?[0-9]+$ ]] || \
   ! [[ "$time" =~ ^[0-9]*\.?[0-9]+$ ]]; then
    echo "❌ Error: Please enter valid numeric values."
    exit 1
fi

# Calculate Simple Interest using bc for float precision
interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)
total=$(echo "scale=2; $principal + $interest" | bc)

# Display results
echo "------------------------------------"
echo "Simple Interest : ₹$interest"
echo "Total Amount    : ₹$total"
echo "------------------------------------"
echo "✅ Calculation Complete!"
