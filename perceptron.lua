---
--- The name of perceptron is changed to neuron since it's a
--- more general concept inspired by biological neurons in the brain.
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
--- This function implements a biased neuron.
---
--- @param inputs table A list of inputs values.
--- @param weights table A list of weights corresponding to the inputs.
--- @param bias number The bias value of the perceptron.
--- @return number The output of the perceptron after applying the activation function.
---
function biased_neuron(inputs, weights, bias)
   local sum = bias -- Initialize sum with the bias
   for i = 1, #inputs do
      sum = sum + inputs[i] * weights[i]
   end
   return step_activation(sum)
end

---
--- Calculates the outputs of a layer of neurons.
---
--- @param inputs table A list of input values to the layer.
--- @param weights table A list of weights list, one for each layer
--- @param biases table A list of bias values, one for each neuron.
--- @return table A list of output values from the layer.

function calculate_layer_outputs(inputs, weights, biases)
   local layer_outputs = {} -- Initialize an empty list to store the outputs.

   -- Iterate over each neuron in the layer
   for i = 1, #weights do
      local neuron_weights = weights[i]
      local neuron_bias = biases[i]
      local neuron_output = 0

      -- Calculate the weighted sum of inputs for the neuron
      for j = 1, #inputs do
	 neuron_output = neuron_output + inputs[j] * neuron_weights[j]
      end

      -- Add the bias to the neuron's output
      neuron_output = neuron_output + neuron_bias

      -- Append the neuron's output to the layer's output list
      table.insert(layer_outputs, neuron_output)
   end

   return layer_outputs
end


--- EXAMPLE ....


local inputs = {0.5, 0.8, 0.1}
local weights = {{0.2, 0.3, 0.5}, {0.1, -0.5, 0.8}} -- Weights for two neurons
local biases = {0.3, 0.2} -- Biases for two neurons


local outputs = calculate_layer_outputs(inputs, weights, biases)

-- Print the outputs in a more organized way
print("Layer outputs:")
for i, output in ipairs(outputs) do
  print("  Neuron " .. i .. ": " .. output)
end

