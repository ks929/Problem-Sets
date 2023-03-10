"""
    _recursive_compound_parser()

TODO: Describe what this function does, the args and what we expect it to return
    This function is a recursion that goes through a for loop that inputs the alphabet and numbers into a function to output the name, formula, and composition through an implemented parser.
"""
function _recursive_compound_parser(q::Queue{Char}, alphabet::Array{Char,1}, numbers::Array{Int64,1})

    if (isempty(q) == true)
        return nothing
    else
        next_char = dequeue!(q)
        if (isnumeric(next_char) == false)
                push!(alphabet,next_char)

        
        elseif (isempty(q) == false)
            next_char2 = dequeue!(q)
                   
            if (isnumeric(next_char2) == true)
                bignum = string(next_char,next_char2)
                numbers2 = parse(Int, bignum)
                push!(numbers,numbers2)
            else
                push!(numbers,parse(Int,next_char))
                push!(alphabet,next_char2)
            end

        else 
            push!(numbers,parse(Int,next_char))
        end
    end


    _recursive_compound_parser(q, alphabet, numbers);
end 

"""
    recursive_compound_parser(compounds::Dict{String, MyChemicalCompoundModel}) -> Dict{String, MyChemicalCompoundModel}
Sets up the things used by the recursive decent process and spits out the dictionary that gets compiled.
    recursive_compound_parser(string::String;delim::Char=' ')::Dict{Int64,String}

TODO: Describe what this function does, the args and what we expect it to return 
This function goes through each compound and organizes it into the composition output that we see at the end. The queue has it in order and one element can be taken out at any time and be analyzed.
"""
function recursive_compound_parser(compounds::Dict{String, MyChemicalCompoundModel})::Dict{String, MyChemicalCompoundModel}

    # process each compound
      for(name, model) ∈ compounds
    composition = Dict{Char,Int}()
        q = Queue{Char}()
        alphabet = Array{Char,1}()
        numbers = Array{Int64,1}()
        character_arr = collect(model.compound)
      
        for c ∈ character_arr
            enqueue!(q, c);
        end
    
        # recursive descent -
        _recursive_compound_parser(q, alphabet, numbers);
       

        counter = 1
         for mol ∈ alphabet
             composition[mol] = numbers[counter] 
             counter += 1
         end

        model.composition = composition
    end


    

    # return the updated dictionary
    return compounds
end
