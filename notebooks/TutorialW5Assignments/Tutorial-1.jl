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
    degree = 4*(p-1)^2 #from the tutorial higher quadrature
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

