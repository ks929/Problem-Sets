# include the Include.jl -
include("Include.jl")


# Case 1
κ = 1.0
h = 0.1 
N = Int(20/h)
Cₒ = 10.0 
model = build(MyChemicalDecayModel, κ = κ , h = h, N = N, Cₒ = Cₒ)
A = model.A
b = model.b
x1_iterative_J = solve(JacobiIterationSolver(),model.A,model.b,zeros(200));
x1_iterative_GS = solve(GaussSeidelIterationSolver(),model.A,model.b,zeros(200));
x1_direct = inv(A)*b
error_J = norm((x1_iterative_J-x1_direct))
error_GS = norm((x1_iterative_GS-x1_direct))