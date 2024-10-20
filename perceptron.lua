---
--- This function implements the step activation function
---
--- @param x number The input to the activation function
--- @return number The output of the activation funcition (1 if x > 0)
---

function step_activation(x)
   if x > 0 then
      return 1
   else
      return 0
   end
end

---
--- This function implements a biased perceptron
---
--- @param inputs table A list of inputs values.
--- @param weights table A list of weights corresponding to the inputs.
--- @param bias number The bias value of the perceptron.
--- @return number The output of the perceptron after applying the activation function.
---
function biased_perceptron(inputs, weights, bias)
   local sum = bias -- Initialize sum with the bias
   for i = 1, #inputs do
      sum = sum + inputs[i] * weights[i]
   end
   return step_activation(sum)
end

-- Define lists of inputs, weights, biases
local inputs_list = {
  {0.5, 0.7, 0.1},  -- Inputs for Perceptron 1
  {0.1, -0.3, 0.9}, -- Inputs for Perceptron 2
  {0.8, 0.2, -0.7}  -- Inputs for Perceptron 3
}

local weights_list = {
  {0.2, 0.8, -0.5}, -- Weights for Perceptron 1
  {-0.1, 0.5, 0.3}, -- Weights for Perceptron 2
  {0.3, -0.2, 0.9}  -- Weights for Perceptron 3
}

local biases = {0.3, -0.2, 0.5} -- Biases for the perceptron

-- Calculate outputs for each perceptron
for i = 1, #inputs_list do
   local output = biased_perceptron(inputs_list[i], weights_list[i], biases[i])
   print("Perceptron " .. i .." output:", output)
end

