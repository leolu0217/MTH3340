using Markdown
using InteractiveUtils

using Gridap
using Plots
using Test

#Did original coding in the origianl tutorial section, copied here for easy visualiszing all work
#All functions are run in julia from the original note book
function compute_solution(N,order,u)

  f(x) = - Δ(u)(x)

  domain = (0,1)
  partition = (N,)
  model = CartesianDiscreteModel(domain,partition)
  trian = get_triangulation(model)

  degree = (order-1)*2
  dΩ = Measure(trian,degree)
  dΩ_super = Measure(trian,degree*4)

  reffe = ReferenceFE(lagrangian,Float64,order)

  V = TestFESpace(
     model,reffe;
     conformity=:H1,
     dirichlet_tags="boundary")

  U = TrialFESpace(V,u)

  a(u,v) = ∫( ∇(v)⋅∇(u) )dΩ
  l(v) = ∫( v*f )dΩ_super

  op = AffineFEOperator(a,l,U,V)

  uh = solve(op)

  sh1(w) = a(w,w)
  h1(w) = sh1(w)

  e = u - uh


  eh1 = sqrt(sum( ∫( e*e + ∇(e)⋅∇(e) )*dΩ_super ))

  return uh, eh1
end 

function hp_refinement(u,ps,ncells)

  eh1s_hp = []
  ndofs_hp = []
  uhs_hp = []

  for p in ps

    eh1s_h = Float64[]
    ndofs_h = Float64[]
    uhs_h = []

    for N in ncells

      uh, eh1 = compute_solution(N,p,u)
      push!(uhs_h,uh)
      push!(eh1s_h,eh1)

      ndof = Float64(N*p)
      push!(ndofs_h,ndof)

    end

    push!(eh1s_hp,eh1s_h)
    push!(ndofs_hp,ndofs_h)
    push!(uhs_hp,uhs_h)

  end

  return eh1s_hp, ndofs_hp, uhs_hp

end

function convergence_plot(ndofs,eh1,ps)
  plot(ndofs[1],eh1[1],label="p=$(ps[1])",shape=:auto)
  for i=2:length(ndofs)
    plot!(ndofs[i],eh1[i],label="p=$(ps[i])",shape=:auto)
  end
  plot!(xaxis=:log, yaxis=:log,
  shape=:auto,
  label=["H1_error"],
  xlabel="DOFS",ylabel="error norm")
end


function compute_slope(ndofs,error,funx,funy)
  slope = Float64[]
  for i in 1:length(ndofs)
    x = funx.(ndofs[i])
    y = funy.(error[i])
    linreg = hcat(fill!(similar(x), 1), x) \ y
    push!(slope,linreg[2])
  end
  return slope
end

function p_refinement(u,ps,ncells)
  eh1, ndofs, uhs = hp_refinement(u,ps,[ncells])
  eh1 = [eh1[i][1] for i in 1:length(eh1)]
  ndofs = [ndofs[i][1] for i in 1:length(ndofs)]
  # uhs = [uhs[i][1] for i in 1:length(uhs)]
  return eh1, ndofs, uhs
end

#Test1
u_1(x) = sin(2π*x[1])
ps_1 = collect(1:5)
ncells_1 = [2^i for i in 2:5]

eh1_1, ndofs_1, uhs_1 = hp_refinement(u_1, ps_1, ncells_1)

convergence_plot(ndofs_1,eh1_1,ps_1) #Defined later on, but would be easy to do so

slope_1 =compute_slope(ndofs_1,eh1_1,log10,log10)#Defined later on, but would be easy to do so

println("Test 1 slopes = ", slope_1)


#Exercise 1.1

md"for p = 2,3,4,5, the slope is very close to  the expected theoretical slopes of (-p),
which is consistent with the H1 finite element error behaving as O(h^p). Thus, increasing the polynomial order 
increases the rate at which the error decreases under mesh refinement. The (p=1) result differs from the expected slope of approximately (-1), 
which is likely due to numerical and quadrature effects for this particular smooth solution and mesh. Overall,the numerical result agree well with the theoretical result
"
## Test 2

begin
	u_2(x) = x[1] > 0.5 ? 1+2*(x[1]-0.5)-8*(x[1]-0.5)^2 : 2*x[1]
	ps_2 = collect(1:5)
	ncells_2 = [3^i for i in 3:6]
end

eh1_2, ndofs_2, uhs_2 = hp_refinement(u_2,ps_2,ncells_2)

convergence_plot(ndofs_2,eh1_2,ps_2)

slope_2 = compute_slope(ndofs_2,eh1_2,log10,log10)
println("Test 2 slopes = ", slope_2)
#Test 2 slopes = [-0.9991944423128116, -1.005451390518193, -1.0003896737996574, -1.0018121857100581, -1.0005083212682326]
#Exercise 2.1
md"Unlike test 1, increasing finite element order does not continue to 
increase the convergence rate. Since analytical solution is only H^2, the convergence error which is 
in H1 is limited by the regularity of the solution rather 
than the polynomial degree. The expected error are expected to be decreasing on the rate of (O(h)), with a log-log slope close to -1."

## Test 3
	u_3(x) = x[1] > 0.5 ? 1+2*(x[1]-0.5)-8*(x[1]-0.5)^2 : 2*x[1]
	ps_3 = 1:5
	ncells_3 = 9

eh1_3, ndofs_3, uhs_3 = p_refinement(u_3,ps_3,ncells_3)

println("DOFs = ", ndofs_3)
println("H1 errors = ", eh1_3)
#DOFs = [9.0, 18.0, 27.0, 36.0, 45.0]
#H1 errors = [0.45733081085958627, 0.1391012073664793, 0.07669534287215544, 0.054816830542576946, 0.04172850033540449]
plot(ndofs_3,eh1_3,
     xaxis=:identity, yaxis=:log,
     shape=:auto,
     xlabel="DOFS",ylabel="error norm")

slope_3 = compute_slope([ndofs_3],[eh1_3],identity,log10)

println("Slope = ", slope_3)


#Exercise 3.1
md"As the polynomial order (p) increases, the H1 error decreases. 
However, the improvement becomes less significant at higher orders because the exact 
solution has limited regularity, which restricts the effectiveness of (p)-refinement.
"

## Test 4

u_4(x) = sin(2*π*x[1])
ps_4 = 1:9
ncells_4 = 4


eh1_4, ndofs_4, uhs_4 = p_refinement(u_4,ps_4,ncells_4)

plot(ndofs_4,eh1_4,
     xaxis=:identity, yaxis=:log,
    #  label=:pconv,
     shape=:auto,
     xlabel="DOFS",ylabel="error norm")

slope_4 = compute_slope([ndofs_4],[eh1_4],identity,log10)

println("Slope = ", slope_4)
#Slope = [-0.27180402024049594]

#Exercise 4.1
md"As the polynomial order (p) increases, the H1 error decreases more rapidly than in Test 3.
 This is because higher-order polynomials approximate the smooth solution more efficiently. 
Therefore, (p)-refinement is much more effective for smooth solutions than for solutions with limited regularity.
"

## Test 5:
u_5(x) = sin(64*π*x[1])
ps_5 = collect(2:5)
ncells_5 = [2^i for i in 3:10]

eh1_5, ndofs_5, uhs_5 = hp_refinement(u_5,ps_5,ncells_5)

convergence_plot(ndofs_5,eh1_5,ps_5)

slope_5 = compute_slope(ndofs_5,eh1_5,log10,log10)
println("Slope = ", slope_5)
#Slope = [-1.4756040431168642, -2.3130363698476626, -3.3150619206802365, -4.2324117260320975]
md"For coarse meshes, the highly oscillatory function is not well 
resolved, so the numerical convergence rates are lower than the ideal values. 
As the mesh is refined, the error decreases more rapidly, and higher-order 
finite elements give steeper convergence, approaching the expected (O(h^p)) behaviour."