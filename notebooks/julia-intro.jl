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

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Gridap = "56d4f2e9-7ea1-5844-9cf6-b9c51ca7ce8e"

[compat]
Gridap = "~0.20.8"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.12.6"
manifest_format = "2.0"
project_hash = "cb5fbc944b22081daaf8a8a6c04915f344d0d67a"

[[deps.ADTypes]]
git-tree-sha1 = "9b38b82a9fe131f3d331a53b7203d9d1a2a4602c"
uuid = "47edcb42-4c32-4615-8424-f2b9edc5f35b"
version = "1.22.4"

    [deps.ADTypes.extensions]
    ADTypesChainRulesCoreExt = "ChainRulesCore"
    ADTypesConstructionBaseExt = "ConstructionBase"
    ADTypesEnzymeCoreExt = "EnzymeCore"

    [deps.ADTypes.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    ConstructionBase = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
    EnzymeCore = "f151be2c-9106-41f4-ab19-57ee4f262869"

[[deps.AbstractFFTs]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "d92ad398961a3ed262d8bf04a1a2b8340f915fef"
uuid = "621f4979-c628-5d54-868e-fcf4e3e8185c"
version = "1.5.0"

    [deps.AbstractFFTs.extensions]
    AbstractFFTsChainRulesCoreExt = "ChainRulesCore"
    AbstractFFTsTestExt = "Test"

    [deps.AbstractFFTs.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    Test = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.AbstractTrees]]
git-tree-sha1 = "2d9c9a55f9c93e8887ad391fbae72f8ef55e1177"
uuid = "1520ce14-60c1-5f80-bbc7-55ef81b5835c"
version = "0.4.5"

[[deps.Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "daa72978cd7a624246e894a4f4f067706d4e17e2"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "4.7.0"
weakdeps = ["SparseArrays", "StaticArrays"]

    [deps.Adapt.extensions]
    AdaptSparseArraysExt = "SparseArrays"
    AdaptStaticArraysExt = "StaticArrays"

[[deps.ArgCheck]]
git-tree-sha1 = "f9e9a66c9b7be1ad7372bbd9b062d9230c30c5ce"
uuid = "dce04be8-c92d-5529-be00-80e4d2c0e197"
version = "2.5.0"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.2"

[[deps.ArnoldiMethod]]
deps = ["LinearAlgebra", "Random", "StaticArrays"]
git-tree-sha1 = "d57bd3762d308bded22c3b82d033bff85f6195c6"
uuid = "ec485272-7323-5ecc-a04f-4719b315124d"
version = "0.4.0"

[[deps.ArrayInterface]]
deps = ["Adapt", "LinearAlgebra"]
git-tree-sha1 = "60f11b38ebeabd984f5535838d91e197d97202f0"
uuid = "4fba245c-0d91-5ea0-9b3e-6abc04ee57a9"
version = "7.28.1"

    [deps.ArrayInterface.extensions]
    ArrayInterfaceAMDGPUExt = "AMDGPU"
    ArrayInterfaceBandedMatricesExt = "BandedMatrices"
    ArrayInterfaceBlockBandedMatricesExt = "BlockBandedMatrices"
    ArrayInterfaceCUDAExt = "CUDA"
    ArrayInterfaceCUDSSExt = ["CUDSS", "CUDA"]
    ArrayInterfaceChainRulesCoreExt = "ChainRulesCore"
    ArrayInterfaceChainRulesExt = "ChainRules"
    ArrayInterfaceFillArraysExt = "FillArrays"
    ArrayInterfaceGPUArraysCoreExt = "GPUArraysCore"
    ArrayInterfaceMetalExt = "Metal"
    ArrayInterfaceReverseDiffExt = "ReverseDiff"
    ArrayInterfaceSparseArraysExt = "SparseArrays"
    ArrayInterfaceStaticArraysCoreExt = "StaticArraysCore"
    ArrayInterfaceTrackerExt = "Tracker"

    [deps.ArrayInterface.weakdeps]
    AMDGPU = "21141c5a-9bdb-4563-92ae-f87d6854732e"
    BandedMatrices = "aae01518-5342-5314-be14-df237901396f"
    BlockBandedMatrices = "ffab5731-97b5-5995-9138-79e8c1846df0"
    CUDA = "052768ef-5323-5732-b1bb-66c8b64840ba"
    CUDSS = "45b445bb-4962-46a0-9369-b4df9d0f772e"
    ChainRules = "082447d4-558c-5d27-93f4-14fc19e9eca2"
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    FillArrays = "1a297f60-69ca-5386-bcde-b61e274b549b"
    GPUArraysCore = "46192b85-c4d5-4398-a991-12ede77f4527"
    Metal = "dde4c033-4e86-420c-a63e-0dd931031962"
    ReverseDiff = "37e2e3b7-166d-5795-8a7a-e32c996b4267"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
    StaticArraysCore = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
    Tracker = "9f7883ad-71c0-57eb-9f7f-b5c9e6d3789c"

[[deps.ArrayLayouts]]
deps = ["FillArrays", "LinearAlgebra", "StaticArrays"]
git-tree-sha1 = "e0b47732a192dd59b9d079a06d04235e2f833963"
uuid = "4c555306-a7a7-4459-81d9-ec55ddd5c99a"
version = "1.12.2"
weakdeps = ["SparseArrays"]

    [deps.ArrayLayouts.extensions]
    ArrayLayoutsSparseArraysExt = "SparseArrays"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.Atomix]]
deps = ["UnsafeAtomics"]
git-tree-sha1 = "b8651b2eb5796a386b0398a20b519a6a6150f75c"
uuid = "a9b6321e-bd34-4604-b9c9-b65b8de01458"
version = "1.1.3"

    [deps.Atomix.extensions]
    AtomixCUDAExt = "CUDA"
    AtomixMetalExt = "Metal"
    AtomixOpenCLExt = "OpenCL"
    AtomixoneAPIExt = "oneAPI"

    [deps.Atomix.weakdeps]
    CUDA = "052768ef-5323-5732-b1bb-66c8b64840ba"
    Metal = "dde4c033-4e86-420c-a63e-0dd931031962"
    OpenCL = "08131aa3-fb12-5dee-8b74-c09406e224a2"
    oneAPI = "8f75cd03-7ff8-4ecb-9b8f-daf728133b1b"

[[deps.AutoHashEquals]]
git-tree-sha1 = "4ec6b48702dacc5994a835c1189831755e4e76ef"
uuid = "15f4f7f2-30c1-5605-9d31-71845cf9641f"
version = "2.2.0"

[[deps.BSON]]
git-tree-sha1 = "4c3e506685c527ac6a54ccc0c8c76fd6f91b42fb"
uuid = "fbb218c0-5317-5bc6-957e-2ee96dd4b1f0"
version = "0.3.9"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
version = "1.11.0"

[[deps.BitTwiddlingConvenienceFunctions]]
deps = ["Static"]
git-tree-sha1 = "f21cfd4950cb9f0587d5067e69405ad2acd27b87"
uuid = "62783981-4cbd-42fc-bca8-16325de8dc4b"
version = "0.1.6"

[[deps.BlockArrays]]
deps = ["ArrayLayouts", "FillArrays", "LinearAlgebra"]
git-tree-sha1 = "75c9c4d41f387b58ac7ecac17a02062f4cf8e92a"
uuid = "8e7c35d0-a365-5155-bbbb-fb81a777f24e"
version = "1.10.0"

    [deps.BlockArrays.extensions]
    BlockArraysAdaptExt = "Adapt"
    BlockArraysBandedMatricesExt = "BandedMatrices"

    [deps.BlockArrays.weakdeps]
    Adapt = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
    BandedMatrices = "aae01518-5342-5314-be14-df237901396f"

[[deps.CPUSummary]]
deps = ["CpuId", "IfElse", "PrecompileTools", "Preferences", "Static"]
git-tree-sha1 = "f3a21d7fc84ba618a779d1ed2fcca2e682865bab"
uuid = "2a0fbf3d-bb9c-48f3-b0a9-814d99fd7ab9"
version = "0.2.7"

[[deps.ChunkCodecCore]]
git-tree-sha1 = "1a3ad7e16a321667698a19e77362b35a1e94c544"
uuid = "0b6fb165-00bc-4d37-ab8b-79f91016dbe1"
version = "1.0.1"

[[deps.ChunkCodecLibZlib]]
deps = ["ChunkCodecCore", "Zlib_jll"]
git-tree-sha1 = "d4101e848e8d3f585d61d244c2fe0c80a70e6b3b"
uuid = "4c0bbee4-addc-4d73-81a0-b6caacae83c8"
version = "1.1.0"

[[deps.ChunkCodecLibZstd]]
deps = ["ChunkCodecCore", "Zstd_jll"]
git-tree-sha1 = "34d9873079e4cb3d0c62926a225136824677073f"
uuid = "55437552-ac27-4d47-9aa3-63184e8fd398"
version = "1.0.0"

[[deps.CloseOpenIntervals]]
deps = ["Static", "StaticArrayInterface"]
git-tree-sha1 = "05ba0d07cd4fd8b7a39541e31a7b0254704ea581"
uuid = "fb6a15b2-703c-40df-9091-08a04967cfa9"
version = "0.1.13"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "962834c22b66e32aa10f7611c08c8ca4e20749a9"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.8"

[[deps.Combinatorics]]
git-tree-sha1 = "c761b00e7755700f9cdf5b02039939d1359330e1"
uuid = "861a8166-3701-5b0c-9a16-15d98fcdc6aa"
version = "1.1.0"

[[deps.CommonSubexpressions]]
deps = ["MacroTools"]
git-tree-sha1 = "cda2cfaebb4be89c9084adaca7dd7333369715c5"
uuid = "bbf7d656-a473-5ed7-a52c-81e309532950"
version = "0.3.1"

[[deps.CommonWorldInvalidations]]
git-tree-sha1 = "ef2022bff55342a8c9846cdf218f62e475f0444d"
uuid = "f70d9fcc-98c5-4d4a-abd7-e4cdeebd8ca8"
version = "1.1.2"

[[deps.Compat]]
deps = ["TOML", "UUIDs"]
git-tree-sha1 = "9d8a54ce4b17aa5bdce0ea5c34bc5e7c340d16ad"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.18.1"
weakdeps = ["Dates", "LinearAlgebra"]

    [deps.Compat.extensions]
    CompatLinearAlgebraExt = "LinearAlgebra"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.3.0+1"

[[deps.ConstructionBase]]
git-tree-sha1 = "b4b092499347b18a015186eae3042f72267106cb"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.6.0"

    [deps.ConstructionBase.extensions]
    ConstructionBaseIntervalSetsExt = "IntervalSets"
    ConstructionBaseLinearAlgebraExt = "LinearAlgebra"
    ConstructionBaseStaticArraysExt = "StaticArrays"

    [deps.ConstructionBase.weakdeps]
    IntervalSets = "8197267c-284f-5f27-9208-e0e47529a953"
    LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
    StaticArrays = "90137ffa-7385-5640-81b9-e52037218182"

[[deps.CpuId]]
deps = ["Markdown"]
git-tree-sha1 = "fcbb72b032692610bfbdb15018ac16a36cf2e406"
uuid = "adafc99b-e345-5852-983c-f28acb93d879"
version = "0.3.1"

[[deps.DataStructures]]
deps = ["OrderedCollections"]
git-tree-sha1 = "b0bc6d2cad1fed8b7fd59a1551a991cb3d2809e6"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.19.6"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.DiffResults]]
deps = ["StaticArraysCore"]
git-tree-sha1 = "782dd5f4561f5d267313f23853baaaa4c52ea621"
uuid = "163ba53b-c6d8-5494-b064-1a9d43ac40c5"
version = "1.1.0"

[[deps.DiffRules]]
deps = ["IrrationalConstants", "LogExpFunctions", "NaNMath", "Random", "SpecialFunctions"]
git-tree-sha1 = "79a2aca180a85c690c58a020d47b426954b590f8"
uuid = "b552c78f-8df3-52c6-915a-8e097449b14b"
version = "1.16.0"

[[deps.DifferentiationInterface]]
deps = ["ADTypes", "LinearAlgebra"]
git-tree-sha1 = "dbd46a5cd0e79a97438b0ebbec42e744e8f436fe"
uuid = "a0c0ee7d-e4b9-4e03-894e-1c5f64a51d63"
version = "0.7.20"

    [deps.DifferentiationInterface.extensions]
    DifferentiationInterfaceChainRulesCoreExt = "ChainRulesCore"
    DifferentiationInterfaceDiffractorExt = "Diffractor"
    DifferentiationInterfaceEnzymeExt = ["EnzymeCore", "Enzyme"]
    DifferentiationInterfaceFastDifferentiationExt = "FastDifferentiation"
    DifferentiationInterfaceFiniteDiffExt = "FiniteDiff"
    DifferentiationInterfaceFiniteDifferencesExt = "FiniteDifferences"
    DifferentiationInterfaceForwardDiffExt = ["ForwardDiff", "DiffResults"]
    DifferentiationInterfaceGPUArraysCoreExt = ["GPUArraysCore", "Adapt"]
    DifferentiationInterfaceGTPSAExt = "GTPSA"
    DifferentiationInterfaceHyperHessiansExt = "HyperHessians"
    DifferentiationInterfaceMooncakeExt = "Mooncake"
    DifferentiationInterfacePolyesterForwardDiffExt = ["PolyesterForwardDiff", "ForwardDiff", "DiffResults"]
    DifferentiationInterfaceReverseDiffExt = ["ReverseDiff", "DiffResults"]
    DifferentiationInterfaceSparseArraysExt = "SparseArrays"
    DifferentiationInterfaceSparseConnectivityTracerExt = "SparseConnectivityTracer"
    DifferentiationInterfaceSparseMatrixColoringsExt = "SparseMatrixColorings"
    DifferentiationInterfaceStaticArraysExt = "StaticArrays"
    DifferentiationInterfaceSymbolicsExt = "Symbolics"
    DifferentiationInterfaceTrackerExt = "Tracker"
    DifferentiationInterfaceZygoteExt = ["Zygote", "ForwardDiff"]

    [deps.DifferentiationInterface.weakdeps]
    Adapt = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    DiffResults = "163ba53b-c6d8-5494-b064-1a9d43ac40c5"
    Diffractor = "9f5e2b26-1114-432f-b630-d3fe2085c51c"
    Enzyme = "7da242da-08ed-463a-9acd-ee780be4f1d9"
    EnzymeCore = "f151be2c-9106-41f4-ab19-57ee4f262869"
    FastDifferentiation = "eb9bf01b-bf85-4b60-bf87-ee5de06c00be"
    FiniteDiff = "6a86dc24-6348-571c-b903-95158fe2bd41"
    FiniteDifferences = "26cc04aa-876d-5657-8c51-4c34ba976000"
    ForwardDiff = "f6369f11-7733-5829-9624-2563aa707210"
    GPUArraysCore = "46192b85-c4d5-4398-a991-12ede77f4527"
    GTPSA = "b27dd330-f138-47c5-815b-40db9dd9b6e8"
    HyperHessians = "06b494a0-c8e0-40cc-ad32-d99506a00a6c"
    Mooncake = "da2b9cff-9c12-43a0-ae48-6db2b0edb7d6"
    PolyesterForwardDiff = "98d1487c-24ca-40b6-b7ab-df2af84e126b"
    ReverseDiff = "37e2e3b7-166d-5795-8a7a-e32c996b4267"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
    SparseConnectivityTracer = "9f842d2f-2579-4b1d-911e-f412cf18a3f5"
    SparseMatrixColorings = "0a514795-09f3-496d-8182-132a7b665d35"
    StaticArrays = "90137ffa-7385-5640-81b9-e52037218182"
    Symbolics = "0c5d862f-8b57-4792-8d23-62f2024744c7"
    Tracker = "9f7883ad-71c0-57eb-9f7f-b5c9e6d3789c"
    Zygote = "e88e6eb3-aa80-5325-afca-941959d7151f"

[[deps.Distances]]
deps = ["LinearAlgebra", "Statistics", "StatsAPI"]
git-tree-sha1 = "c7e3a542b999843086e2f29dac96a618c105be1d"
uuid = "b4f34e82-e78d-54a5-968a-f98e89d6e8f7"
version = "0.10.12"

    [deps.Distances.extensions]
    DistancesChainRulesCoreExt = "ChainRulesCore"
    DistancesSparseArraysExt = "SparseArrays"

    [deps.Distances.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"
version = "1.11.0"

[[deps.DocStringExtensions]]
git-tree-sha1 = "7442a5dfe1ebb773c29cc2962a8980f47221d76c"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.5"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.7.0"

[[deps.FFTW]]
deps = ["AbstractFFTs", "FFTW_jll", "Libdl", "LinearAlgebra", "MKL_jll", "Preferences", "Reexport"]
git-tree-sha1 = "97f08406df914023af55ade2f843c39e99c5d969"
uuid = "7a1cc6ca-52ef-59f5-83cd-3a7055c09341"
version = "1.10.0"

[[deps.FFTW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6866aec60ef98e3164cd8d6855225684207e9dff"
uuid = "f5851436-0d7a-5f13-b9de-f02708fd171a"
version = "3.3.12+0"

[[deps.FastGaussQuadrature]]
deps = ["LinearAlgebra", "SpecialFunctions", "StaticArrays"]
git-tree-sha1 = "4916117dd032ec5959b7633aedbbac408ca5ddeb"
uuid = "442a2c76-b920-505d-bb47-c5924d526838"
version = "1.3.0"

[[deps.FileIO]]
deps = ["Pkg", "Requires", "UUIDs"]
git-tree-sha1 = "6621fef488e496356c9c9625d0562c12a6070819"
uuid = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
version = "1.20.0"

    [deps.FileIO.extensions]
    HTTPExt = "HTTP"

    [deps.FileIO.weakdeps]
    HTTP = "cd3eb016-35fb-5094-929b-558a96fad6f3"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"
version = "1.11.0"

[[deps.FillArrays]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "5bad39456d9f0166184fce2248783dd9862645c1"
uuid = "1a297f60-69ca-5386-bcde-b61e274b549b"
version = "1.17.0"

    [deps.FillArrays.extensions]
    FillArraysPDMatsExt = "PDMats"
    FillArraysSparseArraysExt = "SparseArrays"
    FillArraysStaticArraysExt = "StaticArrays"
    FillArraysStatisticsExt = "Statistics"

    [deps.FillArrays.weakdeps]
    PDMats = "90014a1f-27ba-587c-ab20-58faa44d9150"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
    StaticArrays = "90137ffa-7385-5640-81b9-e52037218182"
    Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.FiniteDiff]]
deps = ["ArrayInterface", "LinearAlgebra", "Setfield"]
git-tree-sha1 = "0a155bdf6f00bfe7f80adc3e7e5aae19851fbea1"
uuid = "6a86dc24-6348-571c-b903-95158fe2bd41"
version = "2.32.1"

    [deps.FiniteDiff.extensions]
    FiniteDiffBandedMatricesExt = "BandedMatrices"
    FiniteDiffBlockBandedMatricesExt = "BlockBandedMatrices"
    FiniteDiffSparseArraysExt = "SparseArrays"
    FiniteDiffStaticArraysExt = "StaticArrays"

    [deps.FiniteDiff.weakdeps]
    BandedMatrices = "aae01518-5342-5314-be14-df237901396f"
    BlockBandedMatrices = "ffab5731-97b5-5995-9138-79e8c1846df0"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
    StaticArrays = "90137ffa-7385-5640-81b9-e52037218182"

[[deps.ForwardDiff]]
deps = ["CommonSubexpressions", "DiffResults", "DiffRules", "LinearAlgebra", "LogExpFunctions", "NaNMath", "Preferences", "Printf", "Random", "SpecialFunctions"]
git-tree-sha1 = "1b86cca764a61dcac4fef4c5e16e378e5ed6953c"
uuid = "f6369f11-7733-5829-9624-2563aa707210"
version = "1.4.5"
weakdeps = ["StaticArrays"]

    [deps.ForwardDiff.extensions]
    ForwardDiffStaticArraysExt = "StaticArrays"

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"
version = "1.11.0"

[[deps.Gamma]]
git-tree-sha1 = "86f86b6168a016ed88e4ae4e64577b98c3b59e8e"
uuid = "a0844989-3bd2-4988-8bea-c9407ab0941b"
version = "1.1.0"

[[deps.Graphs]]
deps = ["ArnoldiMethod", "DataStructures", "Inflate", "LinearAlgebra", "Random", "SimpleTraits", "SparseArrays", "Statistics"]
git-tree-sha1 = "7eb45fe833a5b7c51cf6d89c5a841d5967e44be3"
uuid = "86223c79-3864-5bf0-83f7-82e725a168b6"
version = "1.14.0"

    [deps.Graphs.extensions]
    GraphsSharedArraysExt = "SharedArrays"

    [deps.Graphs.weakdeps]
    Distributed = "8ba89e20-285c-5b6f-9357-94700520ee1b"
    SharedArrays = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[deps.Gridap]]
deps = ["AbstractTrees", "AutoHashEquals", "BSON", "BlockArrays", "Combinatorics", "DataStructures", "DocStringExtensions", "FastGaussQuadrature", "FileIO", "FillArrays", "ForwardDiff", "Graphs", "JLD2", "JSON", "LineSearches", "LinearAlgebra", "NLsolve", "NearestNeighbors", "PolynomialBases", "Preferences", "QuadGK", "Random", "SparseArrays", "SparseMatricesCSR", "StaticArrays", "Statistics", "Test", "WriteVTK"]
git-tree-sha1 = "95fd6ec47697c8f031398434a119abe747330715"
uuid = "56d4f2e9-7ea1-5844-9cf6-b9c51ca7ce8e"
version = "0.20.8"

    [deps.Gridap.extensions]
    TikzPicturesExt = "TikzPictures"

    [deps.Gridap.weakdeps]
    TikzPictures = "37f6aa50-8035-52d0-81c2-5a1d08754b2d"

[[deps.HashArrayMappedTries]]
git-tree-sha1 = "2eaa69a7cab70a52b9687c8bf950a5a93ec895ae"
uuid = "076d061b-32b6-4027-95e0-9a2c6f6d7e74"
version = "0.2.0"

[[deps.IfElse]]
git-tree-sha1 = "debdd00ffef04665ccbb3e150747a77560e8fad1"
uuid = "615f187c-cbe4-4ef1-ba3b-2fcf58d6d173"
version = "0.1.1"

[[deps.Inflate]]
git-tree-sha1 = "d1b1b796e47d94588b3757fe84fbf65a5ec4a80d"
uuid = "d25df0c9-e2be-5dd7-82c8-3ad0b3e990b9"
version = "0.1.5"

[[deps.IntelOpenMP_jll]]
deps = ["Artifacts", "JLLWrappers", "LazyArtifacts", "Libdl"]
git-tree-sha1 = "ec1debd61c300961f98064cfb21287613ad7f303"
uuid = "1d5cc7b8-4909-519e-a0f8-d0f5ad9712d0"
version = "2025.2.0+0"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"
version = "1.11.0"

[[deps.IrrationalConstants]]
git-tree-sha1 = "b2d91fe939cae05960e760110b328288867b5758"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.2.6"

[[deps.JLD2]]
deps = ["ChunkCodecLibZlib", "ChunkCodecLibZstd", "FileIO", "MacroTools", "Mmap", "OrderedCollections", "PrecompileTools", "ScopedValues"]
git-tree-sha1 = "9ebadf3f8f0de07031359917549bbdadc23f5dc3"
uuid = "033835bb-8acc-5ee8-8aae-3f567f8a3819"
version = "0.6.5"

    [deps.JLD2.extensions]
    UnPackExt = "UnPack"

    [deps.JLD2.weakdeps]
    UnPack = "3a884ed6-31ef-47d7-9d2a-63182c4928ed"

[[deps.JLLWrappers]]
deps = ["Artifacts", "Preferences"]
git-tree-sha1 = "7204148362dafe5fe6a273f855b8ccbe4df8173e"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.8.0"

[[deps.JSON]]
deps = ["Dates", "Logging", "Parsers", "PrecompileTools", "StructUtils", "UUIDs", "Unicode"]
git-tree-sha1 = "65979512c25a0727f050e6e4be40f0fd9ec893f7"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "1.7.0"

    [deps.JSON.extensions]
    JSONArrowExt = ["ArrowTypes"]

    [deps.JSON.weakdeps]
    ArrowTypes = "31f734f8-188a-4ce0-8406-c8a06bd891cd"

[[deps.JuliaSyntaxHighlighting]]
deps = ["StyledStrings"]
uuid = "ac6e5ff7-fb65-4e79-a425-ec3bc9c03011"
version = "1.12.0"

[[deps.LayoutPointers]]
deps = ["ArrayInterface", "LinearAlgebra", "ManualMemory", "SIMDTypes", "Static", "StaticArrayInterface"]
git-tree-sha1 = "a9eaadb366f5493a5654e843864c13d8b107548c"
uuid = "10f19ff3-798f-405d-979b-55457f8fc047"
version = "0.1.17"

[[deps.LazyArtifacts]]
deps = ["Artifacts", "Pkg"]
uuid = "4af54fe1-eca0-43a8-85a7-787d91b784e3"
version = "1.11.0"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "OpenSSL_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.15.0+0"

[[deps.LibGit2]]
deps = ["LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"
version = "1.11.0"

[[deps.LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "OpenSSL_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.9.0+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "OpenSSL_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.3+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "be484f5c92fad0bd8acfef35fe017900b0b73809"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.18.0+0"

[[deps.LightXML]]
deps = ["Libdl", "XML2_jll"]
git-tree-sha1 = "aa971a09f0f1fe92fe772713a564aa48abe510df"
uuid = "9c8b4983-aa76-5018-a973-4c85ecc9e179"
version = "0.9.3"

[[deps.LineSearches]]
deps = ["LinearAlgebra", "NLSolversBase", "NaNMath", "Printf"]
git-tree-sha1 = "9ea3422d03222c6de679934d1c08f0a99405aa03"
uuid = "d3d80556-e9d4-5f37-9878-2ab0fcc64255"
version = "7.5.1"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.12.0"

[[deps.LogExpFunctions]]
deps = ["DocStringExtensions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "bba2d9aa057d8f126415de240573e86a8f39d2a1"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "1.0.1"

    [deps.LogExpFunctions.extensions]
    LogExpFunctionsChainRulesCoreExt = "ChainRulesCore"
    LogExpFunctionsChangesOfVariablesExt = "ChangesOfVariables"
    LogExpFunctionsInverseFunctionsExt = "InverseFunctions"

    [deps.LogExpFunctions.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    ChangesOfVariables = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
    InverseFunctions = "3587e190-3f89-42d0-90ee-14403ec27112"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"
version = "1.11.0"

[[deps.MKL_jll]]
deps = ["Artifacts", "IntelOpenMP_jll", "JLLWrappers", "LazyArtifacts", "Libdl", "oneTBB_jll"]
git-tree-sha1 = "282cadc186e7b2ae0eeadbd7a4dffed4196ae2aa"
uuid = "856f044c-d86e-5d09-b602-aeab76dc8ba7"
version = "2025.2.0+0"

[[deps.MacroTools]]
git-tree-sha1 = "1e0228a030642014fe5cfe68c2c0a818f9e3f522"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.16"

[[deps.ManualMemory]]
git-tree-sha1 = "bcaef4fc7a0cfe2cba636d84cda54b5e4e4ca3cd"
uuid = "d125e4d3-2237-4719-b19c-fa641b8a4667"
version = "0.1.8"

[[deps.Markdown]]
deps = ["Base64", "JuliaSyntaxHighlighting", "StyledStrings"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"
version = "1.11.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
version = "1.11.0"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2025.11.4"

[[deps.NLSolversBase]]
deps = ["ADTypes", "DifferentiationInterface", "Distributed", "FiniteDiff", "ForwardDiff"]
git-tree-sha1 = "25a6638571a902ecfb1ae2a18fc1575f86b1d4df"
uuid = "d41bc354-129a-5804-8e4c-c37616107c6c"
version = "7.10.0"

[[deps.NLsolve]]
deps = ["Distances", "LineSearches", "LinearAlgebra", "NLSolversBase", "Printf", "Reexport"]
git-tree-sha1 = "019f12e9a1a7880459d0173c182e6a99365d7ac1"
uuid = "2774e3e8-f4cf-5e23-947b-6d7e65073b56"
version = "4.5.1"

[[deps.NaNMath]]
deps = ["OpenLibm_jll"]
git-tree-sha1 = "dbd2e8cd2c1c27f0b584f6661b4309609c5a685e"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.1.4"

[[deps.NearestNeighbors]]
deps = ["AbstractTrees", "Distances", "StaticArrays"]
git-tree-sha1 = "576eb4656529c12e77a46b17c23103dfba9fa570"
uuid = "b8a86587-4115-5ab1-83bc-aa920d37bbce"
version = "0.4.29"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.3.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.29+0"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"
version = "0.8.7+0"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "3.5.4+0"

[[deps.OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1346c9208249809840c91b26703912dff463d335"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.6+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "05f45c2e0de6259db764adbfd2f1dc6d3f8de13c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "2.0.1"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "3de8f5e6e90ebfa8d6d1f86997d6cdcd6a912ff3"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.7"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "Random", "SHA", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.12.1"

    [deps.Pkg.extensions]
    REPLExt = "REPL"

    [deps.Pkg.weakdeps]
    REPL = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Polyester]]
deps = ["ArrayInterface", "BitTwiddlingConvenienceFunctions", "CPUSummary", "IfElse", "ManualMemory", "PolyesterWeave", "Static", "StaticArrayInterface", "StrideArraysCore", "ThreadingUtilities"]
git-tree-sha1 = "16bbc30b5ebea91e9ce1671adc03de2832cff552"
uuid = "f517fe37-dbe3-4b94-8317-1923a5111588"
version = "0.7.19"

[[deps.PolyesterWeave]]
deps = ["BitTwiddlingConvenienceFunctions", "CPUSummary", "IfElse", "Static", "ThreadingUtilities"]
git-tree-sha1 = "645bed98cd47f72f67316fd42fc47dee771aefcd"
uuid = "1d0040c9-8b98-4ee7-8388-3f51789ca0ad"
version = "0.2.2"

[[deps.PolynomialBases]]
deps = ["ArgCheck", "AutoHashEquals", "FFTW", "FastGaussQuadrature", "Gamma", "LinearAlgebra", "SimpleUnPack"]
git-tree-sha1 = "aad7373f64ef33ce21924bccb90c71c9986df932"
uuid = "c74db56a-226d-5e98-8bb0-a6049094aeea"
version = "0.4.28"

    [deps.PolynomialBases.extensions]
    PolynomialBasesSymEngineExt = "SymEngine"
    PolynomialBasesSymPyExt = "SymPy"
    PolynomialBasesSymPyPythonCallExt = "SymPyPythonCall"

    [deps.PolynomialBases.weakdeps]
    SymEngine = "123dc426-2d89-5057-bbad-38513e3affd8"
    SymPy = "24249f21-da20-56a4-8eb1-6a02cf4ae2e6"
    SymPyPythonCall = "bc8888f7-b21e-4b7c-a06a-5d9c9496438c"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "edbeefc7a4889f528644251bdb5fc9ab5348bc2c"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.3.4"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "8b770b60760d4451834fe79dd483e318eee709c4"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.5.2"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.QuadGK]]
deps = ["DataStructures", "LinearAlgebra"]
git-tree-sha1 = "5e8e8b0ab68215d7a2b14b9921a946fee794749e"
uuid = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"
version = "2.11.3"

    [deps.QuadGK.extensions]
    QuadGKEnzymeExt = "Enzyme"

    [deps.QuadGK.weakdeps]
    Enzyme = "7da242da-08ed-463a-9acd-ee780be4f1d9"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "62389eeff14780bfe55195b7204c0d8738436d64"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.1"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.SIMDTypes]]
git-tree-sha1 = "330289636fb8107c5f32088d2741e9fd7a061a5c"
uuid = "94e857df-77ce-4151-89e5-788b33177be4"
version = "0.1.0"

[[deps.SciMLPublic]]
git-tree-sha1 = "cf9aaf8b9ed5db993259ea8b24cf2b7ba9bd3b79"
uuid = "431bcebd-1456-4ced-9d72-93c2757fff0b"
version = "1.2.4"

[[deps.ScopedValues]]
deps = ["HashArrayMappedTries", "Logging"]
git-tree-sha1 = "67a144433c4ce877ee6d1ada69a124d6b1ecf7be"
uuid = "7e506255-f358-4e82-b7e4-beb19740aa63"
version = "1.6.2"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
version = "1.11.0"

[[deps.Setfield]]
deps = ["ConstructionBase", "Future", "MacroTools", "StaticArraysCore"]
git-tree-sha1 = "c5391c6ace3bc430ca630251d02ea9687169ca68"
uuid = "efcf1570-3423-57d1-acb7-fd33fddbac46"
version = "1.1.2"

[[deps.SimpleTraits]]
deps = ["InteractiveUtils", "MacroTools"]
git-tree-sha1 = "7ddb0b49c109481b046972c0e4ab02b2127d6a75"
uuid = "699a6c99-e7fa-54fc-8d76-47d257e15c1d"
version = "0.9.6"

[[deps.SimpleUnPack]]
git-tree-sha1 = "58e6353e72cde29b90a69527e56df1b5c3d8c437"
uuid = "ce78b400-467f-4804-87d8-8f486da07d0a"
version = "1.1.0"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"
version = "1.11.0"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
version = "1.12.0"

[[deps.SparseMatricesCSR]]
deps = ["Atomix", "LinearAlgebra", "Polyester", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "914e64f3d7a3c7452200c2c637ad12f1aae8aacb"
uuid = "a0a7dd2c-ebf4-11e9-1f05-cf50bc540ca1"
version = "0.6.12"

[[deps.SpecialFunctions]]
deps = ["IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "c3ac026e735264e9bdc6a9bcbd1b1e781b36e3bc"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.8.3"

    [deps.SpecialFunctions.extensions]
    SpecialFunctionsChainRulesCoreExt = "ChainRulesCore"

    [deps.SpecialFunctions.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"

[[deps.Static]]
deps = ["CommonWorldInvalidations", "IfElse", "PrecompileTools", "SciMLPublic"]
git-tree-sha1 = "4abff9ad312e476839c25b9398f619255af9a0e4"
uuid = "aedffcd0-7271-4cad-89d0-dc628f76c6d3"
version = "1.4.5"

[[deps.StaticArrayInterface]]
deps = ["ArrayInterface", "Compat", "IfElse", "LinearAlgebra", "PrecompileTools", "SciMLPublic", "Static"]
git-tree-sha1 = "2a635e15d5035c53b345077c947f31ff91744078"
uuid = "0d7ed370-da01-4f52-bd93-41d350b8b718"
version = "1.10.0"

    [deps.StaticArrayInterface.extensions]
    StaticArrayInterfaceOffsetArraysExt = "OffsetArrays"
    StaticArrayInterfaceStaticArraysExt = "StaticArrays"

    [deps.StaticArrayInterface.weakdeps]
    OffsetArrays = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
    StaticArrays = "90137ffa-7385-5640-81b9-e52037218182"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "PrecompileTools", "Random", "StaticArraysCore"]
git-tree-sha1 = "246a8bb2e6667f832eea063c3a56aef96429a3db"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.9.18"

    [deps.StaticArrays.extensions]
    StaticArraysChainRulesCoreExt = "ChainRulesCore"
    StaticArraysStatisticsExt = "Statistics"

    [deps.StaticArrays.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StaticArraysCore]]
git-tree-sha1 = "6ab403037779dae8c514bad259f32a447262455a"
uuid = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
version = "1.4.4"

[[deps.Statistics]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "ae3bb1eb3bba077cd276bc5cfc337cc65c3075c0"
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.11.1"
weakdeps = ["SparseArrays"]

    [deps.Statistics.extensions]
    SparseArraysExt = ["SparseArrays"]

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "178ed29fd5b2a2cfc3bd31c13375ae925623ff36"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.8.0"

[[deps.StrideArraysCore]]
deps = ["ArrayInterface", "CloseOpenIntervals", "IfElse", "LayoutPointers", "LinearAlgebra", "ManualMemory", "SIMDTypes", "Static", "StaticArrayInterface", "ThreadingUtilities"]
git-tree-sha1 = "5316097111523c9a970596a5b33cfea5f92e8581"
uuid = "7792a7ef-975c-4747-a70f-980b88e8d1da"
version = "0.5.9"

[[deps.StructUtils]]
deps = ["Dates", "UUIDs"]
git-tree-sha1 = "a99e557661bfcee04af1ba688ab6c211b25327f9"
uuid = "ec057cc2-7a8d-4b58-b3b3-92acb9f63b42"
version = "2.8.3"

    [deps.StructUtils.extensions]
    StructUtilsMeasurementsExt = ["Measurements"]
    StructUtilsStaticArraysCoreExt = ["StaticArraysCore"]
    StructUtilsTablesExt = ["Tables"]

    [deps.StructUtils.weakdeps]
    Measurements = "eff96d63-e80a-5855-80a2-b1b0885c5ab7"
    StaticArraysCore = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
    Tables = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"

[[deps.StyledStrings]]
uuid = "f489334b-da3d-4c2e-b8f0-e476e12c162b"
version = "1.11.0"

[[deps.SuiteSparse]]
deps = ["Libdl", "LinearAlgebra", "Serialization", "SparseArrays"]
uuid = "4607b0f0-06f3-5cda-b6b1-a6196a1729e9"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "7.8.3+2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"
version = "1.11.0"

[[deps.ThreadingUtilities]]
deps = ["ManualMemory"]
git-tree-sha1 = "7c73336785b21f723f5b143f6e99cf6c43b37dc1"
uuid = "8290d209-cae3-49c0-8002-c8c24d57dab5"
version = "0.5.6"

[[deps.TranscodingStreams]]
git-tree-sha1 = "0c45878dcfdcfa8480052b6ab162cdd138781742"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.11.3"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"
version = "1.11.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.UnsafeAtomics]]
git-tree-sha1 = "0f30765c32d66d58e41f4cb5624d4fc8a82ec13b"
uuid = "013be700-e6cd-48c3-b4a1-df204f14c38f"
version = "0.3.1"

    [deps.UnsafeAtomics.extensions]
    UnsafeAtomicsLLVM = ["LLVM"]

    [deps.UnsafeAtomics.weakdeps]
    LLVM = "929cbde3-209d-540e-8aea-75f648917ca0"

[[deps.VTKBase]]
git-tree-sha1 = "c2d0db3ef09f1942d08ea455a9e252594be5f3b6"
uuid = "4004b06d-e244-455f-a6ce-a5f9919cc534"
version = "1.0.1"

[[deps.WriteVTK]]
deps = ["Base64", "CodecZlib", "FillArrays", "LightXML", "TranscodingStreams", "VTKBase"]
git-tree-sha1 = "073f2ae23cc1aa11510772d4c156435cdb8d7087"
uuid = "64499a7a-5c06-52f2-abe2-ccb03c286192"
version = "1.22.0"

[[deps.XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Zlib_jll"]
git-tree-sha1 = "3f3315d89fc954a28f5b471bce698ed6e27481be"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.15.3+0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.3.1+2"

[[deps.Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "446b23e73536f84e8037f5dce465e92275f6a308"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.7+1"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.15.0+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.64.0+1"

[[deps.oneTBB_jll]]
deps = ["Artifacts", "JLLWrappers", "LazyArtifacts", "Libdl"]
git-tree-sha1 = "da8c1f6eee04831f14edcfa5dae611d309807e57"
uuid = "1317d2d5-d96f-522e-a858-c73665f53c3e"
version = "2022.3.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.7.0+0"
"""

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
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
