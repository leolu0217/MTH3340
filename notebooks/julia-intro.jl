### A Pluto.jl notebook ###
# v1.0.3

using Markdown
using InteractiveUtils

# ╔═╡ 35d934a8-5ed4-4578-a2ba-d2fbd494ba7e
using Gridap

# ╔═╡ 48deba06-8334-47d4-a369-17521d804580
a = 5+3

# ╔═╡ 0103b36e-dcbb-4774-bf94-9bebff55bf76
typeof(a)

# ╔═╡ 6547039b-1c87-4ef9-b2ad-2a84a038727c
b = "Hello"

# ╔═╡ 76f68199-b3be-43a6-9ea7-a4b6ff541b68
typeof(b)

# ╔═╡ 84dbb3b4-8bec-4b45-b4b3-935e5853dabb
# Run these lines in a Julia REPL
# > using AbstractTrees
# > AbstractTrees.children(d::DataType) = subtypes(d)
# > print_tree(Number)

# ╔═╡ 2c2e3204-7d75-4dc7-9f48-368455b8a200
Float64(5)

# ╔═╡ b5457c56-ff7f-4aa3-9427-8bfbdf4e06ff
Int64(3.0)

# ╔═╡ 0e2154f2-3982-4efb-8e7c-e6666316cd92
Int64(7.6) # 7.6 cannot be converted to Int64 without changing its value

# ╔═╡ 8367bf4c-90b5-4a94-82df-72b557f0129e
floor(Int64,7.6)

# ╔═╡ 8e93d3d1-015b-429c-92d6-ce397eecf24d
ceil(Int64,7.6)

# ╔═╡ 264f3c25-5e23-44bd-8354-37cd8d82bf0f
Float64("hello")

# ╔═╡ 5febcf2a-0ca4-40b4-b662-8628b91247f2
f(x) = x^2

# ╔═╡ 634967ec-5ef2-452b-bef0-72bac47cbb3c
f(2)

# ╔═╡ 50b06284-59bd-45f5-ab34-cfe03e1f91eb
f(1.5)

# ╔═╡ 13127cbf-857c-4a9b-8df8-bade87cb471d
f([1 0; 0 2])

# ╔═╡ d6b1a809-9a7e-459f-a032-02b982d941a9
nice_sum(a::Real,b::Real) = "The sum of these two Float64 numbers is $(a+b)"

# ╔═╡ b74cb151-adcf-46b3-a635-ae965f9a72cd
nice_sum(1.0,2.0) # We have not implemented this! Why does it work? (see the Real tree)

# ╔═╡ 612baddc-f4b8-4599-8f8e-4bcc22205b04
nice_sum(3,4) # We have not implemented this! Why does it work? (see the Real tree)

# ╔═╡ 2607d711-f312-4574-bd3c-8ae3f43e8431
nice_product(a::Float64,b::Float64) = "The product of these two Float64 is $(a*b)"

# ╔═╡ 60eaabfd-716c-44f9-8a5d-2336f7f9a931
nice_product(1.0,3.0) # Default is Float64

# ╔═╡ 70eab5c5-9640-4e07-8de2-e0b875298fad
nice_product(1,3) # Why this is not working? (check the Real tree again)

# ╔═╡ 3fd17a38-cfeb-464a-be2b-8d11f64230b9
nice_division(a::Int,b::Int) = "The quotient of these two Integer numbers is $(a/b)"

# ╔═╡ 3c1c797f-a436-4144-9134-a76b92459cda
nice_division(a::Real,b::Real) = "The quotient of these two Real numbers is $(a/b)"

# ╔═╡ cbec6d57-8e3c-41bd-9bff-0bd871facd50
nice_division(a::Int,b::Real) = "The quotient of these Integer and Real numbers is $(a/b)"

# ╔═╡ 08d241f3-bff1-4aa7-bd0a-bf7721731ecf
nice_division(a::Real,b::Int) = "The quotient of these Real and Integer numbers is $(a/b)"

# ╔═╡ d7f3774b-2a96-49b4-b0e3-1d8ee564ac2e
nice_division(1,3)

# ╔═╡ 4d94451f-b697-4d03-9ab9-98445f42b9e0
nice_division(0.5,6.7)

# ╔═╡ 1eb31813-c3a6-4d3b-a299-0372ce5057a9
nice_division(3,4.5)

# ╔═╡ 1e239a27-d73d-4327-ad34-cd0d3f4aeb1f
nice_division(4.5,3)

# ╔═╡ 8c8e8d3e-5416-4a8a-811b-6c9042ad9f77
struct ExponentialVector1
	r
	d::Int
end

# ╔═╡ 3ae90d7b-a168-4bb7-9da0-9f3c3be1db14
A = ExponentialVector1(3.0,2)

# ╔═╡ 418b0774-50fd-4afc-89d8-11b3a69eb136
typeof(A)

# ╔═╡ 853c10b8-f270-4bf9-9334-5c0fc555562a
struct ExponentialVector2{T<:Number}
	r::T
	d
end

# ╔═╡ 8afeef64-3d28-4175-ad84-87ddc6bd6d0c
begin 
# begin end are only needed for Pluto (to include more than one instruction in a cell)
  B = ExponentialVector2(4.0,5)
  C = ExponentialVector2(6,5)
end

# ╔═╡ 6cb426c1-a002-4c0b-a6be-185999bdc635
typeof(B)

# ╔═╡ 81d604b5-6424-4e25-9116-5a3507a937a0
typeof(C)

# ╔═╡ 9fcbf35e-a5a7-4a0e-94ee-97697c083575
struct ExponentialVector3{T} <: AbstractVector{T} # or AbstractArray{T,1}
	r::T
	d::Int
end

# ╔═╡ b5362538-64ad-4d60-8e40-aef9c3feb694
begin 
    Base.size(A::ExponentialVector3) = (A.d,)
	Base.IndexStyle(::Type{ExponentialVector3}) = IndexLinear()
	Base.getindex(A::ExponentialVector3,i::Int) = A.r^i  
end

# ╔═╡ 8e25ccb7-7b49-4e9d-90e5-ad4de5473465
md"# Introduction to Julia

In this tutorial, we will learn the basics of `Julia`. We can run this tutorial from VSCode, using the REPL, or as a Pluto notebook.
"

# ╔═╡ 04aeddda-2ff7-11ee-3a5e-8bb3ef0ba8df
md"## Installing packages

The `Julia` package manager is simply great. You can easily install `Julia` packages included in the `Julia` registry from the REPL. Below, we are importing and installing `Gridap`, the finite element code we are going to use in some of the lectures.
"

# ╔═╡ 93df5d91-a432-402d-b85c-56395fb67750
md"## Basic variables

`Julia` is the choice for this unit for a very simple reason. It is easy to use and can be very fast. The typical motto is _walks like Python, runs like C_. It means that you can easily prototype codes like in an *interpreted language* (like Python). There is no need to type each and every variable you aim to use in a header, as one does in *compiled* languages like C, C++ or FORTRAN. We call this way of coding _duck typing_. As soon as the code _makes sense_ (e.g., you cannot compute the absolute value of a string), you don't need to explicitly provide the type of your variables.
"

# ╔═╡ 4f6cfa6b-0b0b-49e3-ae5c-fe44653eedd5
md"We did not explictly assign a type to these variables, the language did it for us."

# ╔═╡ 9695b546-0bc8-4473-85e0-afb01dc8e60f
md"## The type ecosystem"

# ╔═╡ 5e1c18ef-cd95-4edc-81a6-bf38ec7162c3
md"One of the most important parts to understand when we start working with `Julia` is the *type ecosystem*. We can think of it as a huge tree, the root being the most abstract type and getting more concrete as we go up through the branches. This is called the type hierarchy. For instance, we can see below the portion of the type ecosystem that starts in `Number` (great example for a math unit)."

# ╔═╡ 0282ab96-9f79-4bbc-a817-b28c46f064dd
md"It makes mathematical sense, a rational number is a sub-type of a real number, which is a sub-type of a number."

# ╔═╡ 8f27cc1e-6f03-4f05-b18c-26f61b14629f
md"The type system provides conversions between types (if possible). E.g., we can convert integers to floats. However, we cannot convert a float to an integer (in general)."

# ╔═╡ aab16cc1-830f-4e74-ba9e-f07e78d27001
md" The type ecosystem is dynamic, i.e., you can extend it adding your sub-types. The root of the type system is `Any`. You can see the huge Julia type system by plotting the type tree of `Any`."

# ╔═╡ 05779915-ed1d-4c7e-9058-b645e1d331ba
md"## Multiple dispatching

`Julia` is *not* based on the object-oriented programming language (unlike Python, or C++). If you are expert in OOP, you need to adapt to a new way of thinking. Leaving computer science technicalities aside, the core of `Julia` programming paradigm is *multiple dispatching*. Multiple dispatch provides a mechanism to define a function with different implementations, and to pick the implementation depending on the type of multiple arguments. It is strongly connected to the dynamic type system.

`Julia` also uses many features of `functional` programming. We can declare functions, pass them as arguments of other functions, etc. 

Let us create our first function.
"

# ╔═╡ 72be3410-0152-42b1-8f76-bfc3566ea3a3
md"We can now apply this function to any existing `Julia` existing type for which its square makes sense (and it has been implemented). So, we can apply `f` to any kind of number, matrix, etc."

# ╔═╡ 3ba80192-2368-4e95-b670-fcfac76f58de
md" Internally, Julia is using multiple dispatching to decide whether to use the product of numbers or matrices (totally different implementations). Let us create our own multiple dispatching example.

First, we create a function that adds two Float64 numbers and writes a message"

# ╔═╡ b4eefcb0-9303-4885-b2e1-811573dd184c
md"Let us create another example. We create now `nice_product` for Integer"

# ╔═╡ 669f6613-bd63-4b3d-b3ee-eaf6c67409af
md"Now let us define another method for division, now using (simple) dispatching"

# ╔═╡ bf04e4e0-b6a2-4a20-b164-937d9e0b9577
md"And now examples of multiple dispatching."

# ╔═╡ 40bb892b-249c-4285-8845-3ae5248b80da
md"## Data types

In `Julia`, you can define your own data types and extend the type system. In particular, you can define composite types (`struct`). Combining this dynamic type system with multiple dispatching provides a very extensible and powerful language. 

In `Julia`, all `array` types are sub-types of an abstract type called `AbstractArray`. Let us create a very specific array. Let us consider a vector such that, given a number `r` and a length `D`, has values `r^1, r^2, ..., r^(D-1)`. We will call this vector type `ExponentialVector`. We will create more than one type to learn different important aspects of `struct`. We will call them `ExponentialVector1`, `ExponentialVector2`,...
"

# ╔═╡ 1d445c8f-7397-4147-bfdd-96c725d9514c
md"We can do better. We can use template parameters. I.e., we can define in one shot so many different types. E.g., a vector can be a vector of reals, integers, etc. With the constructor above, the type `ExponentialVector1` does not provide any information about the kind of numbers it stores."

# ╔═╡ 21440601-8708-4920-a6ca-3e30ca325973
md"Here, `T` is the template parameter and `T<:Number` means that `T` must be a sub-type of `Number`. We don't want to create matrices with e.g. strings. Now, let us see what info we get after creating our vector."

# ╔═╡ 6956f1c7-ccbd-44ac-9fb1-4c46e8afda49
md"The type `ExponentialVector2{Float64}` tells us that the vector has  `Float64` entries. This type is different from, e.g. `ExponentialVector2{Int64}`. So you can define different implementations (e.g., the dot product) for each case and dynamically pick the right implementation using multiple dispatching. Probably, it does not make much sense in this example, but it does in more complex situations.

You can have as many template parameters as you want.

For instance `AbstractArray{T,D}` type in `Julia` has two template parameters, `T` is the type of the array entries and `D` is the dimension of the array (e.g., 1 for vectors and 2 for matrices). An `AbstractVector{T}` is an alias for `AbstractArray{T,1}`.

The possibility of extending existing types in the type system is one of the most powerful features of 'Julia'. It is clear that `ExponentialVector2{Float64}` should be a subtype of `AbstractArray{Float64,1}`. We can do that as follows.
"




# ╔═╡ 05e10551-e7cc-4b3f-9321-f58162eed217
md"And now the magic comes. Which are the most basic methods that an array should be able to answer? In other words, which is the _interface_ of `AbstractArray` in `Julia`?

You can find it here: [https://docs.julialang.org/en/v1/manual/interfaces/](https://docs.julialang.org/en/v1/manual/interfaces/)

To understand the interface is too much at this stage. Let us consider the _required_ methods. 
"  

# ╔═╡ 03b2ad88-cf40-4946-901f-89a8af9b57b4
D = ExponentialVector3(4.0,3)

# ╔═╡ 9c212c12-2235-4420-af35-5de876325332
getindex(D,5)

# ╔═╡ 53c3011a-9980-434a-960e-8c14fdf81582
size(D)

# ╔═╡ ff9a97e6-1661-4b56-b3af-9fef26ce6a50
dot(D,D)

# ╔═╡ 76d26b37-6f5a-48cb-b136-a22022bf3c39
md"Who implemented the dot product of vectors? The inner product of functions can be implemented for an abstract array just using `size` and `getindex`. In `Julia`, there is an implementation of the dot product for this abstract type. We have created a sub-type of `AbstractVector`. Using multiple dispatch, `Julia` seeks the most _concrete_ `dot` implementation. In this case, since we have not implemented one for `ExponentialVector3`, it uses the one for `AbstractVector` in `Julia`.

 Note that `ExponentialVector2` is not a sub-type of `AbstractVector`, so we are not able to re-use `Julia` generic code.

You probably see now the potential of this language."

# ╔═╡ ef94bd94-21b7-46a0-8a2d-f857b7a064cd
md"## Just-in-time compilation

Why is `Julia` much faster than `Python`, and as fast as typed (compiled) languages like C?

You have seen that in `Julia` you can write code like in `Python`, without declaring the type of your variables (type annotation). But *you can also annotate the type* if you want. Why would you do this extra work? 

The reason is that `Julia` compiles code on the fly, e.g., in run-time. If you declare the type of a function argument, the compiler can do many optimisations (as in C, FORTRAN,...) and end up with very efficient code.

In `Julia`, you can quickly write a prototypical code (not paying attention to performance, without typing) or write extremely fast code (using type annotation in the right places). To know when you should provide the type is not easy, and requires some understanding on how `Julia` and its JIT compiler work.

In any case, performance is not an issue in this unit."

# ╔═╡ Cell order:
# ╟─8e25ccb7-7b49-4e9d-90e5-ad4de5473465
# ╟─04aeddda-2ff7-11ee-3a5e-8bb3ef0ba8df
# ╠═35d934a8-5ed4-4578-a2ba-d2fbd494ba7e
# ╟─93df5d91-a432-402d-b85c-56395fb67750
# ╠═48deba06-8334-47d4-a369-17521d804580
# ╠═0103b36e-dcbb-4774-bf94-9bebff55bf76
# ╠═6547039b-1c87-4ef9-b2ad-2a84a038727c
# ╠═76f68199-b3be-43a6-9ea7-a4b6ff541b68
# ╟─4f6cfa6b-0b0b-49e3-ae5c-fe44653eedd5
# ╟─9695b546-0bc8-4473-85e0-afb01dc8e60f
# ╟─5e1c18ef-cd95-4edc-81a6-bf38ec7162c3
# ╠═84dbb3b4-8bec-4b45-b4b3-935e5853dabb
# ╟─0282ab96-9f79-4bbc-a817-b28c46f064dd
# ╟─8f27cc1e-6f03-4f05-b18c-26f61b14629f
# ╠═2c2e3204-7d75-4dc7-9f48-368455b8a200
# ╠═b5457c56-ff7f-4aa3-9427-8bfbdf4e06ff
# ╠═0e2154f2-3982-4efb-8e7c-e6666316cd92
# ╠═8367bf4c-90b5-4a94-82df-72b557f0129e
# ╠═8e93d3d1-015b-429c-92d6-ce397eecf24d
# ╠═264f3c25-5e23-44bd-8354-37cd8d82bf0f
# ╟─aab16cc1-830f-4e74-ba9e-f07e78d27001
# ╟─05779915-ed1d-4c7e-9058-b645e1d331ba
# ╠═5febcf2a-0ca4-40b4-b662-8628b91247f2
# ╟─72be3410-0152-42b1-8f76-bfc3566ea3a3
# ╠═634967ec-5ef2-452b-bef0-72bac47cbb3c
# ╠═50b06284-59bd-45f5-ab34-cfe03e1f91eb
# ╠═13127cbf-857c-4a9b-8df8-bade87cb471d
# ╟─3ba80192-2368-4e95-b670-fcfac76f58de
# ╠═d6b1a809-9a7e-459f-a032-02b982d941a9
# ╠═b74cb151-adcf-46b3-a635-ae965f9a72cd
# ╠═612baddc-f4b8-4599-8f8e-4bcc22205b04
# ╟─b4eefcb0-9303-4885-b2e1-811573dd184c
# ╠═2607d711-f312-4574-bd3c-8ae3f43e8431
# ╠═60eaabfd-716c-44f9-8a5d-2336f7f9a931
# ╠═70eab5c5-9640-4e07-8de2-e0b875298fad
# ╠═669f6613-bd63-4b3d-b3ee-eaf6c67409af
# ╠═3fd17a38-cfeb-464a-be2b-8d11f64230b9
# ╠═d7f3774b-2a96-49b4-b0e3-1d8ee564ac2e
# ╠═3c1c797f-a436-4144-9134-a76b92459cda
# ╠═4d94451f-b697-4d03-9ab9-98445f42b9e0
# ╠═cbec6d57-8e3c-41bd-9bff-0bd871facd50
# ╠═bf04e4e0-b6a2-4a20-b164-937d9e0b9577
# ╠═1eb31813-c3a6-4d3b-a299-0372ce5057a9
# ╠═08d241f3-bff1-4aa7-bd0a-bf7721731ecf
# ╠═1e239a27-d73d-4327-ad34-cd0d3f4aeb1f
# ╠═40bb892b-249c-4285-8845-3ae5248b80da
# ╠═8c8e8d3e-5416-4a8a-811b-6c9042ad9f77
# ╠═3ae90d7b-a168-4bb7-9da0-9f3c3be1db14
# ╠═418b0774-50fd-4afc-89d8-11b3a69eb136
# ╠═1d445c8f-7397-4147-bfdd-96c725d9514c
# ╠═853c10b8-f270-4bf9-9334-5c0fc555562a
# ╟─21440601-8708-4920-a6ca-3e30ca325973
# ╠═8afeef64-3d28-4175-ad84-87ddc6bd6d0c
# ╠═6cb426c1-a002-4c0b-a6be-185999bdc635
# ╠═81d604b5-6424-4e25-9116-5a3507a937a0
# ╠═6956f1c7-ccbd-44ac-9fb1-4c46e8afda49
# ╠═9fcbf35e-a5a7-4a0e-94ee-97697c083575
# ╟─05e10551-e7cc-4b3f-9321-f58162eed217
# ╠═b5362538-64ad-4d60-8e40-aef9c3feb694
# ╠═03b2ad88-cf40-4946-901f-89a8af9b57b4
# ╠═9c212c12-2235-4420-af35-5de876325332
# ╠═53c3011a-9980-434a-960e-8c14fdf81582
# ╠═ff9a97e6-1661-4b56-b3af-9fef26ce6a50
# ╠═76d26b37-6f5a-48cb-b136-a22022bf3c39
# ╟─ef94bd94-21b7-46a0-8a2d-f857b7a064cd
