using Gridap

L=2
domain=(0,L)
partition=(11,)

model = CartesianDiscreteModel(domain,partition)
labels=get_face_labeling(model) #for dealing with multiple boundary conditions for different parts of the boundary

add_tag_from_tags!(labels,"left",[1])
add_tag_from_tags!(labels,"right",[2])

Ω = Triangulation(model)#The discrete domain

Γright=Boundary(Ω,tags="right") #Computing the boundary and approx any boundary integral

reffe=ReferenceFE(lagrangian,Float64,1) #usually conformity="H1"

V=TestFESpace(Ω,reffe,dirichlet_tags="left")

uleft=0.0
f2(x)=sin(π*x[1])

#f=-10.0
g=4.0

U=TrialFESpace(V,uleft) #in this case trail space and test space is the same
dΩ=Measure(Ω,2)
dΓright=Measure(Γright,2)

a(u,v)=∫(∇(u)⋅∇(v))dΩ
F(v)= ∫(f2*v)dΩ+∫(g*v)dΓright

oper =AffineFEOperator(a,F,U,V)

uh=solve(oper)
writevtk(Ω,"1dSolution",cellfields=["u"=>uh])