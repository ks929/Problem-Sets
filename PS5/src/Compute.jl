"""
    build_data_matrix(data::DataFrame) --> Array{Float64,2}

Computes the experimental data matrix X. The data matrix X will be a experiments*repeats x 2 matrix
with the first column being all 1's and the second column being a 1/S value.
"""
function build_data_matrix(data::DataFrame)::Array{Float64,2}

    # initialize -
    iterate = 3;
    
    # get the size of the data -
    (R,C) = size(data);

    # build an 1/s array -
    matrixarray = Array{Float64,1}();
    for i ∈ 1:R
        value = data[i,:S];
        for j ∈ 1:iterate
            push!(matrixarray,(1/(value)));
        end
    end

    # construct the data matrix -
    Data_matrix = Array{Float64,2}(undef, iterate*R, 2);
    for i ∈ 1:iterate:(iterate*R)
        for j ∈ i:(i+iterate-1)
            
            # get the S level -
            value = matrixarray[j];
            
            # fill in the columns of the data matrix -
            Data_matrix[j,1] = 1.0;
            Data_matrix[j,2] = value
        end
    end

    # return -
    return Data_matrix
end

"""
    build_output_vector(data::DataFrame) --> Array{Float64,1}

Computes the output vector Y from the experimental data. 
The output vector will be a experiments*repeats x 1 vector holding the 1/v values.
"""
function build_output_vector(data::DataFrame)::Array{Float64,1}

    # initialize -
    iterate = 3;

    # get the size of the data -
    (R,C) = size(data);

    # build the output array -
    vectorarray = Array{Float64,1}();
    for i ∈ 1:R
        for j ∈ 1:iterate
            value2 = data[i,j+1];
            push!(vectorarray, (1/value2));
        end
    end

    # return -
    return vectorarray;
end

"""
    build_error_distribution(residuals::Array{Float64,1}) -> Normal

Takes a vector of errors, and fits a Normal Distribution by computing the sample mean and standard
deviation.

See: https://juliastats.org/Distributions.jl/stable/univariate/#Distributions.Normal
"""
function build_error_distribution(residuals::Array{Float64,1})::Normal

    # initialize -
    μ = 0.0; # default value, replace with your value
    σ = 0.0; # default value, replace with your value

    # compute the mean, and std of the residuals -
    μ = mean(residuals);
    σ = std(residuals);

    # return -
    return Normal(μ, σ);
end

