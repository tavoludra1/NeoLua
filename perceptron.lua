function step_activation(x)
  if x > 0 then
    return 1
  else
    return 0
  end
end

function biased_perceptron(inputs, weights, bias)
  local sum = bias  -- Initialize sum with the bias
  for i = 1, #inputs do
    sum = sum + inputs[i] * weights[i]
  end
  return step_activation(sum)
end

-- Perceptron 1
local inputs1 = {0.5, 0.7, 0.1}
local weights1 = {0.2, 0.8, -0.5}
local bias1 = 0.3
local output1 = biased_perceptron(inputs1, weights1, bias1)
print("Perceptron 1 output:", output1) --1

-- Perceptron 2
local inputs2 = {0.1, -0.3, 0.9}
local weights2 = {-0.1, 0.5, 0.3}
local bias2 = -0.2
local output2 = biased_perceptron(inputs2, weights2, bias2)
print("Perceptron 2 output:", output2) --0

-- Perceptron 3
local inputs3 = {0.8, 0.2, -0.7}
local weights3 = {0.3, -0.2, 0.9}
local bias3 = 0.5
local output3 = biased_perceptron(inputs2, weights2, bias2)
print("Perceptron 3 output:", output3) --0
