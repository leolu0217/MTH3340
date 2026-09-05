using Markdown
using InteractiveUtils
using Gridap
using Plots

##Question 1
function PoissonError(p,n,u) #p being the order, u being u(x) and n being number of elements
    Ω = (0.0,1.0)
    N=(n,)
    Gₕ = CartesianDiscreteModel(Ω,N)
    Tₕ = get_triangulation(Gₕ)
    degree = max(4,4*(p-1)^2) #from the tutorial higher quadrature, also make sure p=1 will not be a problem
    dΩ = Measure(Tₕ,degree)
    f(x) = - Δ(u)(x)
    reffe = ReferenceFE(lagrangian,Float64,p)
    Vₕ = TestFESpace(Gₕ,reffe; conformity=:H1, dirichlet_tags="boundary")
    Uₕ = TrialFESpace(Vₕ,u)
    a(u,v) = ∫(∇(v)⋅∇(u))dΩ
	l(v) = ∫(v*f)dΩ
    Fₕ = AffineFEOperator(a,l,Uₕ,Vₕ)
    uₕ = solve(Fₕ)
    e = u - uₕ
    error_l2 = sqrt( sum( ∫( e*e )dΩ ) )
    error_h1 = sqrt( sum( ∫( e*e + ∇(e)⋅∇(e) )dΩ ) )
    return error_l2, error_h1
end 


##Question 2
function Convergence_N(p,n_array,u) #p and u is the same, n_array uses an array
    L2_errors = Float64[]
    H1_errors = Float64[]
       for N in n_array

        error_l2, error_h1 = PoissonError(p, N, u)

        push!(L2_errors, error_l2)
        push!(H1_errors, error_h1)

    end
    return L2_errors, H1_errors
end


#test for Q1-2
u(x) = sin(2π * x[1])

Ns = [2, 4, 8, 16]

L2_errors, H1_errors = Convergence_N(3, Ns, u)

println("L2 errors = ", L2_errors)
println("H1 errors = ", H1_errors)


## Question 3
u(x) = sin(2π*x[1])#the new function we Define
Ns = 2 .^ (2:5)
p=3#FE order
L2_errors, H1_errors = Convergence_N(p, Ns, u)#call error functions
println("Ns = ", Ns)
println("L2 errors = ", L2_errors)
println("H1 errors = ", H1_errors)
#Output
#L2 slope = -4.0916094546431845
#H1 slope = -3.088391202094033

#Taking Log
logN = log.(Ns)
logL2 = log.(L2_errors)
logH1 = log.(H1_errors)

#Linear Regression
A = hcat(
    ones(length(logN)),
    logN
)

# Linear regression
coeff_L2 = A \ logL2
coeff_H1 = A \ logH1

slope_L2 = coeff_L2[2]
slope_H1 = coeff_H1[2]

println()
println("L2 slope = ",slope_L2)
println("H1 slope = ",slope_H1)

#L2 plot
plot(
    Ns,
    L2_errors,
    xscale=:log10, #log axis
    yscale=:log10, #log axis
    xlabel="Number of elements N",
    ylabel="L2 error",
    title="L² Error Convergence, p = $p"
)

#H1 plot
plot(
    Ns,
    H1_errors,
    xscale=:log10, #log axis
    yscale=:log10, #log axis
    xlabel="Number of elements N",
    ylabel="H1 error",
    title="H1 Error Convergence, p = $p"
)

##Question 4
N = 8 #fix N
p_array = [2, 3, 4]

#create empty array
L2_errors_p = Float64[]
H1_errors_p = Float64[]

# Calculate errors for each p
for p in p_array
    error_l2, error_h1 = PoissonError(p, N, u)
    push!(L2_errors_p, error_l2)
    push!(H1_errors_p, error_h1)

end

println("p values = ", p_array)
println("L2 errors = ", L2_errors_p)
println("H1 errors = ", H1_errors_p)

#Plot
plot(
    p_array,
    L2_errors_p,
    #yscale = :log10,
    marker = :circle,
    xlabel = "Finite element order p",
    ylabel = "Error",
    label = "L2 error",
    xticks = p_array
)
plot!(
    p_array,
    H1_errors_p,
    marker = :square,
    label = "H1 error"
)