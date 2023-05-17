# Airfoil 2D Evaluation via DbM Weight Input
## How to run
1. Store all morphing weight (coefficient) sets to be evaluated in weightInput.dat. Each weight set must be written in a single row, where each weight is delimited by space. The weight sets are indexed by the row number.
2. Run: matlab -batch "eval_script(${index});exit;"

*You may change the baseline shapes for DbM in BaseShapes. In the original dump, there are the 25 airfoil baseline shapes chosen in the paper (Sheikh et al., 2023).*