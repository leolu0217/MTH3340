using Gridap
using Printf


L = 2
domain = (0,L)

const α = 1.0

uex(x) = sin(π*x[1])*cos(π*x[1]) #x[1] since x is a vector!!!
f(x) = - α*Δ(uex)(x) #laplacian way of writing it, since 1D so same as 2nd derivative

nkmax = 6 # 

eu = Float64[]
ru = Float64[]
hh = Float64[]
nn = Int[]
push!(ru,0.0) #we are taking an argument (ru) and replace it with an entry(o here)

for nk ∈ 1:nkmax

    n = 2^(nk+1) #partion numbers
    model = CartesianDiscreteModel(domain, (n,))
    order = 1
    reffe = ReferenceFE(lagrangian,Float64,order)
    V = TestFESpace(model,reffe; conformity=:H1, dirichlet_tags="boundary") #)# dirichlet boundary everyw
    U = TrialFESpace(V,uex)
    ndofs = Gridap.FESpaces.num_free_dofs(U)

    Ω = Triangulation(model)
    dΩ = Measure(Ω,2)

    a(u,v) = ∫((α)*∇(u)⋅∇(v))dΩ
    l(v) = ∫(f*v)dΩ
    op = AffineFEOperator(a,l,U,V)
    uh = solve(op)
    e = uex - uh #error here
    H1_error = sqrt(sum(∫(e*e)dΩ)+sum(∫(∇(e)⋅∇(e))dΩ))
    push!(hh,1.0/n)
    push!(nn,ndofs)
    push!(eu,H1_error)

    if nk > 1
        push!(ru,log(eu[nk-1]/eu[nk])/log(hh[nk-1]/hh[nk]))        
    end
end
    
println("===================================================")
    println("   DoF  &    h   &   e(u)   & r(u) ")
 println("==================================================")
    for nk in 1:nkmax
        @printf("%7d & %.4f & %.2e & %.3f  \n", nn[nk], hh[nk], eu[nk], ru[nk]);
    end
    println("=================================================================================================================")